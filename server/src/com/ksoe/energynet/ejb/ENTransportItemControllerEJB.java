
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTransportItem;
  *
  */



import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkStateDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.ejb.generated.ENTransportItemControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.PlanWorkLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.TransportRouteLogic;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkState;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportItemData;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.FINWorkerKind;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.FINWorkerFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.FINWorkerShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.fin.logic.FKConsts;
import com.ksoe.fin.logic.FKOSLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.valueobject.TKTechCard;
import com.ksoe.techcard.valueobject.TKTechCardSource;
import com.ksoe.techcard.valueobject.TKTransportClassification;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportStatus;
import com.ksoe.techcard.valueobject.TKTransportType;

public class ENTransportItemControllerEJB extends ENTransportItemControllerEJBGen
 {

  public ENTransportItemControllerEJB() {}

  public ENTransportItemShortList getListForTravelSheetItem(ENTransportItemFilter filterObject)
  {
	    try
	     {
	      ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getListForTravelSheetItem(filterObject);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public ENTransportItemShortList getListForDistances(int planCode)
  {
	    try
	     {
	      ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getListForDistances(planCode);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }


  public ENTransportItemShortList getListDetailedForTravelSheetItem(ENTransportItemFilter filterObject)
  {
	    try
	     {
	      ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getListDetailedForTravelSheetItem(filterObject);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public ENTransportItemShortList getListDetailedForTransportOrder(ENTransportItemFilter filterObject)
  {
	    try
	     {
	      ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      return objectDAO.getListDetailedForTransportOrder(filterObject);
	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }

  public int addBySRS(ENTransportItem object){
		return add(object);
	  }

	  public int addBySVES(ENTransportItem object){
			return add(object);
	  }

	  public int addBySPS(ENTransportItem object){
			return add(object);
	  }

	  public int addByByt(ENTransportItem object){
			return add(object);
	  }

	  public int addByProm(ENTransportItem object){
			return add(object);
	  }

	  public void saveBySRS(ENTransportItem object){
		save(object);
	  }

	  public void saveBySVES(ENTransportItem object){
		save(object);
	  }

	  public void saveBySPS(ENTransportItem object){
		save(object);
	  }

	  public void saveByBy(ENTransportItem object){
			save(object);
		  }

	  public void saveByProm(ENTransportItem object){
			save(object);
		  }

	  public void removeBySRS(int code){
			remove(code);
	  }

	  public void removeBySVES(int code){
		remove(code);
	  }

	  public void removeBySPS(int code){
		remove(code);
	  }

	  public void removeByByt(int code){
			remove(code);
		  }

	  public void removeByProm(int code){
			remove(code);
		  }


	@Override
	public int add(ENTransportItem object) {
		Connection finConn = null;
		Connection enConn = null;
		Connection finOSConn = null;

		try {
		/////
		AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		FinConnectionData finConnectionData = l.getFinConnectionData();
		/////

	 //finConn = getRemoteConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);

	 finOSConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
	 finConn = getConnection(finConnectionData.connectionString);
	 enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

     if ( object.planRef.code == Integer.MIN_VALUE){
    	 new EnergyproSystemException("planRef not found");
     }

     ENPlanWork plan = new ENPlanWorkDAO(enConn, getUserProfile()).getObject(object.planRef.code);

     if ( (plan.kind.code != ENPlanWorkKind.NPW) && (plan.kind.code != ENPlanWorkKind.FACT) && (object.numberList != null)){
    	 throw new EnergyproSystemException("На месячном плане не должно быть Транспортных листов ... а вы уверены что номер Транспортного листа правильный ???");
     }

	 // путевой лист не может быть без реального тр-та и водителя ...
	 if (object.numberList == null)
	 {}
	 else
	 {
		 if (object.numberList.trim().length() != 0)
		 {
			 if (object.transportReal == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реальний транспорт ...");
			 if (object.transportReal.code == Integer.MIN_VALUE)
			 {
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реальний транспорт ...");
			 }
			 else
			 {
				 TransportLogic eLogic = new TransportLogic(enConn, getUserProfile());
				 eLogic.checkTransportItemInTravelSheet(object.transportReal.code, plan.dateStart, true);
			 }

			 if (object.finWorker == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реального працівника ...");

			 if (object.finWorker.tabNumber == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реального працівника ...");
		 }
	 }



		  //AuthLogic l = new AuthLogic(enConn, getUserProfile());
		  if ( ! l.checkPermission4PlanItems( plan ))
		  {
			  throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.add()");
		  }

	     PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());
	     if (logic.isNotEditablePlan(plan)) {
	    	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
	     }

	     ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(),enConn);

	     // не добавлять левые авто ...
		 TKTechCardDAO kDao = new TKTechCardDAO(getUserProfile(),enConn);

		 ENPlanWorkItem pwi = new ENPlanWorkItemDAO(getUserProfile(),enConn).getObject(object.planItemRef.code);

	     TKTechCard tk = kDao.getObject(pwi.kartaRef.code);
	     if (tk.techcardsource.code != TKTechCardSource.TRUCKING)
	     {

			 ENTransportItemData[] data = kDao.getTransportDataItems(pwi.kartaRef.code );
		     if ( data.length != 0){
		    	 if (object.tktransportType.code == TKTransportType.BRIGADE){
		    		 for (int i=0; i < data.length; i++){
		    			 if (data[i].transportType == TKTransportType.BRIGADE){

		    				 /*Если нет ни одного автомобиля на работе, то разрешим добавить*/
		    				 ENTransportItemFilter tiFilter = new ENTransportItemFilter();
		    				 tiFilter.planRef.code = object.planRef.code;
		    				 tiFilter.planItemRef.code = object.planItemRef.code;

		    				 int[] tiCodeArr = objectDAO.getFilteredCodeArray(tiFilter,0, -1);

		    				 if(tiCodeArr.length > 0)
		    					 throw new EnergyproSystemException("Бригадний автомобіль є у нормативі ...");
		    			 }
		    		 }
		    	 }
		    	 else{
		    		 throw new EnergyproSystemException("Додавати транспорт, якого немає у нормативах, не можна ...");
		    	 }
		     }
		     else
		     {
		    	if (object.tktransportType.code != TKTransportType.BRIGADE && plan.typeRef.code != ENPlanWorkType.TRANSPORT_RELOCATION
		    			&& plan.stateRef.code != ENPlanWorkState.TRUCKING)
		    	{throw new EnergyproSystemException("Додавати транспорт, крім Бригадного Авто, якого немає у нормативах, не можна ..."); }
		     }
	     }

	     // чтоб небыло 2-х бриг авто ...
	     //АС 21.03.2011 высовольтники тягяются на двух бригадных ... пусть добавляют ...

	     if (object.tktransportType.code == TKTransportType.BRIGADE){
	    	 /*
	    	 ENTransportItemFilter trFilter = new ENTransportItemFilter();
	    	 trFilter.planItemRef.code = object.planItemRef.code;
	    	 trFilter.tktransportType.code = TKTransportType.BRIGADE;
	    	 int[] trArr = objectDAO.getFilteredCodeArray(trFilter, 0, -1);
	    	 if (trArr.length > 0){
	    		 throw new EnergyproSystemException("Вже заведено один бригадний автомобіль ...");
	    	 }
	    	 */
	    	 // для Бригадного - ненормативного маш/часы = 0 ..
	    	 object.countWorkFact = new BigDecimal(0);
	     }




   if (object.planItemRef != null){
  	 if (object.planItemRef.code == Integer.MIN_VALUE){
  		 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
  	 }
  	 else
  	 {
  		 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
  	 }
   }
   else
   {
  	 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
   }

   HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());

   if (object.finWorker != null) {
	   if (object.finWorker.tabNumber != null) {

		   //проверим является ли воркер инвалидом
  		   // дата среза проверки принимаем на дату старт плана
    		 Date date_srez;

    		 ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
    		 date_srez = pw.getDateStart();

    		 FINLogic fLogicFin = new FINLogic(finConn ,getUserProfile());
    		 //FINLogic fLogicNet = new FINLogic(enConn,getUserProfile());

		FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(),enConn);
		FINWorker w = new FINWorker();

		w.code = Integer.MIN_VALUE;
		w.name = object.finWorker.name;
		w.tabNumber = object.finWorker.tabNumber;
		w.positionCode = object.finWorker.positionCode;
		w.positionName = object.finWorker.positionName;
		w.departmentCode = object.finWorker.departmentCode;
		w.departmentName = object.finWorker.departmentName;
		w.priceGen = object.finWorker.priceGen;
		w.categor = object.finWorker.categor;
		w.finCode = object.finWorker.finCode;
		///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
		//w.isSentAssignment = object.finWorker.isSentAssignment;
		w.isSentAssignment = 0;
		/////
		w.kindRef.code = FINWorkerKind.OTHER;

        // MDAX-441
        w.positionId = object.finWorker.positionId;

		//SUPP-2238 Сотрудников керивництва можно добавлять только в акты на списання паливно-мастильних матеріалів
		if(w.departmentCode.trim().equals((""+FKConsts.PODR_MANAGEMENT_ID).trim()) && plan.stateRef.code != ENPlanWorkState.TRUCKING)
		{
			ENPlanWorkStateDAO planWorkStateDAO = new ENPlanWorkStateDAO(enConn, getUserProfile());
			ENPlanWorkState planType = planWorkStateDAO.getObject(plan.stateRef.code);
			throw new EnergyproSystemException("Співробітника " + object.finWorker.name + " не можливо додати на план з типом акту " + planType.name);

		}

		// если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
		// иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
		if (fLogicFin.getCheckIsInvalid(object.finWorker.tabNumber,date_srez) > 0 )
		{
            // если инвалид
	        w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
	        w.chargeRef.code = FINChargeType.IS_INVALID;
		}
		else
		{   // если НЕ инвалид
			w.chargePercent =  hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
			w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
		}
		object.finWorker.code = wDAO.add(w);
	   }
   }

   int code = objectDAO.add(object);

   if (object.tktransportType.code != TKTransportType.MECHANIZM){
   TransportLogic eLogic = new TransportLogic(enConn, getUserProfile());
   if (object.transportReal != null){
	   if (object.transportReal.code != Integer.MIN_VALUE){
		   // расчитаем расходы !!!
		   eLogic.generateGSMEstimate(object.code);

		   FKOSLogic fkOsLogic = new FKOSLogic(finOSConn, getUserProfile());
		   TKTransportRealDAO trDAO = new TKTransportRealDAO(enConn, getUserProfile());
		   TKTransportReal transportRealObj = trDAO.getObject(object.transportReal.code);

		   // NET-3213 Ограничение использования автотранспорта
		   if(transportRealObj.isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
			   throw new EnergyproSystemException("Транспорт " + object.transportReal.name + " заборонено використовувати");

		   // NET-2938
		   boolean isInService = fkOsLogic.isInService(transportRealObj.invNumber);
//		   if(!isInService)
//			   throw new EnergyproSystemException("Інв. ном. " + transportRealObj.invNumber + " не введен в експлуатацію");

		      // пересчитаем время на хьменах ...
		      //new HumenLogic(enConn, getUserProfile()).createDeliveryTime(object.planRef.code);
		   HumenLogic hLogic1 = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		   hLogic1.createDeliveryTime(object.planRef.code);

	   }
   }
   else {

	   eLogic.generateNORMGSM(object.code);
   }

   ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
   logic.generatePlanFuelHistory(object.planRef.code);
   /////

   } // если не механизм

   //TransportLogic eLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
   //eLogic.calculateTransportItem(code);

   return code;
  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransportItem%} object.",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {
		try {
			if (finConn != null && ! finConn.isClosed()) {
				finConn.close();
				finConn = null;
			}
		} catch (SQLException e) {
		}
		try {
			if (finOSConn != null && ! finOSConn.isClosed()) {
				finOSConn.close();
				finOSConn = null;
			}
		} catch (SQLException e) {
		}
		try {
			if (enConn != null && ! enConn.isClosed()) {
				enConn.close();
				enConn = null;
			}
		} catch (SQLException e) {
		}
}
}


	@Override
	public void save(ENTransportItem object) {
		save(object, false, false, false);
	}

	public void saveForTransportOrder(ENTransportItem object) {
		save(object, true, false, true);
	}

	public void saveTransportForDistance(ENTransportItem object,
			boolean fromDistanceForTransport) {
		save(object, false, true, false);
	}

	public void save(ENTransportItem object, boolean fromTransportOrder,
			boolean fromDistanceForTransport, boolean fromTravelSheet) {

		Connection finConn = null;
		Connection finOSConn = null;
		Connection enConn = null;

		try {
			 enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			 /////
			 AuthLogic l = new AuthLogic(enConn, getUserProfile());
			 FinConnectionData finConnectionData = l.getFinConnectionData();
			 /////

			 boolean usesMDAXData = l.checkUsesMDAXData();

			 finOSConn = getConnection(AuthorizationJNDINames.FINMATERIAL_DATASOURCE);
			 finConn = getConnection(finConnectionData.connectionString);


			 // путевой лист не может быть без реального тр-та и водителя ...
			 /* чето вылетало НАЛЛ поинтер ... ;(
			 if ((object.numberList != null) || (object.numberList.trim().length() == 0))
			 {
				 if ((object.transportReal == null) || (object.transportReal.code == Integer.MIN_VALUE)){
					 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реальний транспорт ...");
				 }
				 if ((object.finWorker == null) || (object.finWorker.code == Integer.MIN_VALUE)){
					 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реального працівника ...");
				 }
			 }
			 */



	   /* 01.03.2012 проверка наличия изменяемого ENTransportItem'a в транспортной заявке */
	 if(!fromTransportOrder)
	 {
	   TransportOrderLogic toLogic = new TransportOrderLogic(enConn, getUserProfile());
	   toLogic.checkENTransportItemInTransportOrderByCode(object.code);
	 }

     ENPlanWork plan = new ENPlanWorkDAO(enConn, getUserProfile()).getObject(object.planRef.code);

     if ( (plan.kind.code != ENPlanWorkKind.NPW) && (plan.kind.code != ENPlanWorkKind.FACT) && (object.numberList != null)){
    	 throw new EnergyproSystemException("На месячном плане не должно быть Транспортных листов ...");
     }

     TransportLogic eLogic = new TransportLogic(enConn, getUserProfile());
     TransportRouteLogic tRoutLogic = new TransportRouteLogic(enConn, getUserProfile());
	 // путевой лист не может быть без реального тр-та и водителя ...
	 if (object.numberList == null)
	 {
	 }
	 else
	 {
		 if (object.numberList.trim().length() != 0)
		 {
			 if (object.transportReal == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реальний транспорт ...");

			 if (object.transportReal.code == Integer.MIN_VALUE){
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реальний транспорт ...");
			 }
			 else{
				 eLogic.checkTransportItemInTravelSheet(object.transportReal.code, plan.dateStart, true);
			 }

			 if (object.finWorker == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реального працівника ...");

			 if (object.finWorker.tabNumber == null)
				 throw new EnergyproSystemException("Видаліть номер подорожнього листа, або прив'яжіть реального працівника ...");
		 }
	 }



	 ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), enConn);
	 FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(), enConn);
	 ENTransportItem oldObject = new ENTransportItem();

	 oldObject = objectDAO.getObject(object.code);

	 if (oldObject.tktransportType.code != object.tktransportType.code)
	 {throw new EnergyproSystemException("Менять тип транспорта запрещенно!");}

	 int oldWorkerCode = Integer.MIN_VALUE;

   if ( object.planRef.code == Integer.MIN_VALUE){
  	 new EnergyproSystemException("planRef not found");
   }


    if (!fromTransportOrder)
    {
	  //AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  if ( ! l.checkPermission4PlanItems( plan ))
	  {
		  throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.add()");
	  }
    }

    PlanWorkLogic logic = new PlanWorkLogic(enConn, getUserProfile());

    if (!fromDistanceForTransport) {
    	   if (logic.isNotEditablePlan(plan) && !fromTransportOrder )
    	     {
    	  	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+object.planRef.code);
    	     }
    }

    /// SUPP-25730 п.2 - ограничение работы реального транспорта на Задании План в часах в день на разных планах
 if (!fromTravelSheet)
  if (object.tktransportType.code != TKTransportType.BRIGADE)  // бригадные машины не проверяем т.к на них не считается пмм
   if(object.countWorkFact.compareTo(new BigDecimal(0)) ==1 ) // пропускаем проверку если обнуляют машино часы
    if (object.transportReal != null ) {
	 if (object.transportReal.code != Integer.MIN_VALUE ) {
       if (plan.kind.code == ENPlanWorkKind.NPW ) {
        eLogic.checkMaxWorkTimeForRealTransportByDay(object.code , object.transportReal.code , plan.dateStart , object.countWorkFact );
       }
	 }
   }

   //if (( object.countWorkGen.doubleValue() != object.countWorkFact.doubleValue()) && (object.typeRef.code == ENEstimateItemType.AUTO)){
  //	 object.typeRef.code = ENEstimateItemType.CORRECTED;
  // }

   // NET-243 машино часы для Бригадного Автомобиля
   //   !!! NET-1197 Для работ на сторону правило отменяем )
    ENPlanWorkDAO PlanDAO = new  ENPlanWorkDAO(enConn, getUserProfile());
    ENPlanWork objPlan = PlanDAO.getObject(object.planRef.code);

   if (object.tktransportType.code == TKTransportType.BRIGADE && !fromDistanceForTransport){
	   if (( object.countWorkFact.doubleValue() != object.countWorkGen.doubleValue() ) && (objPlan.typeRef.code != ENPlanWorkType.WORK_IN_OUT ) && (objPlan.stateRef.code != ENPlanWorkState.WORK_IN_OUT ) ) {
		   throw new EnergyproSystemException("Машиногодини для бригадного автомобіля НЕ ЗМІНЮЮТЬСЯ !!!");
	   }
   }
   // + для ВСЕХ авто ...
	if (object.countWorkGen.doubleValue() != 0)
	{
		if ( object.countWorkFact.doubleValue() > object.countWorkGen.doubleValue())
			throw new EnergyproSystemException("Фактична кількість маш/год не повинна перевищувати нормативну ... треба збільшити кількість робіт ");
	}


   if ( object.countWorkGen.doubleValue() >= 0.0000001){
	     if (
	    		 ( object.countWorkFact.doubleValue() != object.countWorkGen.doubleValue())
	    		 && (object.typeRef.code == ENEstimateItemType.AUTO)
	    	)
	     {
	    	 object.typeRef.code = ENEstimateItemType.CORRECTED;
	     }
   }
   else
   {
  	 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLAN;
  	 if (object.planItemRef != null){
  		 if (object.planItemRef.code != Integer.MIN_VALUE){
  			 object.typeRef.code = ENEstimateItemType.MANUAL_BY_PLANITEM;
  		 }
  	 }
   }

   // для механизмов почти ничего делать не надо ...
   if (object.tktransportType.code == TKTransportType.MECHANIZM){
	   objectDAO.save(object);
	   eLogic.bindToRealTransport(object.planRef.code, object.transport.code, object.transportReal.code);
	   return;
   }
   ///////////////////////////////////////////////////////

   // + проверим транспорт в путевых ...
   eLogic.checkTransportItemInTravelSheet(object.code, true);


   ENTransportItem oldTransport = objectDAO.getObject(object.code);


   /////////////////////
   /* 17.08.12 Пока уберем, потому что иногда вылетает там, где не надо
   // 16.08.12 Проверим, чтобы не выносили реальный транспорт и водителя, если транспорт включен в совместную доставку
   boolean checkDeliveryOrder = false;

   if (object.transportReal == null)
   {
	   checkDeliveryOrder = true;
   }
   else
	   if (object.transportReal.code == Integer.MIN_VALUE)
	   {
		   checkDeliveryOrder = true;
	   }

   if (object.finWorker == null)
   {
	   checkDeliveryOrder = true;
   }
   else
	   if (object.finWorker.code == Integer.MIN_VALUE)
	   {
		   checkDeliveryOrder = true;
	   }

   if (checkDeliveryOrder)
   {
	   eLogic.validateDeliveryOrder(object.code);
   }
   */
   /////////////////////



			HumenLogic hLogic = new HumenLogic(enConn, getUserProfile());

			// развяжем реального работника на транспорте ...
			FINWorker w = new FINWorker();

			if (object.finWorker != null) {
				if (object.finWorker.tabNumber != null) {


				if  (object.finWorker.code > Integer.MIN_VALUE) {
					w = wDAO.getObject(object.finWorker.code);
					if (oldTransport.finWorker != null ){
						if (oldTransport.finWorker.code > Integer.MIN_VALUE){
							if (oldTransport.finWorker.tabNumber != object.finWorker.tabNumber){
								//eLogic.validateEditableTransport(oldTransport.code);
								eLogic.validateDeliveryOrder(oldTransport.code);
							}
						}
					}
				}

				// проверим является ли воркер инвалидом
		 		// дата среза проверки принимаем на дату старт плана
		 		Date date_srez;

		 		ENPlanWork pw = logic.getPlanByCode(object.planRef.code);
		 		date_srez = pw.getDateStart();

		 		FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());
				FINWorkerDAO finWorkerDao = new FINWorkerDAO(getUserProfile(), finConn);


				FINWorkerFilter ff = new FINWorkerFilter();
				ff.tabNumber = object.finWorker.tabNumber;

				FINWorkerShortList fList = finWorkerDao.getFINWorkerList(ff, 0, -1, date_srez, true);
				if (fList.totalCount > 0) {
					w.categor = fList.get(0).categor;
					w.departmentCode = fList.get(0).departmentCode;
					w.departmentName = fList.get(0).departmentName;
					w.finCode = fList.get(0).finCode;
	                w.kindRef.code = (fList.get(0).categor == Integer.MIN_VALUE) ? FINWorkerKind.OTHER : fList.get(0).categor;
	                w.name = fList.get(0).name;
	                w.positionCode = fList.get(0).positionCode;
	                w.positionName = fList.get(0).positionName;
	                w.priceGen = fList.get(0).priceGen;
	                w.tabNumber = fList.get(0).tabNumber;
	                /////
	                w.categorId = fList.get(0).categorId;
	                w.categorName = fList.get(0).categorName;
	                w.workTimeId = fList.get(0).workTimeId;
	                /////
	                // MDAX-441
	                w.positionId = fList.get(0).positionId;

	                w.code = Integer.MIN_VALUE;

	         		///// 07.12.11 Убираем признак "Командировочный" вообще, потому что с ним неправильно рассчитывается з/п
	         		//w.isSentAssignment = object.finWorker.isSentAssignment;
	         		w.isSentAssignment = 0;
	         		/////

	         		if (usesMDAXData) {
	        			//SUPP-2238 Пока сотрудников керивництва можно добавлять только в акты на списання паливно-мастильних матеріалів
	        			if(w.departmentCode.substring(0,3).equals(FKConsts.AX_PODR_MANAGEMENT_ID) && plan.stateRef.code != ENPlanWorkState.TRUCKING)
	        			{
	        				ENPlanWorkStateDAO planWorkStateDAO = new ENPlanWorkStateDAO(enConn, getUserProfile());
	        				ENPlanWorkState planType = planWorkStateDAO.getObject(plan.stateRef.code);
	        				throw new EnergyproSystemException("Співробітника " + object.finWorker.name + " не можливо додати на план з типом акту " + planType.name);

	        			}
	         		} else {
	        			//SUPP-2238 Пока сотрудников керивництва можно добавлять только в акты на списання паливно-мастильних матеріалів
	        			if(w.departmentCode.trim().equals((""+FKConsts.PODR_MANAGEMENT_ID).trim()) && plan.stateRef.code != ENPlanWorkState.TRUCKING)
	        			{
	        				ENPlanWorkStateDAO planWorkStateDAO = new ENPlanWorkStateDAO(enConn, getUserProfile());
	        				ENPlanWorkState planType = planWorkStateDAO.getObject(plan.stateRef.code);
	        				throw new EnergyproSystemException("Співробітника " + object.finWorker.name + " не можливо додати на план з типом акту " + planType.name);

	        			}
	         		}

         	    	// если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
         			// иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1

					if (fLogicFin.getCheckIsInvalid(
							object.finWorker.tabNumber, date_srez) > 0) {
						// если инвалид
						w.chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_INVALID,date_srez );
						w.chargeRef.code = FINChargeType.IS_INVALID;
					} else {
						// если НЕ инвалид
						w.chargePercent = hLogic.getChargePercentByDate(FINChargeType.IS_NOT_INVALID,date_srez );
						w.chargeRef.code = FINChargeType.IS_NOT_INVALID;
					}

					object.finWorker.code = wDAO.add(w);

					} else {

						w = new FINWorker();
						object.finWorker = new FINWorker();
					}

				} else {
				   // очистим привязку к воркеру ..
				   if ( oldTransport.finWorker != null ){
					   if (oldTransport.finWorker.code != Integer.MIN_VALUE ){
						   oldWorkerCode = oldTransport.finWorker.code;
						   //eLogic.validateEditableTransport(oldTransport.code);
						   eLogic.validateDeliveryOrder(oldTransport.code);
					   }
				   }
				}
			} else {
			   // очистим привязку к воркеру ..
			   if ( oldTransport.finWorker != null ){
				   if (oldTransport.finWorker.code != Integer.MIN_VALUE ){
					   oldWorkerCode = oldTransport.finWorker.code;
					   //eLogic.validateEditableTransport(oldTransport.code);
					   eLogic.validateDeliveryOrder(oldTransport.code);
				   }
			   }
		   }

		   	// привязка к реальному авто .. для совм. доставик ..
		   	if (oldTransport.transportReal != null){
			   if (oldTransport.transportReal.code != Integer.MIN_VALUE){
				   if (object.transportReal != null){
					   if (object.transportReal.code != Integer.MIN_VALUE){

						   if (oldTransport.transportReal.code != object.transportReal.code){
							   //eLogic.validateEditableTransport(oldTransport.code);
							   eLogic.validateDeliveryOrder(oldTransport.code);
						   }


					   }
					   else
					   {
						   //eLogic.validateEditableTransport(oldTransport.code);
						   eLogic.validateDeliveryOrder(oldTransport.code);
					   }
				   }
				   else
				   {
					   //eLogic.validateEditableTransport(oldTransport.code);
					   eLogic.validateDeliveryOrder(oldTransport.code);
				   }
			   }
		   	}


  			objectDAO.save(object);


   			// Для стороннего транспорта не обновляем водителя на всем транспорте плана
			if (object.transportReal.transportstatus.code == TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {
				return;
			}

			// и накинем ЭТОГО воркера на все транспорты этого типа ...
			if (w.code != Integer.MIN_VALUE) {
				eLogic.bindToFINWorker(object.planRef.code, object.transport.code, w.code);
			}


			if (oldWorkerCode != Integer.MIN_VALUE) {
				wDAO.remove(oldWorkerCode);
			}


		    //eLogic.calculateTransportItem(object.code);


		    // перепривяжем ВЕСЬ похожий транспорт ...
		    // по нормативному .. и тот который не привязан к реальному ..
		    // типа все ГАЗ-66 на плане ... к реальному транспорту
		    // тут же наверно можно и реальных работников накинуть ...
			if (object.transportReal != null) {
				if (object.transportReal.code != Integer.MIN_VALUE) {

					FKOSLogic fkOsLogic = new FKOSLogic(finOSConn, getUserProfile());
					TKTransportRealDAO trDAO = new TKTransportRealDAO(getUserProfile(), enConn);
					TKTransportReal transportRealObj = trDAO.getObject(object.transportReal.code);

					// NET-3213 Ограничение использования автотранспорта
					if (transportRealObj.isNotUsed == ENConsts.TRANSPORT_REAL_ISNOTUSED)
						throw new EnergyproSystemException("Транспорт " + transportRealObj.name + " заборонено використовувати");

					// NET-2938
					/** 28.05.2014 +++ не проверяем ввод в эксплуатацию для стороннего транспорта... */
					if (transportRealObj.transportstatus.code != TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {
						boolean isInService = fkOsLogic.isInService(transportRealObj.invNumber);
//						if (!isInService)
//							throw new EnergyproSystemException("\n\n"
//									+ "Інв. ном. " + transportRealObj.invNumber + " не введен в експлуатацію");
					}

					if (oldTransport.transportReal != null) {
						if (oldTransport.transportReal.code > Integer.MIN_VALUE){
							if (oldTransport.transportReal.code != object.transportReal.code){
								//eLogic.validateEditableTransport(oldTransport.code);
								eLogic.validateDeliveryOrder(oldTransport.code);
							}
						}
					}

					eLogic.bindToRealTransport(object.planRef.code, object.transport.code, object.transportReal.code);

					// расчитаем расходы !!!
					boolean isRouteCalcul = tRoutLogic.isPresentRouteInPlan(object.code);
					// если на плане есть роуты и автомобили автокран или грузовой тогда расчитываем по маршрутам

					if (isRouteCalcul
							&& (object.transport.transportClassification.code == TKTransportClassification.AVTO_KRAN
							|| object.transport.transportClassification.code == TKTransportClassification.AVTO_CARGO)) {
						tRoutLogic.generateGSMEstimateByRoute(object.code);
					} else {
						eLogic.generateGSMEstimate(object.code);
					}

					// пересчитаем время доставки ...
					// меняют все в ХЛАМ ....
					eLogic.createDeliveryTimeForPlan(object.planRef.code);

					// пересчитаем время на хьменах ...
					hLogic.createDeliveryTime(object.planRef.code);

				} else {
					eLogic.generateNORMGSM(object.code);
					eLogic.createDeliveryTimeForPlan(object.planRef.code);
					hLogic.createDeliveryTime(object.planRef.code);
				}

			} else {
				eLogic.generateNORMGSM(object.code);
				eLogic.createDeliveryTimeForPlan(object.planRef.code);
				hLogic.createDeliveryTime(object.planRef.code);
			}

        // NET-2681 Расчетное количество дней использования транспорта на плане .
        // пока не приступать)  eLogic.recalcTotalTimeForNormativeTransport(object.planRef.code);

	    //System.out.println(eLogic.calculateTimeForPlanByDistance(object.planRef.code , 0));

	    ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
	    logic.generatePlanFuelHistory(object.planRef.code);
	    /////

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTransportItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			try {
				if (finConn != null && !finConn.isClosed()) {
					finConn.close();
					finConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (finOSConn != null && !finOSConn.isClosed()) {
					finOSConn.close();
					finOSConn = null;
				}
			} catch (SQLException e) {
			}
			try {
				if (enConn != null && !enConn.isClosed()) {
					enConn.close();
					enConn = null;
				}
			} catch (SQLException e) {
			}
		}
	}



public void saveTimeFact(int transportItemCode, java.math.BigDecimal countFact)
{
 try
  {
	 ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	 ENTransportItem obj = objectDAO.getObject(transportItemCode);

	 if (obj.tktransportType.code == TKTransportType.BRIGADE){
		 throw new EnergyproSystemException("Для бригадного автомобіля машино/години не змінюються ");
	 }

	 obj.countWorkFact = countFact.setScale(2, BigDecimal.ROUND_HALF_UP);

	 TKTechCardDAO kDao = new TKTechCardDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

	 ENPlanWork plan = new ENPlanWorkDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)).getObject(obj.planRef.code);

	 ENPlanWorkItem pwi = new ENPlanWorkItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)).getObject(obj.planItemRef.code);

	 ENTransportItemData data = kDao.getTransportDataItemsByTransportCodeAndTechCardCode(obj.transport.code, pwi.kartaRef.code );

	if ((data.transportType != Integer.MIN_VALUE) && (plan.typeRef.code != ENPlanWorkType.TRUCKING))
	{
		if ((obj.countWorkFact.doubleValue() > obj.countWorkGen.doubleValue())
				&& (obj.countWorkGen.doubleValue() != 0)){
				throw new EnergyproSystemException("Фактична кількість маш/год не повинна перевищувати нормативну ... треба збільшити кількість робіт ");
		}
	}

	 objectDAO.save(obj);

  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTransportItem%} object.",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
}


@Override
public void remove(int code)
{
 try
  {

	 ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	 ENTransportItem obj = objectDAO.getObject(code);

	 ENPlanWork plan = new ENPlanWorkDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).getObject(obj.planRef.code);

	  AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	  if ( ! l.checkPermission4PlanItems( plan ))
	  {
		  throw new EnergyproSystemException("Acces denied for method addBy... from method ENPlanWorkItem.add()");
	  }

   PlanWorkLogic logic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
   if (logic.isNotEditablePlan(plan)) {
  	 throw new EnergyproSystemException("PlanWork closed or canceled , code="+obj.planRef.code);
   }

   // удалим водилу который привязан к этому транспорту ...
   /* усе в REMOVE !!!!
   if (obj.finWorker != null){
	   if (obj.finWorker.code > Integer.MIN_VALUE){
           FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
           wDAO.remove(obj.finWorker.code);
       }
   }
   */

   TransportLogic eLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

   // + проверим транспорт в путевых ...
   if ( obj.tktransportType.code != TKTransportType.MECHANIZM){
	   eLogic.checkTransportItemInTravelSheet(code, true);
   }

   if (obj.transportReal.code != Integer.MIN_VALUE){
	   eLogic.checkTransportItemInTravelSheet(obj.transportReal.code, plan.dateStart, true);
   }

   /* 01.03.2012 проверка наличия удаляемого ENTransportItem'a в транспортной заявке */
   TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
   toLogic.checkENTransportItemInTransportOrderByCode(obj.code);


   // AS 23.03.2011
   // выносят реальный транспорт с ФАКТА .. а план в Маршрутном ЛИСТЕ !!!
   // так НЕЛЬЗЯ
   if (plan.kind.code == ENPlanWorkKind.FACT){
	   ENTransportItem2TransportItemDAO t2tDAO = new ENTransportItem2TransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
	   ENTransportItem2TransportItemFilter t2tFilter = new ENTransportItem2TransportItemFilter();
	   t2tFilter.outRef.code = obj.code;
	   ENTransportItem2TransportItemShortList t2tList = t2tDAO.getScrollableFilteredList(t2tFilter, 0, -1);
	   if (t2tList.totalCount > 0){
		   eLogic.checkTransportItemInTravelSheet(t2tList.get(0).inRefCode, true);
	   }
   }

   //в Ремове удаляються : расстояния, работники и БЕНЗИН из МАтериалов
   objectDAO.remove(code);

   if ( obj.tktransportType.code != TKTransportType.MECHANIZM){

	   eLogic.createDeliveryTimeForPlan(obj.planRef.code);

	   // пересчитаем время на хьменах ...
	   new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile()).createDeliveryTime(obj.planRef.code);
   }

   ///// NET-4440 Сохраняем историю изменения объемов ГСМ по плану
   logic.generatePlanFuelHistory(obj.planRef.code);
   /////
  }
 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportItem%} object.",e);}
 catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
 finally                              {closeConnection();}
}

