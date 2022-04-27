//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransportRoute2RQTransportInvoice;
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
import com.ksoe.energynet.dataminer.ENTransportRoute2RQTransportInvoiceDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRoute2RQTransportInvoiceControllerEJBGen;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQTransportInvoiceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQTransportInvoiceDAO;
import com.ksoe.rqorder.dataminer.RQTransportInvoiceItemDAO;
import com.ksoe.rqorder.valueobject.RQTransportInvoice;
import com.ksoe.rqorder.valueobject.RQTransportInvoiceStatus;
import com.ksoe.rqorder.valueobject.filter.RQTransportInvoiceItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQTransportInvoiceItemShortList;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENTransportRoute2RQTransportInvoiceControllerEJB extends
		ENTransportRoute2RQTransportInvoiceControllerEJBGen {

	public ENTransportRoute2RQTransportInvoiceControllerEJB() {
	}

	/* ENTransportRoute2RQTransportInvoice. Добавить */
	public int add(ENTransportRoute2RQTransportInvoice object) {
		try {

			ENTransportRoute2RQTransportInvoiceDAO objectDAO = new ENTransportRoute2RQTransportInvoiceDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQTransportInvoiceDAO trInvoiceDAO = new RQTransportInvoiceDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQTransportInvoiceItemDAO trInvoiceItemDAO = new RQTransportInvoiceItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			/* одна накладная на маршруте */
			ENTransportRoute2RQTransportInvoiceFilter objectFilter = new ENTransportRoute2RQTransportInvoiceFilter();
			objectFilter.invoiceRef.code = object.invoiceRef.code;
			objectFilter.transportRouteRef.code = object.transportRouteRef.code;
			int objectArr[] = objectDAO.getFilteredCodeArray(objectFilter, 0, -1);

			if (objectArr.length > 0) {
				throw new EnergyproSystemException(
						"\n Цю накладну вже включено до маршруту!!! ");
			}

			RQTransportInvoice trInvoice = trInvoiceDAO.getObject(object.invoiceRef.code);
			ENTransportRoute route = routeDAO.getObject(object.transportRouteRef.code);

			/* добавлять на маршрут можно только накладные со статусом "Черновой" */
			if (trInvoice.statusRef.code != RQTransportInvoiceStatus.NEW) {
				throw new EnergyproSystemException(
						"\n До маршруту додаються тільки ордера зі статусом \"Чорновий\"!!!");
			}

			/* накладную можно добалять только на НПЗ или ФАКТ */
			ENPlanWork plan = planDAO.getObject(route.planRef.code);
			if (plan.kind.code == ENPlanWorkKind.CURRENT) {
				throw new EnergyproSystemException(
						"\n Накладні додаються тільки на НПЗ або Факті!!!");
			}

			/* пересчитать массу груза по материалам из накладной */
			RQTransportInvoiceItemFilter invoiceItemFilter = new RQTransportInvoiceItemFilter();
			invoiceItemFilter.transportInvoiceRef.code = object.invoiceRef.code;
			RQTransportInvoiceItemShortList trInvoiceItemList = trInvoiceItemDAO.getScrollableFilteredList(invoiceItemFilter, 0, -1);

			BigDecimal weightTotal = new BigDecimal(0.00);

			if (trInvoiceItemList.totalCount > 0) {
				for (int i = 0; i < trInvoiceItemList.totalCount; i++) {

					BigDecimal weightItem = new BigDecimal(0.00);
					TKMaterials materials = materialsDAO.getObject(trInvoiceItemList.get(i).materialRefCode);

					if (materials.weight != null) {
						weightItem = materials.weight.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
					} else {
						weightItem = weightItem.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
					}

					weightTotal = weightTotal.add(weightItem);
				}
			}


			/* для одинаковых маршрутов с одной и той-же накладной - распределяем вес по всем маршрутам */
			ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
			routeFilter.elementInRef.code = route.elementInRef.code;
			routeFilter.elementOutRef.code = route.elementOutRef.code;
			routeFilter.planRef.code = route.planRef.code;
			routeFilter.conditionSQL = " entransportroute.code in " +
					" (select r2i.transportrouterefcode " +
					" from ntrnsprtrt2rqtrnsprtnv r2i " +
					" where r2i.transportrouterefcode = entransportroute.code " +
					" and r2i.invoicerefcode = " + trInvoice.code + ")";

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
			 


			/* накладной ставим статус "В работе" */
			trInvoice.statusRef.code = RQTransportInvoiceStatus.IN_WORK;
			trInvoiceDAO.save(trInvoice);


			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice%} object.",
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

	/* ENTransportRoute2RQTransportInvoice. Удалить */
	public void remove(int code) {
		try {

			ENTransportRoute2RQTransportInvoiceDAO objectDAO = new ENTransportRoute2RQTransportInvoiceDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQTransportInvoiceDAO trInvoiceDAO = new RQTransportInvoiceDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			RQTransportInvoiceItemDAO trInvoiceItemDAO = new RQTransportInvoiceItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			/* пересчитать массу груза по материалам из накладной */
			ENTransportRoute2RQTransportInvoice object = objectDAO.getObject(code);
			ENTransportRoute route = routeDAO.getObject(object.transportRouteRef.code);
			RQTransportInvoice trInvoice = trInvoiceDAO.getObject(object.invoiceRef.code);

			RQTransportInvoiceItemFilter trInvoiceItemFilter = new RQTransportInvoiceItemFilter();
			trInvoiceItemFilter.transportInvoiceRef.code = object.invoiceRef.code;
			RQTransportInvoiceItemShortList trInvoiceItemList = trInvoiceItemDAO.getScrollableFilteredList(trInvoiceItemFilter, 0, -1);

			BigDecimal weightTotal = new BigDecimal(0.00);

			if (trInvoiceItemList.totalCount > 0) {
				for (int i = 0; i < trInvoiceItemList.totalCount; i++) {

					BigDecimal weightItem = new BigDecimal(0.00);
					TKMaterials materials = materialsDAO.getObject(trInvoiceItemList.get(i).materialRefCode);

					if (materials.weight != null) {
						weightItem = materials.weight.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
					} else {
						weightItem = weightItem.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
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
					" and entransportroute.code in " +
					" (select r2i.transportrouterefcode " +
					" from ntrnsprtrt2rqtrnsprtnv r2i " +
					" where r2i.transportrouterefcode = entransportroute.code " +
					" and r2i.invoicerefcode = " + trInvoice.code + ")";

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
			 

			/* накладной ставим статус "Черновой" */
			if (trInvoice.statusRef.code == RQTransportInvoiceStatus.IN_WORK) {
				trInvoice.statusRef.code = RQTransportInvoiceStatus.NEW;
				trInvoiceDAO.save(trInvoice);
			}

			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENTransportRoute2RQTransportInvoice%} object.",
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

} // end of EJB Controller for ENTransportRoute2RQTransportInvoice