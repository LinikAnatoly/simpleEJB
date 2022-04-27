//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransportRoute2RQFKOrder;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportRoute2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRoute2RQFKOrderControllerEJBGen;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQFKOrderDAO;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItemShortList;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENTransportRoute2RQFKOrderControllerEJB extends
		ENTransportRoute2RQFKOrderControllerEJBGen {

	public ENTransportRoute2RQFKOrderControllerEJB() {
	}

	/* ENTransportRoute2RQFKOrder. Добавить */
	public int add(ENTransportRoute2RQFKOrder object) {
		try {

			ENTransportRoute2RQFKOrderDAO objectDAO = new ENTransportRoute2RQFKOrderDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderItemDAO fkOitemDAO = new RQFKOrderItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			
			/* добавлять можно только накладные со статусом "Складений" */
			RQFKOrder fkOrder = fkOrderDAO.getObject(object.fkOrderRef.code);
//			if (fkOrder.status.code != RQFKOrderStatus.CREATED
//					&& fkOrder.status.code != RQFKOrderStatus.IN_FK
//					&& fkOrder.status.code != RQFKOrderStatus.COUNTER_IN_SC)
			if (fkOrder.status.code == RQFKOrderStatus.GOOD)
			{
				throw new EnergyproSystemException(
						"До маршруту додаються ордера тільки зі статусом \"Складений\" або \"Проведений\" !!! ");
			}
			
			/* одна накладная на маршруте */
			ENTransportRoute2RQFKOrderFilter objectFilter = new ENTransportRoute2RQFKOrderFilter();
			objectFilter.fkOrderRef.code = object.fkOrderRef.code;
			objectFilter.transportRouteRef.code = object.transportRouteRef.code;
			int objectArr[] = objectDAO.getFilteredCodeArray(objectFilter, 0, -1);

			if (objectArr.length > 0) {
				throw new EnergyproSystemException(
						"Цю накладну вже включено до маршруту!!! ");
			}


			/* пересчитать массу груза по материалам из накладной */
			ENTransportRoute route = routeDAO.getObject(object.transportRouteRef.code);

			/* накладную можно добалять только на НПЗ или ФАКТ */
			ENPlanWork plan = planDAO.getObject(route.planRef.code);
			if (plan.kind.code == ENPlanWorkKind.CURRENT) {
				throw new EnergyproSystemException(
						"Накладні додаються тільки на НПЗ або Факті!!!");
			}


			RQFKOrderItemFilter fkOitemFilter = new RQFKOrderItemFilter();
			fkOitemFilter.fkOrderRef.code = object.fkOrderRef.code;
			RQFKOrderItemShortList fkOitemList = fkOitemDAO.getScrollableFilteredList(fkOitemFilter, 0, -1);

			BigDecimal weightTotal = new BigDecimal(0.00);

			if (fkOitemList.totalCount > 0) {
				for (int i = 0; i < fkOitemList.totalCount; i++) {

					BigDecimal weightItem = new BigDecimal(0.00);
					TKMaterials materials = materialsDAO.getObject(fkOitemList.get(i).materialCode);

					if (materials.weight != null) {
						weightItem = materials.weight.multiply(fkOitemList.get(i).countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					} else {
						weightItem = weightItem.multiply(fkOitemList.get(i).countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					}

					weightTotal = weightTotal.add(weightItem);
				}
			}


			/* для одинаковых маршрутов с одной и той-же накладной - распределяем вес по всем маршрутам */
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.elementInRef.code = route.elementInRef.code;
			routeFilter.elementOutRef.code = route.elementOutRef.code;
			routeFilter.planRef.code = route.planRef.code;
			routeFilter.conditionSQL = " entransportroute.code in ( " +
					" select r2o.transportrouterefcode " +
					"  from entransportrot2rqfkrdr r2o " +
					" where r2o.transportrouterefcode = entransportroute.code " +
					" and r2o.fkorderrefcode = " + fkOrder.code + ")";

			int allRoutes[] = routeDAO.getFilteredCodeArray(routeFilter, 0, -1);

			BigDecimal pWeightOld = new BigDecimal(0);
			BigDecimal pWeightNew = new BigDecimal(0);

			if (allRoutes.length > 0) {

				pWeightOld = weightTotal.divide(new BigDecimal(allRoutes.length), 3, BigDecimal.ROUND_HALF_UP);
				pWeightNew = weightTotal.divide(new BigDecimal(allRoutes.length + 1), 3, BigDecimal.ROUND_HALF_UP);

				for (int z = 0; z < allRoutes.length; z++) {
					ENTransportRoute rRoute = routeDAO.getObject(allRoutes[z]);
					rRoute.weight = (rRoute.weight.subtract(pWeightOld)).add(pWeightNew);
					routeDAO.save(rRoute);
				}

				route.weight = route.weight.add(pWeightNew);

			} else {
				route.weight = route.weight.add(weightTotal);
			}

            /* переделаем на Save из контроллера TransportRoute */
			
			 Context context = new InitialContext();
		     Object trRouteRef = context.lookup(ENTransportRouteController.JNDI_NAME);
		     ENTransportRouteControllerHome trRouteHome = (ENTransportRouteControllerHome) PortableRemoteObject
		                .narrow(trRouteRef, ENTransportRouteControllerHome.class);
		     ENTransportRouteController trRouteController = trRouteHome.create();		
			 trRouteController.save(route);
			// routeDAO.save(route);


			return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (RemoteException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (CreateException e ) {
			  throw new SystemException(e.getMessage(),e);
		} finally {
			closeConnection();
		}
	}

	/* ENTransportRoute2RQFKOrder. Удалить */
	public void remove(int code) {
		try {

			ENTransportRoute2RQFKOrderDAO objectDAO = new ENTransportRoute2RQFKOrderDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderItemDAO fkOitemDAO = new RQFKOrderItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQFKOrderDAO fkOrderDAO = new RQFKOrderDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			/* пересчитать массу груза по материалам из накладной */
			ENTransportRoute2RQFKOrder object = objectDAO.getObject(code);
			ENTransportRoute route = routeDAO.getObject(object.transportRouteRef.code);
			RQFKOrder fkOrder = fkOrderDAO.getObject(object.fkOrderRef.code);

			RQFKOrderItemFilter fkOitemFilter = new RQFKOrderItemFilter();
			fkOitemFilter.fkOrderRef.code = object.fkOrderRef.code;
			RQFKOrderItemShortList fkOitemList = fkOitemDAO.getScrollableFilteredList(fkOitemFilter, 0, -1);

			BigDecimal weightTotal = new BigDecimal(0.00);

			if (fkOitemList.totalCount > 0) {
				for (int i = 0; i < fkOitemList.totalCount; i++) {

					BigDecimal weightItem = new BigDecimal(0.00);
					TKMaterials materials = materialsDAO.getObject(fkOitemList.get(i).materialCode);

					if (materials.weight != null) {
						weightItem = materials.weight.multiply(fkOitemList.get(i).countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					} else {
						weightItem = weightItem.multiply(fkOitemList.get(i).countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					}

					weightTotal = weightTotal.add(weightItem);
				}
			}


			/* для одинаковых маршрутов с одной и той-же накладной - распределяем вес по всем маршрутам */
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.elementInRef.code = route.elementInRef.code;
			routeFilter.elementOutRef.code = route.elementOutRef.code;
			routeFilter.planRef.code = route.planRef.code;
			routeFilter.conditionSQL = " entransportroute.code not in (" + object.transportRouteRef.code + ")" +
					" and entransportroute.code in ( " +
					" select r2o.transportrouterefcode " +
					"  from entransportrot2rqfkrdr r2o " +
					" where r2o.transportrouterefcode = entransportroute.code " +
					" and r2o.fkorderrefcode = " + fkOrder.code + ")";

			int allRoutes[] = routeDAO.getFilteredCodeArray(routeFilter, 0, -1);

			BigDecimal pWeightOld = new BigDecimal(0);
			BigDecimal pWeightNew = new BigDecimal(0);

			if (allRoutes.length > 0) {

				pWeightOld = weightTotal.divide(new BigDecimal(allRoutes.length + 1), 3, BigDecimal.ROUND_HALF_UP);
				pWeightNew = weightTotal.divide(new BigDecimal(allRoutes.length), 3, BigDecimal.ROUND_HALF_UP);

				for (int z = 0; z < allRoutes.length; z++) {
					ENTransportRoute rRoute = routeDAO.getObject(allRoutes[z]);
					rRoute.weight = (rRoute.weight.subtract(pWeightOld)).add(pWeightNew);

					if (rRoute.weight.doubleValue() < 0) {
						rRoute.weight = new BigDecimal(0.00);
					}

					routeDAO.save(rRoute);
				}

				route.weight = route.weight.subtract(pWeightOld);

			} else {
				route.weight = route.weight.subtract(weightTotal);
			}

			if (route.weight.doubleValue() < 0) {
				route.weight = new BigDecimal(0.00);
			}

            /* переделаем на Save из контроллера TransportRoute */
			
			 Context context = new InitialContext();
		     Object trRouteRef = context.lookup(ENTransportRouteController.JNDI_NAME);
		     ENTransportRouteControllerHome trRouteHome = (ENTransportRouteControllerHome) PortableRemoteObject
		                .narrow(trRouteRef, ENTransportRouteControllerHome.class);
		     ENTransportRouteController trRouteController = trRouteHome.create();		
			 trRouteController.save(route);
			// routeDAO.save(route);


			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (RemoteException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (CreateException e ) {
			  throw new SystemException(e.getMessage(),e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENTransportRoute2RQFKOrder