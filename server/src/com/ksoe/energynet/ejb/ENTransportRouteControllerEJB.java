//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransportRoute;
 *
 */

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDestinationPoint2PointDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportRoute2RQFKOrderDAO;
import com.ksoe.energynet.dataminer.ENTransportRoute2RQTransportInvoiceDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRouteControllerEJBGen;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportRouteLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.valueobject.*;
import com.ksoe.energynet.valueobject.filter.ENDestinationPoint2PointFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQTransportInvoiceFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.rqorder.dataminer.RQFKOrderItemDAO;
import com.ksoe.rqorder.dataminer.RQTransportInvoiceItemDAO;
import com.ksoe.rqorder.valueobject.filter.RQFKOrderItemFilter;
import com.ksoe.rqorder.valueobject.filter.RQTransportInvoiceItemFilter;
import com.ksoe.rqorder.valueobject.lists.RQFKOrderItemShortList;
import com.ksoe.rqorder.valueobject.lists.RQTransportInvoiceItemShortList;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.valueobject.TKMaterials;

public class ENTransportRouteControllerEJB extends
		ENTransportRouteControllerEJBGen {

	public ENTransportRouteControllerEJB() {
	}

	public int add(ENTransportRoute object) {
		return add(object, false);
	}
	
	/* ENTransportRoute. Добавить */
	public int add(ENTransportRoute object, boolean isForTravelSheet) {
		try {

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			ENTransportRouteDAO objectDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			int routeCode = objectDAO.add(object);


			/* расстояние от пункта к пункту */
			ENDestinationPoint2PointDAO p2pDAO = new ENDestinationPoint2PointDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDestinationPoint2PointFilter p2pFilter = new ENDestinationPoint2PointFilter();

			p2pFilter.elementInRef.code = object.elementInRef.code;
			p2pFilter.elementOutRef.code = object.elementOutRef.code;
			int p2pArr[] = p2pDAO.getFilteredCodeArray(p2pFilter, 0, -1);

			/* если нет такой записи - добавляем, иначе пересохраняем расстояние */
			if (p2pArr.length == 0) {
				ENDestinationPoint2Point p2p = new ENDestinationPoint2Point();
				p2p.code = Integer.MIN_VALUE;
				p2p.elementInRef.code = object.elementInRef.code;
				p2p.elementOutRef.code = object.elementOutRef.code;
				p2p.distance = object.distance;
				p2pDAO.add(p2p);
			} else {
				ENDestinationPoint2Point p2p = p2pDAO.getObject(p2pArr[0]);
				p2p.distance = object.distance;
				p2pDAO.save(p2p);
			}


			TransportRouteLogic logic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.addDistance(object, object.planRef.code);

			/* 08.05.2012 +++ самая важная  штука.... пересохранить перечень маршрутов */
			TransportRouteLogic trLogic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWork plan = planDAO.getObject(object.planRef.code);
			plan.commentGen = trLogic.getRoutesByPlan(object.planRef.code);
			planDAO.updateCommentGen(plan.code, plan.commentGen);
			
			/* если используется как добавление маршрута на путевом или корректировка фактов, то будем обходить */
			if (!isForTravelSheet && plan.kind.code != ENPlanWorkKind.FACT) {
			/* 01.12.2014 +++ еще одна важная штука :) пересохраним transportitem для того что б расчиталось топливо */
			
	        Context context = new InitialContext();
	        Object trItemRef = context.lookup(ENTransportItemController.JNDI_NAME);
	        ENTransportItemControllerHome trItemHome = (ENTransportItemControllerHome) PortableRemoteObject
	                .narrow(trItemRef, ENTransportItemControllerHome.class);
	        ENTransportItemController trItemController = trItemHome.create();		
			
			ENTransportItemDAO trItemDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
			trItemFilter.planRef.code = plan.code;
			ENTransportItemShortList trItemList = trItemDAO.getScrollableFilteredList(trItemFilter, 0, -1);
			ENTransportItem trItem = null;
			
			if (trItemList.totalCount > 0) {
				for (int i=0;i<trItemList.totalCount;i++) {
					trItem = trItemDAO.getObject(trItemList.get(i).code);
					trItemController.save(trItem);
				}
			} 
			
		} 

			return routeCode;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTransportRoute%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (RemoteException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (CreateException e ) {
			  throw new SystemException(e.getMessage(),e);
		}
		finally {
			closeConnection();
		}
	}

	
	public void save(ENTransportRoute object)  {
		save(object, false);
	}
	
	/* ENTransportRoute. Изменить */
	public void save(ENTransportRoute object, boolean isForTravelSheet)  {
		try {

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			ENTransportRouteDAO objectDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENTransportRoute oldRoute = objectDAO.getObject(object.code);

			objectDAO.save(object);

			/* расстояние от пункта к пункту */
			ENDestinationPoint2PointDAO p2pDAO = new ENDestinationPoint2PointDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDestinationPoint2PointFilter p2pFilter = new ENDestinationPoint2PointFilter();

			p2pFilter.elementInRef.code = object.elementInRef.code;
			p2pFilter.elementOutRef.code = object.elementOutRef.code;
			int p2pArr[] = p2pDAO.getFilteredCodeArray(p2pFilter, 0, -1);

			/* если нет такой записи - добавляем, иначе пересохраняем расстояние */
			if (p2pArr.length == 0) {
				ENDestinationPoint2Point p2p = new ENDestinationPoint2Point();
				p2p.code = Integer.MIN_VALUE;
				p2p.elementInRef.code = object.elementInRef.code;
				p2p.elementOutRef.code = object.elementOutRef.code;
				p2p.distance = object.distance;
				p2pDAO.add(p2p);
			} else {
				ENDestinationPoint2Point p2p = p2pDAO.getObject(p2pArr[0]);
				p2p.distance = object.distance;
				p2pDAO.save(p2p);
			}

			TransportRouteLogic logic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.recalcDistance(oldRoute, object, object.planRef.code);


			/* 08.05.2012 +++ самая важная  штука.... пересохранить перечень маршрутов */
			TransportRouteLogic trLogic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWork plan = planDAO.getObject(object.planRef.code);
			plan.commentGen = trLogic.getRoutesByPlan(object.planRef.code);
			planDAO.updateCommentGen(plan.code, plan.commentGen);

			/* если используется как сейв для обнуление показаний на путевом, то будем обходить */
			/* для фактов тоже будем обходить */
			if (!isForTravelSheet && plan.kind.code != ENPlanWorkKind.FACT) {
			/* 01.12.2014 +++ еще одна важная штука :) пересохраним transportitem для того что б расчиталось топливо */
			
	        Context context = new InitialContext();
	        Object trItemRef = context.lookup(ENTransportItemController.JNDI_NAME);
	        ENTransportItemControllerHome trItemHome = (ENTransportItemControllerHome) PortableRemoteObject
	                .narrow(trItemRef, ENTransportItemControllerHome.class);
	        ENTransportItemController trItemController = trItemHome.create();		
			
			ENTransportItemDAO trItemDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
			trItemFilter.planRef.code = plan.code;
			ENTransportItemShortList trItemList = trItemDAO.getScrollableFilteredList(trItemFilter, 0, -1);
			ENTransportItem trItem = null;
			
			if (trItemList.totalCount > 0) {
				for (int i=0;i<trItemList.totalCount;i++) {
					trItem = trItemDAO.getObject(trItemList.get(i).code);
					trItemController.save(trItem);
				}
			} 
			
		}

			
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTransportRoute%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		  }	
		 catch (NamingException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (RemoteException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (CreateException e ) {
			  throw new SystemException(e.getMessage(),e);
		}
		finally {
			closeConnection();
		}
	}

	/* ENTransportRoute. Удалить */
	public void remove(int code) {
		try {
			ENTransportRouteDAO objectDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENTransportRoute route = objectDAO.getObject(code);

			ENTransportRouteFilter rFilter = new ENTransportRouteFilter();
			rFilter.parentRouteRef.code = code;
			int rArr[] = objectDAO.getFilteredCodeArray(rFilter, 0, -1);
			if (rArr.length > 0) {
				throw new EnergyproSystemException(
						"\n \n Видаляти починайте з останнього маршруту!!!");
			}


			/* вынесем связку с накладными */
			ENTransportRoute2RQFKOrderFilter to2fkFilter = new ENTransportRoute2RQFKOrderFilter();
			ENTransportRoute2RQFKOrderDAO to2fkDAO = new ENTransportRoute2RQFKOrderDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			to2fkFilter.transportRouteRef.code = code;
			int[] to2fkArr = to2fkDAO.getFilteredCodeArray(to2fkFilter, 0, -1);
			for (int f = 0; f < to2fkArr.length; f++) {

				/* для одинаковых маршрутов с одной и той-же накладной - распределяем вес по всем маршрутам */
				ENTransportRoute2RQFKOrder to2fkOrder = to2fkDAO.getObject(to2fkArr[f]);

				ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
				routeFilter.elementInRef.code = route.elementInRef.code;
				routeFilter.elementOutRef.code = route.elementOutRef.code;
				routeFilter.planRef.code = route.planRef.code;
				routeFilter.conditionSQL = " entransportroute.code not in (" + code + ")" +
						" and entransportroute.code in ( " +
						" select r2o.transportrouterefcode " +
						"  from entransportrot2rqfkrdr r2o " +
						" where r2o.transportrouterefcode = entransportroute.code " +
						" and r2o.fkorderrefcode = " +  to2fkOrder.fkOrderRef.code + ")";

				int allRoutes[] = objectDAO.getFilteredCodeArray(routeFilter, 0, -1);

				BigDecimal pWeightOld = new BigDecimal(0);
				BigDecimal pWeightNew = new BigDecimal(0);

				if (allRoutes.length > 0) {

					RQFKOrderItemDAO fkOitemDAO = new RQFKOrderItemDAO(
							getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
							getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					/* пересчитать массу груза по материалам из накладной */
					RQFKOrderItemFilter fkOitemFilter = new RQFKOrderItemFilter();
					fkOitemFilter.fkOrderRef.code = to2fkOrder.fkOrderRef.code;
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


					pWeightOld = weightTotal.divide(new BigDecimal(allRoutes.length + 1), 3, BigDecimal.ROUND_HALF_UP);
					pWeightNew = weightTotal.divide(new BigDecimal(allRoutes.length), 3, BigDecimal.ROUND_HALF_UP);

					for (int z = 0; z < allRoutes.length; z++) {
						ENTransportRoute rRoute = objectDAO.getObject(allRoutes[z]);
						rRoute.weight = (rRoute.weight.subtract(pWeightOld)).add(pWeightNew);

						if (rRoute.weight.doubleValue() < 0) {
							rRoute.weight = new BigDecimal(0.00);
						}

						objectDAO.save(rRoute);
					}
				}

				to2fkDAO.remove(to2fkArr[f]);
		    }


			/* вынесем связку с транспортными накладными */
			ENTransportRoute2RQTransportInvoiceFilter tr2invFilter = new ENTransportRoute2RQTransportInvoiceFilter();
			ENTransportRoute2RQTransportInvoiceDAO tr2invDAO = new ENTransportRoute2RQTransportInvoiceDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			tr2invFilter.transportRouteRef.code = code;
			int[] tr2invArr = tr2invDAO.getFilteredCodeArray(tr2invFilter, 0, -1);
			for (int z = 0; z < tr2invArr.length; z++) {

				/* для одинаковых маршрутов с одной и той-же накладной - распределяем вес по всем маршрутам */
				ENTransportRoute2RQTransportInvoice tr2iNvoice = tr2invDAO.getObject(tr2invArr[z]);

				ENTransportRouteFilter routeTFilter = new ENTransportRouteFilter();
				routeTFilter.elementInRef.code = route.elementInRef.code;
				routeTFilter.elementOutRef.code = route.elementOutRef.code;
				routeTFilter.planRef.code = route.planRef.code;
				routeTFilter.conditionSQL = " entransportroute.code not in (" + code + ")" +
						" and entransportroute.code in " +
						" (select r2i.transportrouterefcode " +
						" from ntrnsprtrt2rqtrnsprtnv r2i " +
						" where r2i.transportrouterefcode = entransportroute.code " +
						" and r2i.invoicerefcode = " + tr2iNvoice.invoiceRef.code + ")";


				int allRoutesT[] = objectDAO.getFilteredCodeArray(routeTFilter, 0, -1);

				BigDecimal pWeightOldT = new BigDecimal(0);
				BigDecimal pWeightNewT = new BigDecimal(0);

				if (allRoutesT.length > 0) {

					RQTransportInvoiceItemDAO trInvoiceItemDAO = new RQTransportInvoiceItemDAO(
							getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
					TKMaterialsDAO materialsDAO = new TKMaterialsDAO(
							getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

					/* пересчитать массу груза по материалам из накладной */
					RQTransportInvoiceItemFilter trInvoiceItemFilter = new RQTransportInvoiceItemFilter();
					trInvoiceItemFilter.transportInvoiceRef.code = tr2iNvoice.invoiceRef.code;
					RQTransportInvoiceItemShortList trInvoiceItemList = trInvoiceItemDAO.getScrollableFilteredList(trInvoiceItemFilter, 0, -1);

					BigDecimal weightTotalT = new BigDecimal(0.00);

					if (trInvoiceItemList.totalCount > 0) {
						for (int i = 0; i < trInvoiceItemList.totalCount; i++) {

							BigDecimal weightItemT = new BigDecimal(0.00);
							TKMaterials materials = materialsDAO.getObject(trInvoiceItemList.get(i).materialRefCode);

							if (materials.weight != null) {
								weightItemT = materials.weight.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
							} else {
								weightItemT = weightItemT.multiply(trInvoiceItemList.get(i).countFact).setScale(2, BigDecimal.ROUND_HALF_UP);
							}

							weightTotalT = weightTotalT.add(weightItemT);
						}
					}


					pWeightOldT = weightTotalT.divide(new BigDecimal(allRoutesT.length + 1), 3, BigDecimal.ROUND_HALF_UP);
					pWeightNewT = weightTotalT.divide(new BigDecimal(allRoutesT.length), 3, BigDecimal.ROUND_HALF_UP);

					for (int y = 0; y < allRoutesT.length; y++) {
						ENTransportRoute rRouteT = objectDAO.getObject(allRoutesT[y]);
						rRouteT.weight = (rRouteT.weight.subtract(pWeightOldT)).add(pWeightNewT);

						if (rRouteT.weight.doubleValue() < 0) {
							rRouteT.weight = new BigDecimal(0.00);
						}

						objectDAO.save(rRouteT);
					}
				}

				tr2invDAO.remove(tr2invArr[z]);
		    }


			/* пересчитать дистанции */
			TransportRouteLogic logic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			logic.deleteDistance(route, route.planRef.code);

			/* 08.05.2012 +++ самая важная  штука.... пересохранить перечень маршрутов */
			TransportRouteLogic trLogic = new TransportRouteLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWorkDAO planDAO = new ENPlanWorkDAO(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENPlanWork plan = planDAO.getObject(route.planRef.code);
			plan.commentGen = trLogic.getRoutesByPlan(route.planRef.code);

			planDAO.updateCommentGen(plan.code, plan.commentGen);

            /* 01.12.2014 +++ еще одна важная штука :) пересохраним transportitem для того что б расчиталось топливо */
			/* для фактов нет смысла пересчитывать */
			if (plan.kind.code != ENPlanWorkKind.FACT) {
			
	        Context context = new InitialContext();
	        Object trItemRef = context.lookup(ENTransportItemController.JNDI_NAME);
	        ENTransportItemControllerHome trItemHome = (ENTransportItemControllerHome) PortableRemoteObject
	                .narrow(trItemRef, ENTransportItemControllerHome.class);
	        ENTransportItemController trItemController = trItemHome.create();		
			
			ENTransportItemDAO trItemDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTransportItemFilter trItemFilter = new ENTransportItemFilter();
			trItemFilter.planRef.code = plan.code;
			ENTransportItemShortList trItemList = trItemDAO.getScrollableFilteredList(trItemFilter, 0, -1);
			ENTransportItem trItem = null;
			
			if (trItemList.totalCount > 0) {
				for (int i=0;i<trItemList.totalCount;i++) {
					trItem = trItemDAO.getObject(trItemList.get(i).code);
					trItemController.save(trItem);
				}
			} 
			
		}	
			
			
			objectDAO.remove(code);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENTransportRoute%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (RemoteException e ) {
			  throw new SystemException(e.getMessage(),e);
		} catch (CreateException e ) {
			  throw new SystemException(e.getMessage(),e);
		}
		finally {
			closeConnection();
		}
	}

	/* ENTransportRoute(Маршрут).Разнести показания спидометра */
	public void saveRoute2TravelSheetItem(ENTransportRoute object) {
		try {

			ENTransportRouteDAO objectDAO = new ENTransportRouteDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			objectDAO.save(object);

			ENTravelSheetItemDAO travelSheetItemDAO = new ENTravelSheetItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENTravelSheetItemFilter tiFilter = new ENTravelSheetItemFilter();
			tiFilter.planRef.code = object.planRef.code;
			int tiArr[] = travelSheetItemDAO.getFilteredCodeArray(tiFilter, 0, -1);
			
			TransportRouteLogic trLogic = new TransportRouteLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			TravelSheetLogic travelSheetLogic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			if(trLogic.checkRouteWithDistances(object.code) == -1)
				throw new EnergyproSystemException("Сумарний пробіг по дистанціях перевищує пробіг на маршруті");

			if (tiArr.length > 0) {
				for (int i = 0; i < tiArr.length; i++) {
					ENTravelSheetItem travelItem = travelSheetItemDAO.getObject(tiArr[i]);
					ENTravelSheet travelSheet = travelSheetLogic.getTravelSheetByCode(travelItem.travelSheetRef.code);


					if (travelItem.speedometerStart == null) {
						travelItem.speedometerStart = object.speedometerStart;
					}

					if (object.fuelCounterStart != null) {
						if(travelItem.fuelCounterStart == null)
							travelItem.fuelCounterStart = object.fuelCounterStart;
						else if(travelItem.fuelCounterStart.compareTo(object.fuelCounterStart) != -1)
							travelItem.fuelCounterStart = object.fuelCounterStart;
						
						if(travelItem.fuelCounterFinal != null){
							if(travelItem.fuelCounterFinal.compareTo(object.fuelCounterFinal) == -1)
									travelItem.fuelCounterFinal = object.fuelCounterFinal;}
						else
							travelItem.fuelCounterFinal = object.fuelCounterFinal;
							
								
					}

					travelItem.timeStart = travelSheet.timeStart;
					travelItem.timeFinal = travelSheet.timeFinal;
					travelItem.speedometerFinal = object.speedometerFinal;
					travelItem.sumDistances = object.distanceNew;

					Context context = new InitialContext();
					Object travelItemRef = context.lookup(ENTravelSheetItemController.JNDI_NAME);
					ENTravelSheetItemControllerHome travelItemHome = (ENTravelSheetItemControllerHome) PortableRemoteObject
							.narrow(travelItemRef, ENTravelSheetItemControllerHome.class);
					ENTravelSheetItemController travelItemController = travelItemHome.create();

					travelItemController.save4transportRoute(travelItem);
				}
			} else {
				throw new EnergyproSystemException(
						"Не знайдено подорожній лист для маршруту!!! \n"
								+ " код маршруту: " + object.code);
			}
		} catch (RemoteException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (CreateException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (NamingException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTransportRoute%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENTransportRoute