
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENDistance;
  *
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.ejb.generated.ENDistanceControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.valueobject.TKTransportType;

public class ENDistanceControllerEJB extends ENDistanceControllerEJBGen
 {

	  @Override
	public void remove(int code)
	   {
	    try
	     {

	      ENDistanceDAO objectDAO = new ENDistanceDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      ENDistance object = objectDAO.getObject(code);

	      TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

  		  ENTransportItemDAO transportDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  ENTransportItem transport = transportDAO.getObject(object.transportItemRef.code);

		  boolean isExeption = (transport.tktransportType.code != TKTransportType.BRIGADE);

          boolean inSheet = tLogic.checkTransportItemInTravelSheet(object.transportItemRef.code, isExeption);

		  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  if ( ! l.checkPermission4PlanItems(transport.planRef.code))
		  {
			  throw new EnergyproSystemException("Acces denied for method addBy... from method ENDistance.remove()");
		  }

		     PlanWorkLogic logic1 = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		     if (logic1.isNotEditablePlan(transport.planRef.code)) {
		    	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+transport.planRef.code);
		     }
/*
		     // проверим совместную доставку .. и отправим удалять вначале ее .. а потом расстояния ...
		     ENDeliveryOrderDAO delDAO = new ENDeliveryOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		     ENDeliveryOrderFilter delFilter = new ENDeliveryOrderFilter();
		     delFilter.transportOut.code = object.transportItemRef.code;
		     int arr[] = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
		     if (arr.length > 0){
		    	 ENDeliveryOrder del = delDAO.getObject(arr[0]);
		    	 ENTransportItemDAO trDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		    	 ENTransportItem tr = trDAO.getObject(del.transportOut)
		    	 TKTransport tr = null;
		    	 logic1.getpl
		    	 throw new EnergyproSystemException("Это расстояние влияет на совместную доставку ... удалите вначале совместную доставку ");
		     }
*/
	      objectDAO.remove(code);

	      // ЕСТЬ ЛИ ЕЩЕ РАССТОЯНИЯ ... ЕСЛИ НЕТУ И ЕСТЬ ДОСТАВКА - В САД
	      ENDistanceFilter f = new ENDistanceFilter();
	      f.transportItemRef.code = object.transportItemRef.code;
	      int[] dArr = objectDAO.getFilteredCodeArray_1(f, null, null,0,-1,null);
	      if (dArr.length == 0){
	    	  tLogic.validateDeliveryOrder(object.transportItemRef.code);

	    	  /*
			     // проверим совместную доставку .. и отправим удалять вначале ее .. а потом расстояния ...
			     ENDeliveryOrderDAO delDAO = new ENDeliveryOrderDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			     ENDeliveryOrderFilter delFilter = new ENDeliveryOrderFilter();
			     delFilter.transportOut.code = object.transportItemRef.code;
			     int arr[] = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
			     if (arr.length > 0){
			    	 ENDeliveryOrder del = delDAO.getObject(arr[0]);
			    	 ENTransportItemDAO trDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			    	 ENTransportItem tr = trDAO.getObject(del.transportOut.code);
			    	 //TKTransport tr = null;
			    	 //logic1.getpl
			    	 ENPlanWorkShort planShort = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getShortObject(tr.planRef.code);
			    	 throw new EnergyproSystemException("Это расстояние влияет на совместную доставку ... " +
			    			 "удалите вначале совместную доставку c плана для " + planShort.invNumber + ", наряд № " + ( planShort.workOrderNumber == null ? " без наряду " : planShort.workOrderNumber ));
			     }
			     */
	      }

	      if ( ! inSheet )
	    	  tLogic.generateGSMEstimate(transport.code);

	      tLogic.createDeliveryTimeForPlan(transport.planRef.code);
	      // пересчитаем время на хьменах ...
	      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(transport.planRef.code);

		  ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
		  logic1.generatePlanFuelHistory(transport.planRef.code);
		  /////

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENDistance%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  @Override
	public int add(ENDistance object)
	   {
	    try
	     {

	      TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

  		  ENTransportItemDAO transportDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  ENTransportItem transport = transportDAO.getObject(object.transportItemRef.code);

	      boolean isExeption = (transport.tktransportType.code != TKTransportType.BRIGADE);

	      boolean inSheet = tLogic.checkTransportItemInTravelSheet(object.transportItemRef.code, isExeption);

		  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  if ( ! l.checkPermission4PlanItems(transport.planRef.code))
		  {
			  throw new EnergyproSystemException("У Вас немає доступу до планів на на цей тип об'єкту ...");
		  }

		     PlanWorkLogic logic1 = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		     if (logic1.isNotEditablePlan(transport.planRef.code)) {
		    	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+transport.planRef.code);
		     }

		     ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWork plan = pwDAO.getObject(transport.planRef.code);

			  if (plan.elementRef.code == ENElement.CARGO_OBJECT)
			  {throw new EnergyproSystemException("Запрещено добавлять или редактировать дистанции для перевозки грузов! Пользуйтесь маршрутами для редактирования пробегов.");}
			  ;


	      ENDistanceDAO objectDAO = new ENDistanceDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      // уникальные тип дороги и тип расстояния ...
	      ENDistanceFilter f = new ENDistanceFilter();
	      f.transportItemRef.code = object.transportItemRef.code;
	      f.typeRef.code = object.typeRef.code;
	      f.roadType.code = object.roadType.code;
	      ENDistanceShortList dList = objectDAO.getScrollableFilteredList(f, 0, -1);
	      if (dList.totalCount > 0){
	    	  throw new EnergyproSystemException("Відстань з таким типом відстані і таким типом дороги вже введено ... змінюйте її ..");
	      }

	      int out = objectDAO.add(object);

	      if ( ! inSheet )
	    	  tLogic.generateGSMEstimate(transport.code);

	      tLogic.createDeliveryTimeForPlan(transport.planRef.code);
	      // пересчитаем время на хьменах ...
	      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(transport.planRef.code);

		  ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
		  logic1.generatePlanFuelHistory(transport.planRef.code);
		  /////

	      return out;

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENDistance%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


	  /*ENDistance. Изменить*/
	  @Override
	public void save(ENDistance object)
	   {
	    try
	     {

  		  ENTransportItemDAO transportDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  ENTransportItem transport = transportDAO.getObject(object.transportItemRef.code);


	      TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	      boolean isExeption = (transport.tktransportType.code != TKTransportType.BRIGADE);

	      boolean inSheet = tLogic.checkTransportItemInTravelSheet(object.transportItemRef.code, isExeption);

		  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		  if ( ! l.checkPermission4PlanItems(transport.planRef.code))
		  {
			  throw new EnergyproSystemException("У Вас немає доступу до планів на на цей тип об'єкту ...");
		  }

		     PlanWorkLogic logic1 = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		     if (logic1.isNotEditablePlan(transport.planRef.code)) {
		    	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+transport.planRef.code);
		     }

		     ENPlanWorkDAO pwDAO = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			  ENPlanWork plan = pwDAO.getObject(transport.planRef.code);

			  if (plan.elementRef.code == ENElement.CARGO_OBJECT)
			  {throw new EnergyproSystemException("Запрещено добавлять или редактировать дистанции для перевозки грузов! Пользуйтесь маршрутами для редактирования пробегов.");}
			  ;


	      ENDistanceDAO objectDAO = new ENDistanceDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	      // уникальные тип дороги и тип расстояния ...
	      ENDistanceFilter f = new ENDistanceFilter();
	      f.transportItemRef.code = object.transportItemRef.code;
	      f.typeRef.code = object.typeRef.code;
	      f.roadType.code = object.roadType.code;
	      f.conditionSQL = "code <> " + object.code;
	      ENDistanceShortList dList = objectDAO.getScrollableFilteredList(f, 0, -1);
	      if (dList.totalCount > 0){
	    	  throw new EnergyproSystemException("Відстань з таким типом відстані і таким типом дороги вже введено ... змінюйте її ..");
	      }

	      objectDAO.save(object);

	      if ( ! inSheet )
	    	  tLogic.generateGSMEstimate(transport.code);

	      tLogic.createDeliveryTimeForPlan(transport.planRef.code);
	      // пересчитаем время на хьменах ...
	      new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(transport.planRef.code);

		  ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
		  logic1.generatePlanFuelHistory(transport.planRef.code);
		  /////

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENDistance%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


  public ENDistanceControllerEJB() {}


} // end of EJB Controller for ENDistance