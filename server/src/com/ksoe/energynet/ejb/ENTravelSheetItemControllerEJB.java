
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTravelSheetItem;
  *
  */



import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetFuelRemainsDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistanceDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetItemControllerEJBGen;
import com.ksoe.energynet.logic.GlobusLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.TransportOrderLogic;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.logic.TravelSheetLogic;
import com.ksoe.energynet.logic.WorkOrderLogic;
import com.ksoe.energynet.valueobject.ENTransportOrder;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel;
import com.ksoe.energynet.valueobject.ENTravelSheetFuelRemains;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.ENWorkOrder;
import com.ksoe.energynet.valueobject.brief.ENTravelSheetItemShort;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFuelRemainsFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;
import com.ksoe.techcard.valueobject.TKFuelCalcType;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportRealHistory;

public class ENTravelSheetItemControllerEJB extends ENTravelSheetItemControllerEJBGen
 {

  public ENTravelSheetItemControllerEJB() {}


  public ENTravelSheetItemShortList getListForFact(int travelSheetCode)
  {
   try
    {
     ENTravelSheetItemDAO objectDAO = new ENTravelSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
     return objectDAO.getListForFact(travelSheetCode);
    }
   catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't get list of {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} objects.",e);}
   catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
   finally                              {closeConnection();}
  }

  /*ENTravelSheetItem. ��������*/
  @Override
public int add(ENTravelSheetItem object)
   {
    try
     {

      ENTravelSheetItemDAO objectDAO = new ENTravelSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
      TravelSheetLogic l = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

      ENTravelSheet travelSheet = l.getTravelSheetByCode(object.travelSheetRef.code);

      // 22.11.2011 NET-969 ��� ��������� �������� ��������� ����������
      if (travelSheet.typeRef.code == ENTravelSheetType.TRAKTOR){
    	  object.setSpeedometerStart(new BigDecimal(0));
    	  object.setSpeedometerFinal(new BigDecimal(0));
      }

      return objectDAO.add(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }

  public void save4transportRoute(ENTravelSheetItem object) {
	  this.save(object, true);
  }

  @Override
public void save(ENTravelSheetItem object) {
	  this.save(object, false);
  }


  /*ENTravelSheetItem. ��������*/
  public void save(ENTravelSheetItem object, boolean IsTransportRoute)
   {
	  Connection globusConn = null;
	  Connection enConn = null;
    try
     {
    	globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
    	enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

      ENTravelSheetItemDAO objectDAO = new ENTravelSheetItemDAO(getUserProfile(), enConn);
      TravelSheetLogic l = new TravelSheetLogic(enConn,getUserProfile());
      ENTransportRouteDAO transpRouteDAO = new ENTransportRouteDAO(getUserProfile(), enConn);
      ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getUserProfile(), enConn);
      TKTransportRealDAO trDAO = new TKTransportRealDAO(enConn, getUserProfile());
      ENTransportRouteShortList transRouteList = new ENTransportRouteShortList();
      ENTransportRouteFilter trRouteFilter = new ENTransportRouteFilter();
      ENTravelSheet travelSheet = l.getTravelSheetByCode(object.travelSheetRef.code);
      ENTravelSheetItem oldObject = objectDAO.getObject(object.code);
      TKTransportReal transportReal = trDAO.getObject(travelSheet.transportReal.code);
      TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	  TKTransportRealHistory trh = transportLogic.getHistory(travelSheet.transportReal.code, travelSheet.dateFinal);

      // NET-4333 ��������� ������ ������ ������������� � �������
      if(object.statusRef.code == ENTravelSheetItemStatus.DELETED)
    	  throw new EnergyproSystemException("������ ������������ ����� ��� ��������");

      if(object.kindRef.code == ENTravelSheetItemKind.FACT)
      {
    	  BigDecimal itemDistancesSum = itemDistanceDAO.getSumDistancesByTravelSheetItemCode(object.code); // ����� ����������
    	  BigDecimal itemDistancesMachineHoursSum = itemDistanceDAO.getSumMachineHoursByTravelSheetItemCode(object.code); // ����� ����������� ����������
    	  BigDecimal speedometerStart = (object.speedometerStart == null) ? new BigDecimal(0) : object.speedometerStart;
    	  BigDecimal speedometerFinal = (object.speedometerFinal == null) ? new BigDecimal(0) : object.speedometerFinal;
    	  BigDecimal itemDistance = speedometerFinal.subtract(speedometerStart); // ������ �� ������ �������� �����
    	  BigDecimal itemSumMachineHours = (object.sumMachineHours == null) ? new BigDecimal(0) : object.sumMachineHours; // ����� ����������� �� ������ �������� �����
    	  
    	  if (trh.reg_id != Integer.MIN_VALUE && !IsTransportRoute) {
			  // ������� ����� �� ������� � ����� �� ����������� �� ��������� �������
			  BigDecimal itemHoursWorkbyGPS = object.hoursStopWorkByGPS;
			  if (object.hoursStopWorkByGPS != null) {
				  BigDecimal transportItemsHoursFact = transportLogic.getMachineHoursByTravelSheetItem(object.code);
				  if (transportItemsHoursFact.compareTo(itemHoursWorkbyGPS) == 1) {
					  throw new SystemException("�������� ���� ����������� � ������� ����� �������� ���� ���������� ����������� � ����!");
				  }
			  }
		  }
    	  
    	  // �������� ����������� � ������� � ������������ � ��������� �� ����������
    	  if(itemSumMachineHours.compareTo(itemDistancesMachineHoursSum) == -1)
    		  throw new EnergyproSystemException("�������� ���� ����������� �� ����� ������������ ����� (" + itemSumMachineHours + ") ������ �� ������ ������������ �� ���������� (" + itemDistancesMachineHoursSum + ")");
    	  if(itemDistance.compareTo(itemDistancesSum) == -1 && travelSheet.typeRef.code != ENTravelSheetType.TRAKTOR)
    		  throw new EnergyproSystemException("��������� ����� �� ����� ������������ ����� (" + itemDistance + " ��.) ������� �� �������� �� ���������� (" + itemDistancesSum + " ��.)");
      }

      // �������� ������� �� ������ �������� ����� �� �������� ���������
      // ���� - ��, �� ��������� ������ (������ �������� ���������� �� ����� ���������)
      trRouteFilter.planRef.code = object.planRef.code;
      transRouteList = transpRouteDAO.getScrollableFilteredList(trRouteFilter, 0, -1);
      if ((transRouteList.totalCount > 0) && !IsTransportRoute)
      {
    	  if(oldObject.speedometerStart == null)
    		  throw new EnergyproSystemException("�������� �������� ��������!");

    	  if(object.speedometerStart.compareTo(oldObject.speedometerStart) != 0 || object.speedometerFinal.compareTo(oldObject.speedometerFinal) != 0)
    		  throw new EnergyproSystemException("������ � ���������� ���������� �� ������� � ����������!");
      }

      // 22.11.2011 NET-969 ��� ��������� �������� ��������� ����������
      if (travelSheet.typeRef.code == ENTravelSheetType.TRAKTOR){
    	  object.setSpeedometerStart(new BigDecimal(0));
    	  object.setSpeedometerFinal(new BigDecimal(0));
      }

      if ((object.speedometerStart != null) && (object.speedometerFinal != null))
      {

    	  l.chkSpeedometer(object.speedometerStart, object.speedometerFinal, "����������",  true);



    	  if (travelSheet.speedometerStart != null){
    		  if ( ! l.chkSpeedometer(travelSheet.speedometerStart, object.speedometerStart, "����������", false) ){
    			  throw new EnergyproSystemException("�������� ��������� � ������� ����� �� �������� � ������������ ���� ...");
    		  }
    	  }

    	  if (travelSheet.speedometerFinal != null){
    		  if ( ! l.chkSpeedometer(object.speedometerFinal, travelSheet.speedometerFinal, "����������", false) ){
    			  throw new EnergyproSystemException("ʳ���� ��������� ���������� � ������� ����� �� ����� � ������������ ���� ...");
    		  }

    	  }
    	  //l.chkDistance(object.speedometerStart, object.speedometerFinal, object.sumDistances, true);

    	  // ��������� �� � ����������� �� ����� ������������ ����� ...
      }

      if ((object.fuelCounterStart != null) && (object.fuelCounterFinal != null))
      {

    	  l.chkSpeedometer(object.fuelCounterStart, object.fuelCounterFinal, "��������� ������",  true);

    	  //ENTravelSheet travelSheet = l.getTravelSheetByCode(object.travelSheetRef.code);

    	  if (travelSheet.fuelCounterStart != null){
    		  if ( ! l.chkSpeedometer(travelSheet.fuelCounterStart, object.fuelCounterStart, "��������� ������", false) ){
    			  throw new EnergyproSystemException("�������� ��������� ��������� ������ � ������� ����� �� �������� � ������������ ���� ...");
    		  }
    	  }

    	  if (travelSheet.fuelCounterFinal != null){
    		  if ( ! l.chkSpeedometer(object.fuelCounterFinal, travelSheet.fuelCounterFinal, "��������� ������", false) ){
    			  throw new EnergyproSystemException("ʳ���� ��������� ��������� ������ � ������� ����� �� ����� � ������������ ���� ...");
    		  }

    	  }
    	  //l.chkDistance(object.speedometerStart, object.speedometerFinal, object.sumDistances, true);

    	  // ��������� �� � ����������� �� ����� ������������ ����� ...
      }

      if (( object.timeStart != null) && (object.timeFinal != null)){
    	  l.chkTimes(object.timeStart, object.timeFinal, true);
    	  l.chkTravelSheetItemsTimes(object.timeStart, object.timeFinal, travelSheet.timeStart, travelSheet.timeFinal, true);
      }

      boolean isDelivery = false;
      if ((object.commentGen != null) && object.commentGen.compareToIgnoreCase("������ ��������") == 1)
		  isDelivery = true;


      if (object.kindRef.code == ENTravelSheetItemKind.FACT && !isDelivery && !IsTransportRoute) {
      /// �������� �� ����������� ��� � ������� ����� �������� �����
      ENTravelSheetItemFilter overlapsFilter = new ENTravelSheetItemFilter();
      overlapsFilter.travelSheetRef.code = object.travelSheetRef.code;
      overlapsFilter.kindRef.code = ENTravelSheetItemKind.FACT;
      overlapsFilter.statusRef.code = ENTravelSheetItemStatus.CALCULATED;
      overlapsFilter.conditionSQL = " entravelsheetitem.code <> ? " +
           		      " and coalesce(entravelsheetitem.commentgen,'') <> '������ ��������'" + 
                      " and (entravelsheetitem.timestart,entravelsheetitem.timefinal) overlaps (?, ?)";
      Vector<Object> overlapsParams = new Vector<Object>();
      overlapsParams.add(object.code);
      overlapsParams.add(new java.sql.Timestamp(object.timeStart.getTime()));
      overlapsParams.add(new java.sql.Timestamp(object.timeFinal.getTime()));
      
      ENTravelSheetItemShortList overlapsList = objectDAO.getScrollableFilteredList(overlapsFilter, 0, -1, overlapsParams);

      if (overlapsList.totalCount > 0) {
    	  throw new SystemException("��� ������ ������������ � ������ �������� ����� ������������ �����!");
         } 
      }      
      
      // 29.11.2011 NET-340 ��� ���������� ������������ ������-����� ������ ������
      if ((object.statusRef.code == ENTravelSheetItemStatus.GOOD) &&
    		  (object.kindRef.code == ENTravelSheetItemKind.FACT)){
    	  object.statusRef.code = ENTravelSheetItemStatus.CALCULATED;
      }

      // NET-1184 ������������ ����������� - ��������� ����� ������ ��������
      	// ���� ������������� �� ������ - ���� ������ �� ��������� �� ����, ����� ������� ���� ������
      TransportOrderLogic toLogic = new TransportOrderLogic(enConn,getUserProfile());
      ENTransportOrder toObj = toLogic.getTransportOrderByTravelSheetItemCode((object.kindRef.code == ENTravelSheetItemKind.FACT ? object.parentItemRef.code : object.code));

      if(toObj != null && object.kindRef.code == ENTravelSheetItemKind.PLAN) {
    	  Date objDate = new Date(toObj.timeStart.getYear(),
    			  					toObj.timeStart.getMonth(),
    			  					toObj.timeStart.getDate(),
    			  					( object.timeStart == null ? toObj.timeStart.getHours() : object.timeStart.getHours() ),
    			  					( object.timeStart == null ? toObj.timeStart.getMinutes() : object.timeStart.getMinutes() ),
    			  					0);
    	  object.timeStart = objDate;


    	  objDate = new Date(toObj.timeFinal.getYear(),
					toObj.timeFinal.getMonth(),
  					toObj.timeFinal.getDate(),
  					( object.timeFinal == null ? toObj.timeFinal.getHours() : object.timeFinal.getHours() ),
  					( object.timeFinal == null ? toObj.timeFinal.getMinutes() : object.timeFinal.getMinutes() ),
  					0);
    	  object.timeFinal = objDate;
      }
      

      objectDAO.save(object);

      // ����������� ������ �� ���������������???
      // ���� �� ����� ����� ���������� ���������� ...


      l.recalcItems(object.code);

      // ������� ������ ....
      if (object.kindRef.code == ENTravelSheetItemKind.FACT){

    	  TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(enConn,getUserProfile());
          // SUPP-6879 ������ �������� ����������� � ������ ��������
          if(trh.fuelCalcTypeRef.code != TKFuelCalcType.BY_FUEL_LEVEL_SENSOR) {
              object.rashodProbeg = transportReal.rashodProbeg;
              object.rashodWork = transportReal.rashodWork;
              object.transportKoef = trDAO.getAggregateSumKoefs(transportReal.code);
          } else {
        	  object.rashodProbeg = fuelLogic.getNormRashodByGlobus(travelSheet, false);
        	  object.rashodWork = fuelLogic.getNormRashodByGlobus(travelSheet, true);
        	  object.transportKoef = null;
          }
    	  // + ��� �� ������� �� ��� ���� �� ������ + ������� ������� �� ������� ����� .../// ��� �� ������� ...
    	   // QQ
    	  // ������� ������� ��� �������� ... � �� ����� �� ������� � generateGSMEstimateByTravelSheetItem

    	  /*��������, ��� ����� �������� ������ ������ ��� ��������� ����� �� ��������*/
    	  if(object.heatingTime != null)
    	  {
        	  BigDecimal sumHoursInTravel = l.getHoursInTravel(travelSheet);
        	  if(object.heatingTime.compareTo(sumHoursInTravel) > 0)
        		  throw new EnergyproSystemException("ʳ������ ���� �� ����� ("
        				  + object.heatingTime + ") �� ���� ���� ������ �� ������� ������� ���� ������������ ����� ("
        				  + sumHoursInTravel + ")");

    	  }

    	  ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(),enConn);

			//BigDecimal countOut = new BigDecimal(0);

	    	ENTravelSheetFuel[] fuelsOUT = fuelLogic.getFuelByTravelSheetItem(object.code);

			if (fuelsOUT != null){
				for (int j = 0; j < fuelsOUT.length; j++){


						if (fuelsOUT[j].countGen.doubleValue() != 0){
					    	ENTravelSheetFuelRemainsFilter ff = new ENTravelSheetFuelRemainsFilter();
					    	ff.travelSheetRef.code = travelSheet.code;
					    	ff.fuelTypeRef.code = fuelsOUT[j].fuelType.code;
					    	int[] remArr = remDAO.getFilteredCodeArray(ff, 0, -1);

					    	if (remArr.length != 1)
					    		throw new EnergyproSystemException("��������� �������� ... ������ ���� �� ������ ��� ���������� �������� �� ��� ������� ...");

					    	for (int i=0; i < remArr.length; i++){
					    		ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
					    		rem.countGenOut = rem.countGenOut.subtract(fuelsOUT[j].countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					    		rem.priceGenOut = rem.sumGenOut =  new BigDecimal(0);
					    		rem.countGenFinal = rem.countGenFinal.add(fuelsOUT[j].countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
					    		remDAO.save(rem);
					    	}
					}
			}



			} // ������ ��� ��� ��� �������� .. � �������� �� ��� ������ 0 .. ���� �������� �� ����

    	 // NET-1693 -  ����������� �����  �� ���������� ���������� �� ������ ��������� ����

		  // trtFuelLogic.recalcEntransportRouteBySpeedometer(object);

    	  fuelLogic.generateGSMEstimateByTravelSheetItem(object.code);
    	  fuelLogic.updateRemainderOUT(object.travelSheetRef.code);
    	  if(trh.fuelCalcTypeRef.code == TKFuelCalcType.BY_FUEL_LEVEL_SENSOR
    			  && object.kindRef.code == ENTravelSheetItemKind.FACT) {
    		  // ��� ������ ������ ������� ���������� ������� ������������ ��������� ������� � ���� �
    		  // �������� �� ��� ������ � ����������������� ��� � ������ �������������
    		  // ����������� ���� ��� ������ ���� ���������
    		  int countCalculated = l.getTravelSheetItemCodesByTravelListCode(travelSheet.code, ENTravelSheetItemKind.FACT, ENTravelSheetItemStatus.CALCULATED).length;
    		  int countAll = l.getTravelSheetItemCodesByTravelListCode(travelSheet.code, ENTravelSheetItemKind.FACT).length;
    		  if(countAll == countCalculated) {
    			  fuelLogic.travelSheetFuelRemainsCorrectionWithGlobus(travelSheet, object);
    		  }
    	  }


      }

      //new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile()).generateGSMEstimateByTravelSheetItem(object.code);
      // NET-2365 - ��������� ���������� � ������� ���� ��� ��������� ���������� � �������
      l.recalcDistanceByTravelsheetKm(object);
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally
    {
    try {
		if (globusConn != null && ! globusConn.isClosed()) {
			globusConn.close();
			globusConn = null;
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

  public void removeByTransportCodes(int itemCode, int[] transportItemCodes)
  {
	    try
	     {
	      ENTravelSheetItemDAO objectDAO = new ENTravelSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      ENTravelSheetItem2TransportItemDAO t2tDAO = new ENTravelSheetItem2TransportItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	      TravelSheetLogic logic = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	      TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	      TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	      //TransportLogic transportLogic =  new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	      for(int i = 0; i < transportItemCodes.length; i++)
	      {
	    	  toLogic.checkENTransportItemInTransportOrderByCode(transportItemCodes[i]);
	      }
	      ENTravelSheetItem item = objectDAO.getObject(itemCode);
	      ENTravelSheetFuel[] fuelsOUT = null;
	      if (item.kindRef.code == ENTravelSheetItemKind.FACT){
	    	  fuelsOUT = fuelLogic.getFuelByTravelSheetItem(item.code);
	      }

	      for (int i = 0; i < transportItemCodes.length; i++){
	    	  ENTravelSheetItem2TransportItemFilter f = new ENTravelSheetItem2TransportItemFilter();
	    	  f.travelSheetItemRef.code = itemCode;
	    	  f.transportItemRef.code = transportItemCodes[i];
	    	  int[] arr = t2tDAO.getFilteredCodeArray(f, 0, -1);
	    	  for (int j=0; j < arr.length; j++ ){
	    		  t2tDAO.remove(arr[j]);
	    	  }
	    	  logic.clearENTransportItem(transportItemCodes[i]);

	    	  // ������� ��� �� ���� ������ ..
	    	 //transportLogic.removeGSMByTransportItemCode(transportItemCodes[i]);


	      }


	      boolean isRemoveItem = false;
	      // ���� ���� ���� - ����� ������ ����� ;)
	      ENTravelSheetItem2TransportItemFilter f = new ENTravelSheetItem2TransportItemFilter();
	      f.travelSheetItemRef.code = itemCode;
	      int[] arr = t2tDAO.getFilteredCodeArray(f, 0, -1);
	      if (arr.length == 0){
	    	  objectDAO.remove(itemCode);
	    	  isRemoveItem = true;
	      }
	      else
	      {
	    	  // ����������� ��/��� ����
	    	  logic.recalcItems(itemCode);
	      }

	      logic.changeStatusTravelSheet(item.travelSheetRef.code);

	      // ����������� �������
    	  // + ��� �� ������� �� ��� ���� �� ������ + ������� ������� �� ������� ����� ...///
	      /*
	      ENTravelSheet tr = logic.getTravelSheetByCode(item.travelSheetRef.code);
	      if (tr.statusRef.code == ENTravelSheetStatus.FACT){

	    	  // QQ
		    	ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    	ENTravelSheetFuelRemainsFilter ff = new ENTravelSheetFuelRemainsFilter();
		    	ff.travelSheetRef.code = tr.code;
		    	int[] remArr = remDAO.getFilteredCodeArray(ff, 0, -1);
		    	for (int i=0; i < remArr.length; i++){
		    		ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
		    		rem.countGenOut = rem.priceGenOut = rem.sumGenOut =  new BigDecimal(0);
		    		rem.countGenFinal = rem.countGenStart.add(rem.countGenIn).setScale(2, BigDecimal.ROUND_HALF_UP);
		    		remDAO.save(rem);
		    	}

	    	  TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	    	  fuelLogic.generateGSMEstimateByTravelSheet(tr.code, tr.dateStart);
	    	  fuelLogic.updateRemainderOUT(tr.code);
	      }
	      */

	      // ������� ������ ....
	      if (item.kindRef.code == ENTravelSheetItemKind.FACT){



	    	  // + ��� �� ������� �� ��� ���� �� ������ + ������� ������� �� ������� ����� .../// ��� �� ������� ...
	    	   // QQ
	    	  // ������� ������� ��� �������� ... � �� ����� �� ������� � generateGSMEstimateByTravelSheetItem



		    	ENTravelSheetFuelRemainsDAO remDAO = new ENTravelSheetFuelRemainsDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

				//BigDecimal countOut = new BigDecimal(0);



				if (fuelsOUT != null){
					for (int j = 0; j < fuelsOUT.length; j++){


							if (fuelsOUT[j].countGen.doubleValue() != 0){
						    	ENTravelSheetFuelRemainsFilter ff = new ENTravelSheetFuelRemainsFilter();
						    	ff.travelSheetRef.code = item.travelSheetRef.code;
						    	ff.fuelTypeRef.code = fuelsOUT[j].fuelType.code;
						    	int[] remArr = remDAO.getFilteredCodeArray(ff, 0, -1);

						    	if (remArr.length != 1)
						    		throw new EnergyproSystemException("��������� �������� ... ������ ���� �� ������ ��� ���������� �������� �� ��� ������� ...");

						    	for (int i=0; i < remArr.length; i++){
						    		ENTravelSheetFuelRemains rem = remDAO.getObject(remArr[i]);
						    		rem.countGenOut = rem.countGenOut.subtract(fuelsOUT[j].countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
						    		rem.priceGenOut = rem.sumGenOut =  new BigDecimal(0);
						    		rem.countGenFinal = rem.countGenFinal.add(fuelsOUT[j].countGen).setScale(2, BigDecimal.ROUND_HALF_UP);
						    		remDAO.save(rem);
						    	}
						}
				}



				} // ������ ��� ��� ��� �������� .. � �������� �� ��� ������ 0 .. ���� �������� �� ����


	    	  if ( ! isRemoveItem )
	    		  fuelLogic.generateGSMEstimateByTravelSheetItem(item.code);

	    	  //  ������� ... ���� �������� ��� ENTravelSheetFuel[] fuelsOUT = fuelLogic.getFuelByTravelSheetItem(object.code);
	    	  fuelLogic.updateRemainderOUT(item.travelSheetRef.code);


	      }

	     }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
	    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
	   }


  @Override
public void remove(int code)
  {
	  remove(code, false);
  }
  public void removeForTransportOrder(int code)
  {
	  remove(code, true);
  }
  /*ENTravelSheetItem. �������*/
  public void remove(int code, boolean forTransportOrder)
   {
    try
     {
    	ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
    	ENTravelSheetItem item = itemDAO.getObject(code);
    	TransportOrderLogic toLogic = new TransportOrderLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

	     /// NET - 4333
    	if(item.statusRef.code == ENTravelSheetItemStatus.DELETED)
    		throw new EnergyproSystemException("������ ������������ ����� ��� ��������...");

    	/*�������� �� ���������� ������*/
    	if(!forTransportOrder)
    	{
    		toLogic.checkENTransportItemInTransportOrderByTravelSheetItemCode(code);
    	}

    	if (item.statusRef.code == ENTravelSheetItemStatus.CLOSED ){
    		throw new EnergyproSystemException("������ ������������ ����� � " + tsDAO.getObject(item.travelSheetRef.code).numberGen + " ����������� ...");
    	}


    	TravelSheetLogic l = new TravelSheetLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    	l.removeItem(code, false);

    	l.changeStatusTravelSheet(item.travelSheetRef.code);

	      ENTravelSheet tr = l.getTravelSheetByCode(item.travelSheetRef.code);

	      if (tr.statusRef.code == ENTravelSheetStatus.FACT){

	    	  TravelSheetFuelLogic fuelLogic = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	    	  fuelLogic.updateRemainderOUT(tr.code);

	      }

     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  public ENTravelSheetItemShort getGlobusData(ENTravelSheetItem obj)
  {
      Connection enConn = null;
      Connection globusConn = null;

      try
      {
          enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
          globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);

          if(obj.timeStart == null)
              throw new EnergyproSystemException("�� �������� ���� ������� ��� ���������� ���������� � ��� \"������\"");
          if(obj.timeFinal == null)
              throw new EnergyproSystemException("�� �������� ���� ��������� ��� ���������� ���������� � ��� \"������\"");

          Calendar calendar = Calendar.getInstance();
          calendar.setTime(obj.timeStart);
          calendar.set(Calendar.SECOND, 0);
          calendar.set(Calendar.MILLISECOND, 0);
          Date startTime = calendar.getTime();
          calendar = Calendar.getInstance();
          calendar.setTime(obj.timeFinal);
          calendar.set(Calendar.SECOND, 0);
          Date finalTime = calendar.getTime();

          TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
          ENTravelSheet ts = new ENTravelSheetDAO(enConn, getUserProfile()).getObject(obj.travelSheetRef.code);
          TKTransportRealHistory historyObj = transportLogic.getHistory(ts.transportReal.code, obj.timeFinal);

          if(historyObj.reg_id == Integer.MIN_VALUE)
              throw new EnergyproSystemException("��� ���������� � ����. �������: " + ((ts.transportReal.gosNumber != null) ? ts.transportReal.gosNumber : "�� ���������") +
              " �� �������� ������������ ����� � ��� \"������\"");


          ENTravelSheetItemShort travelData = new GlobusLogic(globusConn,getUserProfile()).getGlobusData(historyObj.reg_id, startTime, finalTime);
          return travelData;
      }
      catch (DatasourceConnectException e) {throw new EnergyproSystemException("error connect to DB ...",e);}
      catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
      catch (Exception e) {throw new EnergyproSystemException(e);}
      finally {
              try {
                  if (globusConn != null && ! globusConn.isClosed()) {
                      globusConn.close();
                      globusConn = null;
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
  
  /*ENTravelSheetItem. ��������� ��������������� ������� �����*/
  public void setOrder(int travelSheetCode)
   {
    try
     {
    	TransportLogic l = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    	l.setOrder(travelSheetCode);
    	
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't setOrder {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  /*ENTravelSheetItem. �������� ������� �����*/
  public void changeOrder(int travelSheetItemCode, int travelOrder)
   {
    try
     {
    	TransportLogic l = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    	l.changeOrder(travelSheetItemCode, travelOrder);
    	
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't changeOrder {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  
  /*ENTravelSheetItem. ����� ������� ������*/
  public ENTravelSheetItem getContiguosItem(int travelSheetItemCode, int travelOrder)
   {
    try
     {
    	TransportLogic l = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
    	return l.get�ontiguousItem(travelSheetItemCode, travelOrder);
    	
     }
    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't getContiguosItem {%com.ksoe.energynet.valueobject.ENTravelSheetItem%} object.",e);}
    catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
    finally                              {closeConnection();}
   }
  

} // end of EJB Controller for ENTravelSheetItem