@Override
public int[] getScrollableFilteredCodeArray(ENTransportItemFilter filterObject, int fromPosition, int quantity)
{
    try
     {
      ENTransportItemDAO objectDAO = new ENTransportItemDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      return objectDAO.getFilteredCodeArray(filterObject, fromPosition, quantity);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

public void TEMP_GENERATE_GSM(int i)

{
	try {

	TransportLogic trl = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

    	trl.generateGSMEstimate(i);
    	System.out.println("generate GSM for transportitem: " + i);

		///// NET-4440 Сохраняем историю ГСМ по плану
		ENTransportItemDAO tiDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENTransportItem transportItem = tiDAO.getObject(i);

		if (transportItem != null)
		{
			PlanWorkLogic planLogic = new PlanWorkLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			planLogic.generatePlanFuelHistory(transportItem.planRef.code);
		}
	    /////
	}
	 catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get code array of {%com.ksoe.energynet.valueobject.ENTransportItem%} objects.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}

}

public void addDistanceForTransport(int transportItemCode, java.math.BigDecimal distance, int amountOfJourneys) throws java.rmi.RemoteException
{
	  try
	  {
		 TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		 tLogic.addDistanceForTransport(transportItemCode, distance, amountOfJourneys);
		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		 ENTransportItem ti = tiDAO.getObject(transportItemCode);
		 this.saveTransportForDistance(ti, true);
	  }
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}

}

public void removeDistanceForTransport(int transportItemCode) throws java.rmi.RemoteException
{
	  try
	  {
		 TransportLogic tLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		 tLogic.removeDistanceForTransport(transportItemCode);
		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		 ENTransportItem ti = tiDAO.getObject(transportItemCode);
		 this.saveTransportForDistance(ti, true);
	  }
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportOrder%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}

}


public void updateTransportDepartment(int transportItemCode, int transportDepartmentCode) throws java.rmi.RemoteException
{
	  try
	  {

		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		 tiDAO.updateTransportDepartmentOnTransportitem(transportItemCode,transportDepartmentCode);

	  }
catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't assignToTransportDept {%com.ksoe.energynet.valueobject.ENTransportitem%} object.",e);}
catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
finally                              {closeConnection();}

}


} // end of EJB Controller for ENTransportItem