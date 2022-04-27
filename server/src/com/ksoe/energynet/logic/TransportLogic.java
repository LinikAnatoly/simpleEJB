package com.ksoe.energynet.logic;

//import java.awt.geom.RoundRectangle2D;
import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.Enumeration;
import java.util.Hashtable;
import java.util.Vector;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.dataminer.User2StaffingDAO;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.User2Staffing;
import com.ksoe.authorization.valueobject.brief.User2StaffingShort;
import com.ksoe.authorization.valueobject.filter.User2StaffingFilter;
import com.ksoe.authorization.valueobject.lists.User2StaffingShortList;
import com.ksoe.energynet.dataminer.ENDeliveryOrderDAO;
import com.ksoe.energynet.dataminer.ENDeliveryTimePlanDAO;
import com.ksoe.energynet.dataminer.ENDistanceDAO;
import com.ksoe.energynet.dataminer.ENElementDAO;
import com.ksoe.energynet.dataminer.ENEstimateItem2ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENEstimateItemDAO;
import com.ksoe.energynet.dataminer.ENFuelCardHistoryDAO;
import com.ksoe.energynet.dataminer.ENGPSTrackerDAO;
import com.ksoe.energynet.dataminer.ENGPSTrackerHistoryDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkDAO;
import com.ksoe.energynet.dataminer.ENPlanWorkItemDAO;
import com.ksoe.energynet.dataminer.ENRoadTypeDataDAO;
import com.ksoe.energynet.dataminer.ENTransport2ENEstimateDAO;
import com.ksoe.energynet.dataminer.ENTransportDepartmentDAO;
import com.ksoe.energynet.dataminer.ENTransportItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportItemDAO;
import com.ksoe.energynet.dataminer.ENTransportTemperatureDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItem2TransportItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.ENActStatus;
import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energynet.valueobject.ENDeliveryTimePlan;
import com.ksoe.energynet.valueobject.ENDistance;
import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.ENElementType;
import com.ksoe.energynet.valueobject.ENEstimateItem;
import com.ksoe.energynet.valueobject.ENEstimateItemKind;
import com.ksoe.energynet.valueobject.ENEstimateItemStatus;
import com.ksoe.energynet.valueobject.ENEstimateItemType;
import com.ksoe.energynet.valueobject.ENFuelCard;
import com.ksoe.energynet.valueobject.ENFuelCardHistory;
import com.ksoe.energynet.valueobject.ENGPSTracker;
import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.ENPlanWorkKind;
import com.ksoe.energynet.valueobject.ENPlanWorkType;
import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.ENTransport2ENEstimate;
import com.ksoe.energynet.valueobject.ENTransportDepartment;
import com.ksoe.energynet.valueobject.ENTransportItem;
import com.ksoe.energynet.valueobject.ENTransportItemData;
import com.ksoe.energynet.valueobject.ENTransportTemperature;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkShort;
import com.ksoe.energynet.valueobject.filter.ENDeliveryOrderFilter;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimePlanFilter;
import com.ksoe.energynet.valueobject.filter.ENDistanceFilter;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ENEstimateItemFilter;
import com.ksoe.energynet.valueobject.filter.ENFuelCardHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerFilter;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerHistoryFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkFilter;
import com.ksoe.energynet.valueobject.filter.ENRoadTypeDataFilter;
import com.ksoe.energynet.valueobject.filter.ENTransport2ENEstimateFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItem2TransportItemFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;
import com.ksoe.energynet.valueobject.lists.ENDistanceShortList;
import com.ksoe.energynet.valueobject.lists.ENFuelCardHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerHistoryShortList;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerShortList;
import com.ksoe.energynet.valueobject.lists.ENRoadTypeDataShortList;
import com.ksoe.energynet.valueobject.lists.ENTransport2ENEstimateShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItem2TransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTransportItemShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energynet.valueobject.lists.FINMaterialsShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.energypro.logic.LogicModule;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKFuelKoefDAO;
import com.ksoe.techcard.dataminer.TKFuelTypeDAO;
import com.ksoe.techcard.dataminer.TKMaterialsDAO;
import com.ksoe.techcard.dataminer.TKTechCardDAO;
import com.ksoe.techcard.dataminer.TKTransportRealDAO;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;
import com.ksoe.techcard.ejb.TKTransportRealHistoryController;
import com.ksoe.techcard.ejb.TKTransportRealHistoryControllerHome;
import com.ksoe.techcard.valueobject.TKFuelCalcType;
import com.ksoe.techcard.valueobject.TKFuelKoef;
import com.ksoe.techcard.valueobject.TKFuelType;
import com.ksoe.techcard.valueobject.TKTransportReal;
import com.ksoe.techcard.valueobject.TKTransportRealHistory;
import com.ksoe.techcard.valueobject.TKTransportStatus;
import com.ksoe.techcard.valueobject.TKTransportType;
import com.ksoe.techcard.valueobject.brief.TKTransportRealHistoryShort;
import com.ksoe.techcard.valueobject.filter.TKFuelTypeFilter;
import com.ksoe.techcard.valueobject.filter.TKTransportRealFilter;
import com.ksoe.techcard.valueobject.filter.TKTransportRealHistoryFilter;
import com.ksoe.techcard.valueobject.lists.TKTransportRealHistoryShortList;


/*
 * tehkart
 *
 */

public class TransportLogic extends LogicModule{



	  public TransportLogic(Connection connection, UserProfile userProfile)
	  {
	    super(connection, userProfile);
	  }


	  public String getDeliveryOrderTransportItemCodes(int transportItemCode) throws PersistenceException
	  {
		  String out = "";
		  out = getDeliveryOrderTransportItemCodes(transportItemCode, "");
		  return out;
	  }

	  public String getDeliveryOrderTransportItemCodes(int transportItemCode, String codes) throws PersistenceException
	  {
		  String out = codes;
		  ENDeliveryOrderDAO dao = new ENDeliveryOrderDAO(connection, userProfile);
		  ENDeliveryOrderFilter f = new ENDeliveryOrderFilter();

		  f.transportInRef.code = transportItemCode;
		  int[] arr = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
		  for (int i=0; i < arr.length; i++){
			  if (out.length() == 0)
				  out = "" + arr[i];
			  else
				  out = out + ", " + arr[i];

			  out = getDeliveryOrderTransportItemCodes(arr[i], out);
		  }
		  //out = codes + out;
		  return out;
	  }

	  public int getDeliveryOrderTransportOutCode(int transportItemInCode) throws PersistenceException
	  {
		  int out = Integer.MIN_VALUE;
		  ENDeliveryOrderDAO dao = new ENDeliveryOrderDAO(connection, userProfile);
		  ENDeliveryOrderFilter f = new ENDeliveryOrderFilter();
		  f.transportInRef.code = transportItemInCode;
		  ENDeliveryOrderShortList l = dao.getScrollableFilteredList(f, 0, -1);
		  for (int i=0; i < l.totalCount; i++){
			  out = l.get(i).transportOutCode;
		  }
		  return out;
	  }

	  public int getDeliveryOrderTransportInCode(int transportItemOutCode) throws PersistenceException
	  {
		  int out = Integer.MIN_VALUE;
		  ENDeliveryOrderDAO dao = new ENDeliveryOrderDAO(connection, userProfile);
		  ENDeliveryOrderFilter f = new ENDeliveryOrderFilter();
		  f.transportOut.code = transportItemOutCode;
		  //int[] arr = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
		  ENDeliveryOrderShortList l = dao.getScrollableFilteredList(f, 0, -1);
		  for (int i=0; i < l.totalCount; i++){
			  out = l.get(i).transportInRefCode;
		  }
		  return out;
	  }


	  public void validateTracktorOrKran(int transportItem, int transportReal) throws PersistenceException
	  {
		  ENTransportItemDAO itemDAO = new ENTransportItemDAO(connection,userProfile);
		  TKTransportRealDAO realDAO = new TKTransportRealDAO(connection,userProfile);
		  ENTransportItem itemObj = new ENTransportItem();
		  TKTransportReal realObj = new TKTransportReal();

          itemObj = itemDAO.getObject(transportItem);
          realObj = realDAO.getObject(transportReal);

          if ((itemObj.tktransportType.code == TKTransportType.BRIGADE) &&
          (realObj.travelSheetTypeRef.code == ENTravelSheetType.TRAKTOR || realObj.travelSheetTypeRef.code == ENTravelSheetType.KRAN))
          {
          throw new EnergyproSystemException("Реальный транспорт с типом ТРАКТОР и типом КРАН нельзя добавлять на норматив с типом БРИГАДНАЯ МАШИНА!");
          }
	  }


	  public void validateDeliveryOrder(int transportItemCode) throws PersistenceException
	  {

		     // проверим совместную доставку .. и отправим удалять вначале ее .. а потом расстояния ...
		     ENDeliveryOrderDAO delDAO = new ENDeliveryOrderDAO(connection, userProfile);
		     ENDeliveryOrderFilter delFilter = new ENDeliveryOrderFilter();
		     delFilter.transportOut.code = transportItemCode;
		     int arr[] = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
		     if (arr.length > 0){
		    	 ENDeliveryOrder del = delDAO.getObject(arr[0]);
		    	 ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		    	 ENTransportItem tr = trDAO.getObject(del.transportInRef.code);
		    	 //TKTransport tr = null;
		    	 //logic1.getpl
		    	 ENPlanWorkShort planShort = new ENPlanWorkDAO(connection, userProfile).getShortObject(tr.planRef.code);
		    	 throw new EnergyproSystemException("Этот ТРАНСПОРТ влияет на совместную доставку ... " +
		    			 "удалите вначале совместную доставку c плана для " + planShort.invNumber + ", наряд № " + ( planShort.workOrderNumber == null ? " без наряду " : planShort.workOrderNumber ));
		     }

		     delFilter = new ENDeliveryOrderFilter();
		     delFilter.transportInRef.code = transportItemCode;
		     arr = delDAO.getFilteredCodeArray(delFilter, null, null, 0, -1, null);
		     if (arr.length > 0){
		    	 throw new EnergyproSystemException("Этот ТРАНСПОРТ влияет на совместную доставку ... удалите с него совместную доставку  ..." );
		     }
	  }

		public void validateDeliveryOrderByPlanItemCode(int planItemCode) throws PersistenceException
		{
			ENTransportItemFilter f = new ENTransportItemFilter();
			f.planItemRef.code = planItemCode;
			f.conditionSQL = "entransportitem.transportrealcode is not null";
			ENTransportItemDAO dao = new ENTransportItemDAO(connection, userProfile);
			int[] arr = dao.getFilteredCodeArray(f, 0, -1);
			for (int i=0; i<arr.length; i++){
				// пока совм. доставка
				validateDeliveryOrder(arr[i]);
			}
		}


	  public BigDecimal calcWinterCoeff(Date data){
		  /*
		  // приказ №31 от 27.01.2011
		  int START_YEAR = 2011;
		  int START_MONTH = 2;
		  int START_DAY = 1;

		  // в приказе по 01.03.2011 .. но надо по 28.02 ;)
		  int FINAL_YEAR = 2011; // пока нет прикакза 3000 год
		  //int FINAL_MONTH = 3;
		  //int FINAL_DAY = 1;
		  int FINAL_MONTH = 2;
		  int FINAL_DAY = 28;
		   */

		  // приказ № 39 от 30.01.2012
		  /**  NET-3993 */
		  /**  приказ 726 від 14.12.2012р. :))) */
		  int START_YEAR = 2012;
		  int START_MONTH = 12;
		  int START_DAY = 20;

		  int FINAL_YEAR = 2013;
		  int FINAL_MONTH = 2;
		  int FINAL_DAY = 28;

		  BigDecimal out = new BigDecimal(1);

		  /*
		  Calendar c = Calendar.getInstance();
		  c.set(Calendar.HOUR, 0);
		  c.set(Calendar.MINUTE, 0);
		  c.set(Calendar.SECOND, 0);
		  c.set(Calendar.MILLISECOND, 0);

		  c.set(Calendar.YEAR, START_YEAR);
		  c.set(Calendar.MONTH, START_MONTH - 1); // месяц = месяц - 1 !!!, янв = 0 ;)
		  c.set(Calendar.DATE, START_DAY);

		  long startWinter = c.getTime().getTime();

		  c = Calendar.getInstance();
		  c.set(Calendar.YEAR, FINAL_YEAR);
		  c.set(Calendar.MONTH, FINAL_MONTH - 1); // месяц = месяц - 1 !!!, янв = 0 ;)
		  c.set(Calendar.DATE, FINAL_DAY);

		  long finalWinter = c.getTime().getTime();
		  */

		  Calendar c = Calendar.getInstance();
		  c.set(Calendar.YEAR, START_YEAR);
		  c.set(Calendar.MONTH, START_MONTH - 1); // месяц = месяц - 1 !!!, янв = 0 ;)
		  c.set(Calendar.DATE, START_DAY);
		  c.clear(Calendar.HOUR);
		  c.clear(Calendar.HOUR_OF_DAY);
		  c.clear(Calendar.MINUTE);
		  c.clear(Calendar.SECOND);
		  c.clear(Calendar.MILLISECOND);

		  long startWinter = c.getTime().getTime();

		  c = Calendar.getInstance();
		  c.set(Calendar.YEAR, FINAL_YEAR);
		  c.set(Calendar.MONTH, FINAL_MONTH - 1); // месяц = месяц - 1 !!!, янв = 0 ;)
		  c.set(Calendar.DATE, FINAL_DAY);
		  c.clear(Calendar.HOUR);
		  c.clear(Calendar.HOUR_OF_DAY);
		  c.clear(Calendar.MINUTE);
		  c.clear(Calendar.SECOND);
		  c.clear(Calendar.MILLISECOND);

		  long finalWinter = c.getTime().getTime();

		  ///// 31.01.12
		  // long curDate = data.getTime();
		  Calendar cData = Calendar.getInstance();
		  cData.setTime(data);
		  /*
		  cData.set(Calendar.HOUR, 0);
		  cData.set(Calendar.MINUTE, 0);
		  cData.set(Calendar.SECOND, 0);
		  cData.set(Calendar.MILLISECOND, 0);
		  */
		  cData.clear(Calendar.HOUR);
		  cData.clear(Calendar.HOUR_OF_DAY);
		  cData.clear(Calendar.MINUTE);
		  cData.clear(Calendar.SECOND);
		  cData.clear(Calendar.MILLISECOND);
		  long curDate = cData.getTime().getTime();
		  /////

		  if ( (curDate >= startWinter) && (curDate <= finalWinter)) {
			  /**  NET-3993 */
			  /**  приказ 726 від 14.12.2012р. :))) */
			  //out = new BigDecimal(1.02);
		  }
		  out = out.setScale(2, BigDecimal.ROUND_HALF_UP);
		  return out;
	  }


	  public int getTransportItemCodeByEstimateItem(int estimateItemCode) throws PersistenceException
	  {
		  int out = Integer.MIN_VALUE;

		  ENTransport2ENEstimateDAO dao = new ENTransport2ENEstimateDAO(connection, userProfile);
		  ENTransport2ENEstimateFilter f = new ENTransport2ENEstimateFilter();
		  f.estimateRef.code = estimateItemCode;
		  ENTransport2ENEstimateShortList l = dao.getScrollableFilteredList(f,0,-1);
		  if (l.totalCount > 0){
			  out = l.get(0).transportRefCode;
		  }
		  return out;
	  }

	  // проверка наличия транспортИтема в подорожних листах ...
	  public boolean checkTransportItemInTravelSheet(int transportCode, boolean isException) throws PersistenceException
	  {
		  if (transportCode == Integer.MIN_VALUE) return false;
		  // можно смотреть на наличие равльного тран-та, воркера и номера пут.листа ...

		  //или проверим в развязке ...
		  boolean inTravelSheet = false;
		  ENTravelSheetItem2TransportItemDAO dao = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
		  ENTravelSheetItem2TransportItemFilter f = new ENTravelSheetItem2TransportItemFilter();
		  f.transportItemRef.code = transportCode;
		  int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		  if (arr.length > 0){
			  if (isException){
				  throw new EnergyproSystemException("Цей транспорт  вже включений до подорожного листа ... для коригування треба видалити його з Подорожнього листа ...");
			  }
			  inTravelSheet = true;
		  }
		  return inTravelSheet;
	  }

	  // проверка наличия транспортИтема в конкретном подорожном листе ...
	  public boolean checkTransportItemInTravelSheetBySheetCode(int travelSheetCode, int transportCode, boolean isException) throws PersistenceException
	  {
		  // можно смотреть на наличие равльного тран-та, воркера и номера пут.листа ...

		  //или проверим в развязке ...
		  boolean inTravelSheet = false;
		  ENTravelSheetItem2TransportItemDAO dao = new ENTravelSheetItem2TransportItemDAO(connection, userProfile);
		  ENTravelSheetItem2TransportItemFilter f = new ENTravelSheetItem2TransportItemFilter();
		  f.transportItemRef.code = transportCode;
		  f.conditionSQL = "ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE in (select ti.code from entravelsheetitem ti where ti.travelsheetrefcode = " + travelSheetCode+ " )";
		  int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		  if (arr.length > 0){
			  if (isException){
				  throw new EnergyproSystemException("Цей транспорт  вже включений до подорожного листа ... для коригування треба видалити його з Подорожнього листа ...");
			  }
			  inTravelSheet = true;
		  }
		  return inTravelSheet;
	  }

	  public boolean checkTransportItemInTravelSheet(int realTransportCode, Date date, boolean isException) throws PersistenceException
	  {
		  boolean out = false;
		  ENTravelSheetDAO dao = new ENTravelSheetDAO(connection, userProfile);
		  ENTravelSheetFilter f = new ENTravelSheetFilter();
		  f.transportReal.code = realTransportCode;
		  f.dateStart = date;
		  int[] arr = dao.getFilteredCodeArray(f,0, -1);
		  if (arr.length != 0){
			  if (isException){
				  throw new EnergyproSystemException("Ця машина введена у Подорожній лист ... привьязуйте її з Подорожніх листів ...");
			  }
			  out = true;
		  }
		  return out;
	  }

	  public boolean checkTransportItemInTravelSheetByPlanItemCode(int planItemCode, boolean isException ) throws PersistenceException
	  {
		boolean out = false;

		ENTransportItemDAO dao = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter f = new ENTransportItemFilter();
		f.planItemRef.code = planItemCode;
		int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		for (int i =0; i < arr.length; i++){
			out = checkTransportItemInTravelSheet(arr[i], false);
			if (out){
				if (isException){
					throw new EnergyproSystemException("Для цієї роботи вже є транспрот у Транспортному листі ...");
				}
			    return out;
			}
		}

		return out;
	  }


	  public boolean checkTransportItemInTravelSheetByPlanCode(int planCode, boolean isException ) throws PersistenceException
	  {
		boolean out = false;

		ENTransportItemDAO dao = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter f = new ENTransportItemFilter();
		f.planRef.code = planCode;
		int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		for (int i =0; i < arr.length; i++){
			out = checkTransportItemInTravelSheet(arr[i], false);
			if (out){
				if (isException){
					throw new EnergyproSystemException("Для цього плану вже є транспорт у Транспортному листі ...");
				}
			    return out;
			}
		}

		return out;
	  }


	  public void checkTransportItemInTravelSheet_(ENTransportItem transport) throws PersistenceException
	  {

	  }

	  public void makeDeliveryTimeForFact(int planCode, int factCode, int transporRealCode) throws PersistenceException
	  {
		  PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		  //TransportLogic trLogic = new TransportLogic(connection, userProfile);

		  //int planCode = planLogic.g
		  ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		  ENDeliveryOrderDAO doDAO = new ENDeliveryOrderDAO(connection, userProfile);
		  ENTransportItem2TransportItemDAO tr2trDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);

		  ENTransportItemFilter trFilter = new ENTransportItemFilter();
		  trFilter.planRef.code = planCode;
		  trFilter.transportReal.code = transporRealCode;
		  int[] trArr = trDAO.getFilteredCodeArray(trFilter, 0, -1);

		  for (int i=0; i < trArr.length; i++){
			  ENDeliveryOrderFilter doFilter = new ENDeliveryOrderFilter();
			  doFilter.transportOut.code = trArr[i];
			  ENDeliveryOrderShortList doList = doDAO.getScrollableFilteredList(doFilter, 0, -1);

			  for (int j=0; j < doList.totalCount; j++){
				  // найдем факты ...
				  ENTransportItem2TransportItemFilter tr2trFilter = new ENTransportItem2TransportItemFilter();
				  tr2trFilter.inRef.code = doList.get(j).transportInRefCode;
				  tr2trFilter.conditionSQL = "ENTRANSPRTTM2TRNSPRTTM.INREFCODE not in " +
						"(select t.code from enplanworkitem pi, entransportitem t where pi.code = t.planitemrefcode and pi.countgen = 0 " +
						" and t.code = "+doList.get(j).transportInRefCode+ ")";
				  ENTransportItem2TransportItemShortList tr2trList = tr2trDAO.getScrollableFilteredList(tr2trFilter, 0, -1);

				  int factIn = Integer.MIN_VALUE;
				  int factOut = Integer.MIN_VALUE;
				  if (tr2trList.totalCount >0 ){
					  factIn = tr2trList.get(0).outRefCode ;
				  }
				  if (factIn != Integer.MIN_VALUE){
					  factOut = Integer.MIN_VALUE;
					  tr2trFilter = new ENTransportItem2TransportItemFilter();
					  tr2trFilter.inRef.code = trArr[i];
					  tr2trList = tr2trDAO.getScrollableFilteredList(tr2trFilter, 0, -1);

					  if (tr2trList.totalCount > 0){
						  factOut = tr2trList.get(0).outRefCode;
					  }
				  }

				  // типа все что в совместной доставке ЗАКРЫТО в факт ... пересозраним и пересчитаем
				  if ((factIn != Integer.MIN_VALUE) && (factOut != Integer.MIN_VALUE)){
					  ENDeliveryOrderFilter doFilter2 = new ENDeliveryOrderFilter();
					  /*doFilter2.transportInRef.code = factIn;
					  doFilter2.transportOut.code = factOut;*/
					  doFilter2.conditionSQL = "endeliveryorder.transportinrefcode = " + factIn + " OR endeliveryorder.transportoutcode = " + factOut;
					  int[] doArr2 = doDAO.getFilteredCodeArray(doFilter2, doFilter2.conditionSQL, null, 0, -1, null);
					  if (doArr2.length == 0){
						  ENDeliveryOrder do_ = new ENDeliveryOrder();
						  do_.transportInRef.code = factIn;
						  do_.transportOut.code = factOut;
						  doDAO.add(do_);
					  }
				  }
			  }
		  }

		  planLogic.processDeliveryTimesByPlanCode(factCode);

	  }

	  public void createDeliveryTimeForPlan(int planCode) throws PersistenceException
	  {
		  createDeliveryTimeForPlan(planCode, false);
	  }

	  public void createDeliveryTimeForPlan(int planCode, boolean isServicesFactCalc) throws PersistenceException
	  {
		  createDeliveryTimeForPlan(planCode, isServicesFactCalc, false);
	  }


	  public void createDeliveryTimeForPlan(int planCode,
				boolean isServicesFactCalc, boolean isMonthPlanFromYear) throws PersistenceException {

		  createDeliveryTimeForPlan(planCode, isServicesFactCalc, isMonthPlanFromYear, false);
	  }


	  /**
	   * @param planCode - код плана
	   * @param isServicesFactCalc - указание для расчета фактических затрат по договору
	   * @param isMonthPlanFromYear - true, если метод вызывается при создании Месячного плана из годового
	   * @param isCalcServices - true, если расчет при переводе услуги в статус "Работы выполнены"
	   */
	  public void createDeliveryTimeForPlan(int planCode,
			boolean isServicesFactCalc, boolean isMonthPlanFromYear,
			boolean isCalcServices) throws PersistenceException {

			ENAct act = new ActLogic(connection, userProfile).getActByPlanCode(planCode, false);
			if (act != null)
			{
				if (act.statusRef.code != ENActStatus.GOOD && !isServicesFactCalc && !isCalcServices)

					throw new EnergyproSystemException("\n\n"
							+ "NET-4235... Цей факт включено до Акту № " + act.numberGen + "... \n"
							+ "Видаляйте прив'язку до акту або поверніть акт у статус \"Чорновий\"!");
			}

		  ENDeliveryTimePlan planDelivery = new ENDeliveryTimePlan();
		  ENDeliveryTimePlanFilter f = new ENDeliveryTimePlanFilter();
		  f.planWorkRef.code = planCode;
		  ENDeliveryTimePlanDAO dao = new ENDeliveryTimePlanDAO(connection, userProfile);
		  int arr[] = dao.getFilteredCodeArray(f, null, null, 0, -1, null);
		  if (arr.length > 0){
			  planDelivery = dao.getObject(arr[0]);
		  }
		  else
		  {
			  planDelivery.planWorkRef.code = planCode;
		  }

		  // все расстояния ...
		  planDelivery.deliveryTimePlan = calculateTimeForPlanByDistance(planCode,0, true); // for PLAN !!!

		  // факт считаем ТОЛЬКО  с реальными транспорртом и челом
		  planDelivery.deliveryTimeFact = calculateTimeForPlanByDistance(planCode,0, false); //planDelivery.deliveryTimePlan;

		  // NET-2322 - если план по услугам на сторону и в договоре содержатся работы с транспортом заказчика
		  // то факт расстояния расчитываем на основании расстояния из договора и реальных челов (т.к нашего реал транспорта нет )
		  ServicesLogic soLogic = new ServicesLogic(connection, userProfile);
		  ENPlanWorkDAO plDAO = new ENPlanWorkDAO(connection, userProfile);
		  ENPlanWork plObj = plDAO.getObjectNOSEGR(planCode);


		  ElementLogic elementLogic = new ElementLogic(connection, userProfile);
		  int eType = elementLogic.getElementTypeByPlanNOSEGR(plObj);

		  if (eType == ENElementType.SERVICES_OBJECT) {

			  ENServicesObject soObj = soLogic.getServicesObjectByElementCode(plObj.elementRef.code);

			  if (soObj != null) {
			  // если услуга на сторону то проверим есть ди в плане транспорт заказчика

				  TransportOrderLogic trOrderLogic = new TransportOrderLogic(connection, userProfile);
				  boolean transportOut = trOrderLogic.checkTransportOut(planCode);

					if (transportOut) {
					  // если есть на плане транспорт заказчика то отдельный расчет времени на доставку (расстояние с договора делим на среднюю скорость 45 км )
					  // planDelivery.deliveryTimeFact = soObj.contractServicesDistance.divide(new BigDecimal(45), 2 , BigDecimal.ROUND_HALF_UP);
					  planDelivery.deliveryTimeFact = calculateTimeForPlanByDistance(planCode,0, true); // как для планов
				  }
			  }

			  // end NET-2322

			  ///// 22.05.13 NET-4235 Новицкая Л.В. Для расчета времени доставки по услугам, где не было нашего транспорта
			  if (isServicesFactCalc)
			  {
				  planDelivery.deliveryTimeFact = calculateTimeForPlanByDistance(planCode,0, true, true); // как для планов
			  }
			  /////
		  }




		  BigDecimal distArr[] = getDistancesByPlan(planCode, true); //getDistancesByTransport(planCode);

	      BigDecimal distAll = distArr[0].add(distArr[1]).add(distArr[2]);

		  planDelivery.commentGen = ( distArr[0].doubleValue() !=0.0 ? "Шосейна: " + distArr[0] +" км " : "") +
		  (distArr[1].doubleValue() != 0.0 ? " Грунтова: " + distArr[1] + " км " : "") +
		  (distArr[2].doubleValue() != 0.0 ? " По трасі: " + distArr[2] + " км " : "") +
		  " Всього: " + distAll +" км." ;

		  planDelivery.deliveryDistance = distAll;

		  if (planDelivery.code == Integer.MIN_VALUE){
			  dao.add(planDelivery);
		  }
		  else
		  {
			  dao.save(planDelivery);
		  }

		  // 24.02.12 NET-1355 Пересчитываем дату окончания и общее время выполнения работ
		  PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		  planLogic.recalcTotalTime(planCode, isMonthPlanFromYear);
	  }


	  public BigDecimal calculateFuelCount(int transportItemCode, Date dateGen) throws PersistenceException
	  {
		  BigDecimal out = new BigDecimal(0);
		  out = calculateFuelByTime(transportItemCode, dateGen).add(calculateFuelByDistance(transportItemCode, dateGen));
		  out = out.setScale(2,BigDecimal.ROUND_HALF_UP);
		  return out;
	  }

	  public BigDecimal calculateFuelByTime(int transportItemCode, Date dateGen) throws PersistenceException
	  {
		TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(connection, userProfile);
		BigDecimal out = new BigDecimal(0);
		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItem tr = trDAO.getObject(transportItemCode);



		// ТОРМОЗЗЗЗ работы гдето раньше надо проверять  ...
		ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

		if ( pwi.countGen.doubleValue() <= 0.0 ){
			return out;
		}

		if (tr.tktransportType.code != TKTransportType.BRIGADE){
			if (tr.transportReal != null){
				if (tr.transportReal.code > Integer.MIN_VALUE){
					// пусть вводят - просто не будем считать

					  if (tr.transportReal.rashodWork == null){
						  //throw new EnergyproSystemException("Не указан расход топлива для МОТОЧАСОВ в авто " + tr.transportReal.name + ", код авто="+tr.transportReal.code);
						  return out;
					  }
					//BigDecimal winterCoef = calcWinterCoeff(dateGen);
						// Коэффициент для расчета топлива
					  BigDecimal koef = transportRealDAO.getAggregateSumKoefs(tr.transportReal.code);
					  BigDecimal rashodWorkWithKoef = koef.multiply(tr.transportReal.rashodWork).setScale(2, BigDecimal.ROUND_HALF_UP);
					  out = tr.countWorkFact.multiply(rashodWorkWithKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
					//МЧ на зимний коэф. не нужен !!!! мехколонна, Дима 24.02.2011
					//out = out.multiply(winterCoef).setScale(2, BigDecimal.ROUND_HALF_UP);
				}
			}
		}

		return out;
	  }

	  public BigDecimal calculateFuelByDistance(int transportItemCode, Date dateGen) throws PersistenceException
	  {
			TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(connection, userProfile);
			BigDecimal out = new BigDecimal(0);
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportItem tr = trDAO.getObject(transportItemCode);

			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return out;
			}
			if (tr.transportReal != null){
				if (tr.transportReal.code > Integer.MIN_VALUE){

					// 24.11.2011 NET-334 Для тракторов топливо на пробег должно считаться таким же образом, как и в путевых листах
					// (с переводом расстояния во время, а потом используя расход топлива по времени)
					if (tr.transportReal.travelSheetTypeRef.code == ENTravelSheetType.TRAKTOR)
					{ // Для тракторов
					  BigDecimal[] dist = getDistancesByTransport(transportItemCode, true);
					  if ( (dist != null) && (tr.transportReal.rashodProbeg != null) ){
						  PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
						  BigDecimal koef = transportRealDAO.getAggregateSumKoefs(tr.transportReal.code);
						  BigDecimal rashodProbegWithKoef = koef.multiply(tr.transportReal.rashodProbeg).setScale(2, BigDecimal.ROUND_HALF_UP);

						  out = out.add(calcTimeByDistaces(dist[0], dist[1], dist[2], planLogic.isWinterMonth(dateGen), true )).setScale(2, BigDecimal.ROUND_HALF_UP);
					      out = out.multiply(rashodProbegWithKoef).setScale(2, BigDecimal.ROUND_HALF_UP);
					  }
					}
					else
					{ //Для всех остальных транспортов -- остается так, как было раньше
					  ENDistanceFilter dFilter = new ENDistanceFilter();
					  dFilter.transportItemRef.code = transportItemCode;
					  ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
					  ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);

					  BigDecimal allDistance = new BigDecimal(0);

					  for (int j=0; j < dList.totalCount; j++){
						  allDistance = allDistance.add( dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);
					  }

					  allDistance = allDistance.setScale(3,BigDecimal.ROUND_HALF_UP);

					  if (allDistance.doubleValue() == 0){
						  return out;
					  }

					  allDistance = new BigDecimal(allDistance.doubleValue() / 100);

					  if (tr.transportReal.rashodProbeg == null){
						  throw new EnergyproSystemException("Не указан расход топлива для ПРОБЕГА в авто " + tr.transportReal.name + ", Code="+tr.transportReal.code);
					  }

					  BigDecimal winterCoef = calcWinterCoeff(dateGen);
					  BigDecimal koef = transportRealDAO.getAggregateSumKoefs(tr.transportReal.code);
					  BigDecimal rashodProbegWithKoef = koef.multiply(tr.transportReal.rashodProbeg).setScale(2, BigDecimal.ROUND_HALF_UP);
					  out = rashodProbegWithKoef.multiply(allDistance).setScale(2, BigDecimal.ROUND_HALF_UP);
					  out = out.multiply(winterCoef).setScale(2, BigDecimal.ROUND_HALF_UP);
					}
				}
			}
			return out;
	  }


	  public int getMaterialByFuelType(int fuelType) throws PersistenceException
	  {
		  TKFuelTypeDAO fuelDAO = new TKFuelTypeDAO(connection, userProfile);
		  TKFuelType fuel = fuelDAO.getObject(fuelType);
		  int out = Integer.MIN_VALUE;

		  TKMaterialsDAO materialsDAO = new TKMaterialsDAO(connection, userProfile);
		  out = materialsDAO.getObject(fuel.materialRef.code).code;
		  if (out == Integer.MIN_VALUE){
			  throw new EnergyproSystemException("Materials not found for fuel type, code =" + fuelType);
		  }
		  return out;
	  }

	  public int getFuelTypeByMaterial(int materialCode) throws PersistenceException
	  {
			TKFuelTypeDAO ftDAO = new TKFuelTypeDAO(connection, userProfile);
			TKFuelTypeFilter ftFilter = new TKFuelTypeFilter();
			ftFilter.materialRef.code = materialCode;
			int[] ftArr = ftDAO.getFilteredCodeArray(ftFilter, null, null, 0, -1, null);
			if ( ftArr.length != 1){
				throw new EnergyproSystemException("Помилка у кількості типів палива для materialCode ..." + materialCode);
			}
			return  ftArr[0];
	  }


		public boolean checkFuelNomenclatureByFuelType(int fuelType, String nomenclature)
		{
			boolean out = false;
			switch (fuelType)
			{
				case ENConsts.FUEL_TYPE_A80 :
				{
					if (
							(nomenclature.equals("619100080"))
							|| (nomenclature.equals("619020041"))
							||(nomenclature.equals("619100109"))
							|| (nomenclature.equals("619100110"))
							|| (nomenclature.equals("619020044")) /*NET-3785*/
						)
						out = true;
					break;
				}
				case ENConsts.FUEL_TYPE_A92 :
				{
					if (
							(nomenclature.equals("619020048"))
							||(nomenclature.equals("619100111"))
						)
						out = true;
					break;
				}
				case ENConsts.FUEL_TYPE_A95 :
				{
					if (nomenclature.equals("619020045")
					|| nomenclature.equals("619000655") /*SUPP-5122*/)
						out = true;
					break;
				}
				case ENConsts.FUEL_TYPE_DT :
				{
					if (
							(nomenclature.equals("619000650"))
							||(nomenclature.equals("619000680"))
							||(nomenclature.equals("619000682"))
							||(nomenclature.equals("619020014"))
							||(nomenclature.equals("619020052"))
							||(nomenclature.equals("828000453"))
							||(nomenclature.equals("619000425"))
						)
						out = true;
					break;
				}
			}
			return out;

		}

		public boolean checkFuelNomenclatureByMaterial(int materialCode, String nomenclature) throws PersistenceException
		{
			int fuelType = getFuelTypeByMaterial(materialCode);
			return checkFuelNomenclatureByFuelType(fuelType, nomenclature);
		}



		  public void generateGSMEstimate4Calculation(int transportItemCode, Date dateCalc) throws PersistenceException
		  {

			  //if (checkTransportItemInTravelSheet(transportItemCode, false)) return;

			  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
			  ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
			  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);

			  ENTransportItem t = tDAO.getObject(transportItemCode);
			  //int[] t2e;

			  if (t.tktransportType.code != TKTransportType.MECHANIZM){

			  BigDecimal byTime = new BigDecimal(0);
			  BigDecimal byDistance = new BigDecimal(0);
			  BigDecimal val = new BigDecimal(0);
			  int estimateCode = Integer.MIN_VALUE;
			  if (t.transportReal != null){
				  if (t.transportReal.code > Integer.MIN_VALUE) {

					  // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
					  //ENPlanWork plan = new PlanWorkLogic(connection, userProfile).getPlanByCode(t.planRef.code);
					  BigDecimal winterCoeff = calcWinterCoeff(dateCalc);

					  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
					  t2Filter.transportRef.code = transportItemCode;
					  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);

					  if ( t2eList.totalCount > 0){
						  for (int i=0; i < t2eList.totalCount; i++){
						     ENEstimateItem newEItem = eDAO.getObject(t2eList.get(i).estimateRefCode);
						     estimateCode = newEItem.code;
						     newEItem.materialRef.code = t.transportReal.fuelType.materialRef.code ; //getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!
						     //newEItem.countFact = calculateFuelCount(transportItemCode) ;// посчитать !!! ;)
						     byTime = calculateFuelByTime(transportItemCode, dateCalc);
						     byDistance = calculateFuelByDistance(transportItemCode, dateCalc);
						     newEItem.commentGen = t.transportReal.name + ", гос.ном: " + t.transportReal.gosNumber + ", маш/год:" + byTime.toString() + ", пробіг:" + byDistance + ", коэф=" + winterCoeff;
						     //newEItem.countGen = calculateFuelCount(transportItemCode) ;// посчитать !!! ;)

						     val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

						     newEItem.countGen = val;

						     // если обнулили расход - удалять наверно не надо ...
						     // забьем его нормативным ... и сделаем тип - авто - пусть еще раз меняют ;)

						     // забьем на то что изменили ЮЗЕРА !!! раз меняли транспорт - значит что то поменялось !!!!
							 	 newEItem.countFact = newEItem.countGen;
							 	 newEItem.typeRef.code = ENEstimateItemType.AUTO;


						     eDAO.save(newEItem);
						  }
					  }
					  else{

							byTime = calculateFuelByTime(transportItemCode, dateCalc);
						    byDistance = calculateFuelByDistance(transportItemCode, dateCalc);
						    val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

						    if (val.doubleValue() > 0.009)
						    {
							    int eCode = Integer.MIN_VALUE;
								ENEstimateItem ee = new ENEstimateItem();
								ee.kindRef.code = ENEstimateItemKind.GSM;
								ee.planRef.code = t.planRef.code;
								ee.planItemRef.code = t.planItemRef.code;
								ee.countGen = val; //new BigDecimal(0);
								ee.materialRef.code = t.transportReal.fuelType.materialRef.code ;//getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!
								ee.typeRef.code = ENEstimateItemType.AUTO;
								ee.countFact = val; //calculateFuelCount(transportItemCode) ;// посчитать !!! ;)
								ee.cost = new BigDecimal(0); // ???
								ee.userGen = userProfile.userName;
								ee.dateEdit = new Date();

							    ee.commentGen = t.transportReal.name + ", гос.ном: " + t.transportReal.gosNumber + ", витрати : (з маш/г)" + byTime.toString() + " л, (з пробігу): " + byDistance + " л";
								ee.statusRef.code = ENEstimateItemStatus.PLANNED;

							    eCode = eDAO.add(ee);
							    ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
							    t2.transportRef.code = transportItemCode;
							    t2.estimateRef.code = eCode;
							    t2DAO.add(t2);
							    estimateCode = eCode;
						    }
					  }

					  // проверим не 0 ли в расходе .. если 0 и есть развязка - В САД .. пусть отменяют ...
					  if ( val.doubleValue() < 0.009 ){

						  if (estimateCode != Integer.MIN_VALUE){

						  EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
						  FINMaterialsShortList fList = eLogic.getFINMaterialsListByEstimateItemCode(estimateCode);
						  if ( fList.totalCount > 0){
							  throw new EnergyproSystemException("На строке ГСМ есть зарезервированный материал ... Отмените резервирование !!!");
						  }
						  }
					  }

					  ///// NET-4440 Сохраняем историю ГСМ по плану
					  // 27.02.15 Убираем отсюда, т.к. метод будет вызываться во внешних методах в контроллерах!
					  // PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
					  // planLogic.generatePlanFuelHistory(t.planRef.code);
					  /////

				  } // реальный транспрт
			  } // тоже реал транспорт

		  } // если не МЕХАНИЗМ .. для механизма ниче считать не надо ...

		  }

	  public void generateGSMEstimate(int transportItemCode) throws PersistenceException
	  {
		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
		 ENTransportItem ti = new ENTransportItem();

		 ti = tiDAO.getObject(transportItemCode);
		 if (ti.transportReal != null)
		 {
		   if (ti.transportReal.code > Integer.MIN_VALUE)
		      {
			   generateGSMEstimate_(transportItemCode, false);
		      }
		 else
		      {
		  generateNORMGSM(transportItemCode);
		      }
		 }
		 else {
			  generateNORMGSM(transportItemCode);
			  }

	  }

	  public void generateGSMEstimate_Forced(int transportItemCode) throws PersistenceException
	  {
		  ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
			 ENTransportItem ti = new ENTransportItem();

			 ti = tiDAO.getObject(transportItemCode);
			 if (ti.transportReal != null)
			 {
			   if (ti.transportReal.code > Integer.MIN_VALUE)
			      {
				   generateGSMEstimate_(transportItemCode, true);
			      }
			 else
			      {
			  generateNORMGSM(transportItemCode);
			      }
			 }
			 else {
				  generateNORMGSM(transportItemCode);
				  }

	  }

	  public void generateGSMEstimate_(int transportItemCode, boolean force) throws PersistenceException
	  {

		  if (!force && checkTransportItemInTravelSheet(transportItemCode, false)) return;
		  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
		  ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
		  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);

		  ENTransportItem t = tDAO.getObject(transportItemCode);
		  //int[] t2e;

		  if (t.tktransportType.code != TKTransportType.MECHANIZM){

		  BigDecimal byTime = new BigDecimal(0);
		  BigDecimal byDistance = new BigDecimal(0);
		  BigDecimal val = new BigDecimal(0);
		  int estimateCode = Integer.MIN_VALUE;
		  if (t.transportReal != null){
			  if (t.transportReal.code > Integer.MIN_VALUE) {

				  // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
				  ENPlanWork plan = new PlanWorkLogic(connection, userProfile).getPlanByCode(t.planRef.code);
				  BigDecimal winterCoeff = calcWinterCoeff(plan.dateStart);

				  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
				  t2Filter.transportRef.code = transportItemCode;
				  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);

				  if ( t2eList.totalCount > 0){
					  for (int i=0; i < t2eList.totalCount; i++){
					     ENEstimateItem newEItem = eDAO.getObject(t2eList.get(i).estimateRefCode);
					     estimateCode = newEItem.code;
					     newEItem.materialRef.code = t.transportReal.fuelType.materialRef.code ; //getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!
					     //newEItem.countFact = calculateFuelCount(transportItemCode) ;// посчитать !!! ;)
					     byTime = calculateFuelByTime(transportItemCode, plan.dateStart);
					     byDistance = calculateFuelByDistance(transportItemCode, plan.dateStart);
					     newEItem.commentGen = t.transportReal.name + ", гос.ном: " + t.transportReal.gosNumber + ", маш/год:" + byTime.toString() + ", пробіг:" + byDistance + ", коэф=" + winterCoeff;
					     //newEItem.countGen = calculateFuelCount(transportItemCode) ;// посчитать !!! ;)

					     val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

					     newEItem.countGen = val;

					     // если обнулили расход - удалять наверно не надо ...
					     // забьем его нормативным ... и сделаем тип - авто - пусть еще раз меняют ;)

					     // забьем на то что изменили ЮЗЕРА !!! раз меняли транспорт - значит что то поменялось !!!!
						 	 newEItem.countFact = newEItem.countGen;
						 	 newEItem.typeRef.code = ENEstimateItemType.AUTO;

					     //if ((newEItem.countFact.doubleValue() < 0.01 ) || (newEItem.typeRef.code == ENEstimateItemType.AUTO)){
					    //	 newEItem.countFact = newEItem.countGen;
					    //	 newEItem.typeRef.code = ENEstimateItemType.AUTO;
					    // }

					     //if (newEItem.countFact.doubleValue() < 0.01 ){
					    	 // удалим связку и материал ...
					    //	 t2DAO.remove(t2eList.get(i).code);
					    //	 eDAO.remove(newEItem.code);
					    // }
					    // else
					     eDAO.save(newEItem);
					  }
				  }
				  else{

						byTime = calculateFuelByTime(transportItemCode, plan.dateStart);
					    byDistance = calculateFuelByDistance(transportItemCode, plan.dateStart);
					    val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

					    if (val.doubleValue() > 0.009)
					    {
						    int eCode = Integer.MIN_VALUE;
							ENEstimateItem ee = new ENEstimateItem();
							ee.kindRef.code = ENEstimateItemKind.GSM;
							ee.planRef.code = t.planRef.code;
							ee.planItemRef.code = t.planItemRef.code;
							ee.countGen = val; //new BigDecimal(0);
							ee.materialRef.code = t.transportReal.fuelType.materialRef.code ;//getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!
							ee.typeRef.code = ENEstimateItemType.AUTO;
							ee.countFact = val; //calculateFuelCount(transportItemCode) ;// посчитать !!! ;)
							ee.cost = new BigDecimal(0); // ???
							ee.userGen = userProfile.userName;
							ee.dateEdit = new Date();

						    ee.commentGen = t.transportReal.name + ", гос.ном: " + t.transportReal.gosNumber + ", витрати : (з маш/г)" + byTime.toString() + " л, (з пробігу): " + byDistance + " л";
							ee.statusRef.code = ENEstimateItemStatus.PLANNED;

						    eCode = eDAO.add(ee);
						    ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						    t2.transportRef.code = transportItemCode;
						    t2.estimateRef.code = eCode;
						    t2DAO.add(t2);
						    estimateCode = eCode;
					    }
				  }

				  // проверим не 0 ли в расходе .. если 0 и есть развязка - В САД .. пусть отменяют ...
				  if ( val.doubleValue() < 0.009 ){

					  if (estimateCode != Integer.MIN_VALUE){

					  EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
					  FINMaterialsShortList fList = eLogic.getFINMaterialsListByEstimateItemCode(estimateCode);
					  if ( fList.totalCount > 0){
						  throw new EnergyproSystemException("На строке ГСМ есть зарезервированный материал ... Отмените резервирование !!!");
					  }
					  }
				  }

				  ///// NET-4440 Сохраняем историю ГСМ по плану
				  // 27.02.15 Убираем отсюда, т.к. метод будет вызываться во внешних методах в контроллерах!
				  // PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
				  // planLogic.generatePlanFuelHistory(t.planRef.code);
				  /////

			  } // реальный транспрт
		  } // тоже реал транспорт

	  } // если не МЕХАНИЗМ .. для механизма ниче считать не надо ...

	  }

	  public void bindToFINWorker(int planCode, int transportCode, int finWorkerCode) throws PersistenceException
	  {
			ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);

			//ENTransportItem baseTransport = transportDAO.getObject(transportCode);
			FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);

			FINWorker finWorker = null;
			if (finWorkerCode != Integer.MIN_VALUE ){
				   finWorker = finWorkerDAO.getObject(finWorkerCode);
			}
			else
				 return;

			ENTransportItemFilter transportFilter = new ENTransportItemFilter();
			transportFilter.planRef.code = planCode;
			transportFilter.transport.code = transportCode;
			transportFilter.conditionSQL = " finworkercode is null";
			ENTransportItemShortList transportList = transportDAO.getScrollableFilteredList(transportFilter, 0, -1);
			for (int i = 0; i < transportList.totalCount; i++){
				ENTransportItem transport = transportDAO.getObject(transportList.get(i).code);
				if ( finWorker != null ){
					finWorker.code = finWorkerDAO.add(finWorker);
					transport.finWorker.code = finWorker.code;
					transportDAO.save(transport);
				}
			}
	  }


		public void bindToRealTransport(int planCode, int transportCode, int realTransportCode) throws PersistenceException
		{
			// по идее тут же можно перекинуть и РЕАЛЬНЫХ работников на транспорте .. если есть ...
			// если знать код нормативного тра-та .. или работника ;)
			ENTransportItemDAO transportDAO = new ENTransportItemDAO(connection, userProfile);
			TransportLogic eLogic = new TransportLogic(connection, userProfile);

			ENTransportItemFilter transportFilter = new ENTransportItemFilter();
			transportFilter.planRef.code = planCode;
			transportFilter.transport.code = transportCode;
			transportFilter.conditionSQL = " transportrealcode is null";
			ENTransportItemShortList transportList = transportDAO.getScrollableFilteredList(transportFilter, 0, -1);
			for (int i = 0; i < transportList.totalCount; i++){
				ENTransportItem transport = transportDAO.getObject(transportList.get(i).code);
				transport.transportReal.code = realTransportCode;
				transportDAO.save(transport);
				eLogic.generateGSMEstimate(transport.code);
			}
		}


		public BigDecimal[] getDistancesByPlan(int planCode, boolean isDeliveryTimes) throws PersistenceException
		{

			  ENTransportItemFilter f = new ENTransportItemFilter();
			  f.tktransportType.code = 1; // типа Бригадная машина ...
			  f.planRef.code = planCode;

			  f.conditionSQL = " entransportitem.code in (select endistance.transportitemrefcode from endistance)" +
			  " and entransportitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode = "+planCode+" and enplanworkitem.countgen<>0)";

			  BigDecimal distanceHighway ;
			  BigDecimal distanceGround ;
			  BigDecimal distanceRoute ;

			  distanceHighway = distanceGround = distanceRoute = new BigDecimal(0);

			  ENTransportItemDAO d = new ENTransportItemDAO(connection, userProfile);


			  BigDecimal [] allDistance = new BigDecimal[3];
		      allDistance[0] =  allDistance[1] = allDistance[2] = new BigDecimal(0);

			  int arr[] = d.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);

			  for (int i=0; i < arr.length; i++){
				  allDistance = getDistancesByTransport(arr[i], isDeliveryTimes);



				  allDistance = getParentDistances(arr[i], allDistance, isDeliveryTimes);

				  if (allDistance != null){
					  distanceHighway = distanceHighway.add(allDistance[0]);
					  distanceGround  = distanceGround.add(allDistance[1]);
					  distanceRoute  = distanceRoute.add(allDistance[2]);
				  }
			  }



			  distanceHighway = distanceHighway.setScale(3,BigDecimal.ROUND_HALF_UP);
			  distanceGround = distanceGround.setScale(3,BigDecimal.ROUND_HALF_UP);
			  distanceRoute = distanceRoute.setScale(3,BigDecimal.ROUND_HALF_UP);

		      BigDecimal [] array;

		      array = new BigDecimal[3];
		      array[0] = distanceHighway;
		      array[1] = distanceGround;
		      array[2] = distanceRoute;
			  return array;

		}


		public BigDecimal calculateTimeForPlanByDistance(int planWorkCode, int typeCalc) throws PersistenceException
		{
			return calculateTimeForPlanByDistance(planWorkCode, typeCalc, true);
		}

		public BigDecimal calculateTimeForPlanByDistanceAndPlanCodes(String planWorkCodes) throws PersistenceException
		{
			BigDecimal out = new BigDecimal(0);
			ENPlanWorkDAO dao = new ENPlanWorkDAO(connection, userProfile);
			ENPlanWorkFilter f = new ENPlanWorkFilter();
			f.conditionSQL = "code in ("+ planWorkCodes +")";
			int[] pCodes = dao.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);
			for (int i=0; i < pCodes.length; i++){
				out = out.add(calculateTimeForPlanByDistance(pCodes[i], 0, false)).setScale(2, BigDecimal.ROUND_HALF_UP);
			}
			return out;
		}

		public BigDecimal calculateTimeForPlanByDistance(int planWorkCode, int typeCalc, boolean isPlan) throws PersistenceException
		{
			return calculateTimeForPlanByDistance(planWorkCode, typeCalc, isPlan, false);
		}

		  public BigDecimal calculateTimeForPlanByDistance(int planWorkCode, int typeCalc, boolean isPlan, boolean isServicesFactCalc) throws PersistenceException
		  {

			  PlanWorkLogic pLogic = new PlanWorkLogic(connection, userProfile);

			  boolean isWinter ;

			  if (typeCalc == 0)
			    isWinter = pLogic.isWinterPlan(planWorkCode);
			  else
				isWinter = pLogic.isWinterPlan( pLogic.getPlanCodeByItem(planWorkCode));

			  ENTransportItemFilter f = new ENTransportItemFilter();
			  f.tktransportType.code = 1; // типа Бригадная машина ...
			  if (typeCalc == 1 ){
				  f.planItemRef.code = planWorkCode;
			  }
			  else
			  {
				  f.planRef.code = planWorkCode;
			  }

			  f.conditionSQL = " entransportitem.code in (select endistance.transportitemrefcode from endistance)" ;
			  if (typeCalc == 1 ){
				  f.conditionSQL =  f.conditionSQL + " and entransportitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem where enplanworkitem.code = " + planWorkCode + " and enplanworkitem.countgen<>0)";
			  }
			  else
			  {
				  f.conditionSQL =  f.conditionSQL + " and entransportitem.planitemrefcode in (select enplanworkitem.code from enplanworkitem where enplanworkitem.planrefcode = " + planWorkCode + " and enplanworkitem.countgen<>0)";
			  }

			  if ( ! isPlan ){
				  f.conditionSQL =  f.conditionSQL + " and ( ENTRANSPORTITEM.TRANSPORTREALCODE is not null and ENTRANSPORTITEM.FINWORKERCODE is not null )";
			  }

			  BigDecimal distanceHighway ;
			  BigDecimal distanceGround ;
			  BigDecimal distanceRoute ;

			  BigDecimal summaryAll;

			  summaryAll = distanceHighway = distanceGround = distanceRoute = new BigDecimal(0);

			  ENTransportItemDAO d = new ENTransportItemDAO(connection, userProfile);

			  BigDecimal [] allDistance = new BigDecimal[3];
		      allDistance[0] =  allDistance[1] = allDistance[2] = new BigDecimal(0);

			  int arr[] = d.getFilteredCodeArray(f, f.conditionSQL, null, 0, -1, null);

			  for (int i=0; i < arr.length; i++){
				  allDistance = getDistancesByTransport(arr[i], true);



				  allDistance = getParentDistances(arr[i], allDistance, true);

				  if (allDistance != null){
					  distanceHighway = allDistance[0];
					  distanceGround  = allDistance[1];
					  distanceRoute  = allDistance[2];

					  distanceHighway = distanceHighway.setScale(3,BigDecimal.ROUND_HALF_UP);
					  distanceGround = distanceGround.setScale(3,BigDecimal.ROUND_HALF_UP);
					  distanceRoute = distanceRoute.setScale(3,BigDecimal.ROUND_HALF_UP);

					  ///// 22.05.13 NET-4235
					  //summaryAll = summaryAll.add(calcTimeByDistaces(distanceHighway, distanceGround, distanceRoute, isWinter, isTraktor(arr[i])));
					  summaryAll = summaryAll.add(calcTimeByDistaces(distanceHighway, distanceGround, distanceRoute, isWinter, isTraktor(arr[i]), isServicesFactCalc));
					  /////
				  }
			  }

			  return summaryAll;
		  }

	private BigDecimal[] getParentDistances(int transportCode, BigDecimal dist[], boolean isDeliveryTimes) throws PersistenceException
	{
		  BigDecimal distanceHighway ;
		  BigDecimal distanceGround ;
		  BigDecimal distanceRoute ;

		  distanceHighway = distanceGround = distanceRoute = new BigDecimal(0);

		  // совместная доставка ...
		  ENDeliveryOrderDAO deliveryDAO = new ENDeliveryOrderDAO(connection, userProfile);
		  ENDeliveryOrderFilter dFilter = new ENDeliveryOrderFilter();
		  dFilter.transportInRef.code = transportCode;
		  int parentArr[] = deliveryDAO.getFilteredCodeArray(dFilter, null, null, 0, -1, null);
		  BigDecimal [] parentDistance = null;
		  for (int j=0; j<parentArr.length; j++){
			  ENDeliveryOrder obj = deliveryDAO.getObject(parentArr[j]);

			  parentDistance = getDistancesByTransport(obj.transportOut.code, isDeliveryTimes);

			  parentDistance = getParentDistances(obj.transportOut.code, parentDistance, isDeliveryTimes);

			  if (parentDistance != null){
				  distanceHighway = distanceHighway.add(parentDistance[0]);
				  distanceGround  = distanceGround.add(parentDistance[1]);
				  distanceRoute  = distanceRoute.add(parentDistance[2]);
			  }

		  }

		  if ( distanceHighway.add(distanceGround).add(distanceRoute).doubleValue() != 0.0 ){
			  if (dist == null){
			      dist = new BigDecimal[3];
			      dist[0] = dist[1] = dist[2] = new BigDecimal(0);
			  }
		  }



		  if (dist != null){
		  dist[0] = dist[0].add(distanceHighway);
		  dist[1] = dist[1].add(distanceGround);
		  dist[2] = dist[2].add(distanceRoute);
		  }

		  return dist;

	}


	  public BigDecimal[] getDistancesByTransport(int transportCode, boolean isDeliveryTimes) throws PersistenceException
	  {
		  ENDistanceFilter dFilter = new ENDistanceFilter();
		  //dFilter.typeRef.code = ENDistanceType.DISTANCE_FROM + TO

		  dFilter.transportItemRef.code = transportCode;
		  if ( isDeliveryTimes ){
		    dFilter.conditionSQL = " endistance.typerefcode <> " + ENDistanceType.DISTANCE_OTHER;
		  }

		  ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
		  ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);

		  BigDecimal allDistance = new BigDecimal(0);

		  BigDecimal distanceHighway = new BigDecimal(0);
		  BigDecimal distanceGround = new BigDecimal(0);
		  BigDecimal distanceRoute = new BigDecimal(0);

		  for (int j=0; j < dList.totalCount; j++){
			  if (dList.get(j).roadTypeCode == ENRoadType.HIGHWAY )
				  distanceHighway = distanceHighway.add(dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);

			  if (dList.get(j).roadTypeCode == ENRoadType.GROUND)
				  distanceGround = distanceGround.add(dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);

			  if (dList.get(j).roadTypeCode == ENRoadType.ROUTE )
				  distanceRoute = distanceRoute.add(dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);

			  allDistance = allDistance.add( dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);
		  }

		  allDistance = allDistance.setScale(3,BigDecimal.ROUND_HALF_UP);

		  if (allDistance.doubleValue() == 0){
			  //System.out.println("Finish calc distance =" + allDistance.doubleValue() + " code =" + planWorkCode);
			  return null;
		  }

		  distanceHighway = distanceHighway.setScale(3,BigDecimal.ROUND_HALF_UP);
		  distanceGround = distanceGround.setScale(3,BigDecimal.ROUND_HALF_UP);
		  distanceRoute = distanceRoute.setScale(3,BigDecimal.ROUND_HALF_UP);
	      BigDecimal [] array;

	      array = new BigDecimal[3];
	      array[0] = distanceHighway;
	      array[1] = distanceGround;
	      array[2] = distanceRoute;
		  return array;
	  }

	  public BigDecimal calcTimeByDistaces(
			  BigDecimal distanceHighway,
			  BigDecimal distanceGround,
			  BigDecimal distanceRoute,
			  boolean isWinter,
			  boolean isTraktor
	  ) throws PersistenceException
	  {
		  return calcTimeByDistaces(distanceHighway, distanceGround, distanceRoute, isWinter, isTraktor, false);
	  }

	  public BigDecimal calcTimeByDistaces(
			  BigDecimal distanceHighway,
			  BigDecimal distanceGround,
			  BigDecimal distanceRoute,
			  boolean isWinter,
			  boolean isTraktor,
			  boolean isServicesFactCalc
	  ) throws PersistenceException
	  {

		  ENRoadTypeDataFilter rdFilter = new ENRoadTypeDataFilter();
		  rdFilter.isWinter = isWinter ? 1 : 0;

		  BigDecimal outTime = new BigDecimal(0);

		  ENRoadTypeDataDAO rdDAO = new ENRoadTypeDataDAO(connection, userProfile);
		  ENRoadTypeDataShortList rdList = new ENRoadTypeDataShortList();

		  double coef_Highway_Winter = 0;
		  double coef_Ground_Winter = 0;
		  double coef_Route_Winter = 0;

		  double coef_Highway_noWinter = 0;
		  double coef_Ground_noWinter = 0;
		  double coef_Route_noWinter = 0;

		  ///// 22.05.13 NET-4235 Новицкая Л.В. Для расчета времени доставки по услугам, где не было нашего транспорта
		  if (isServicesFactCalc)
		  {
			  // Усредненная скорость 30 км/ч для всех типов дорог!
			 /* coef_Highway_Winter = 0.0333;
			  coef_Ground_Winter = 0.0333;
			  coef_Route_Winter = 0.0333;

			  coef_Highway_noWinter = 0.0333;
			  coef_Ground_noWinter = 0.0333;
			  coef_Route_noWinter = 0.0333;


			  */
			  // SUPP-4444 вместо 30 км средних нужно использовать 45 км
			  coef_Highway_Winter = 0.0222;
			  coef_Ground_Winter = 0.0222;
			  coef_Route_Winter = 0.0222;

			  coef_Highway_noWinter = 0.0222;
			  coef_Ground_noWinter = 0.0222;
			  coef_Route_noWinter = 0.0222;


		  }
		  /////
		  else
		  if(!isTraktor)
		  {
			  coef_Highway_Winter = 0.025;
			  coef_Ground_Winter = 0.04;
			  coef_Route_Winter = 0.1;

			  coef_Highway_noWinter = 0.0221;
			  coef_Ground_noWinter = 0.0331;
			  coef_Route_noWinter = 0.0666;
		  }
		  else
		  {
			  /* NET-3993 СТ Вишневский. 19.12.2012. Служебная. зміни по наказу 726 від 14.12.2012р
			   * 1.7. Під час виконання перебазування тракторів та спеціальної самохідної
			   * техніки до місця виконання роботи або виконання робіт які потребують понижених
			   * швидкостей, встановити наступну базову одиницю переводу: шосейна дорога - 30 км.
			   * за одну мотогодину, ґрунтова дорога - 25 км. за одну мотогодину, по трасі (уздовж
			   * ліній електропередач) 15 - км. за одну мотогодину
			   */
			  coef_Highway_Winter = 0.0333;
			  coef_Ground_Winter = 0.04;
			  coef_Route_Winter = 0.0666;

			  coef_Highway_noWinter = 0.0333;
			  coef_Ground_noWinter = 0.04;
			  coef_Route_noWinter = 0.0666;
		  }


		  double coef = 0;

		  if (distanceHighway.doubleValue() > 0 ){
			  rdFilter.typeRef.code = ENRoadType.HIGHWAY;
			  rdFilter.conditionSQL = " distance <= "+distanceHighway;
			  rdFilter.orderBySQL = "distance desc";

			  rdList = rdDAO.getScrollableFilteredList(rdFilter,0,-1);
			  coef = isWinter ? coef_Highway_Winter : coef_Highway_noWinter;

			  if ( rdList.totalCount > 0 ){
				  outTime = outTime.add(rdList.get(0).coeff).setScale(3,BigDecimal.ROUND_HALF_UP);
			      outTime = outTime.add( new BigDecimal((distanceHighway.doubleValue() - rdList.get(0).distance.doubleValue())* coef) ).setScale(3,BigDecimal.ROUND_HALF_UP);
			  }
			  else
				  outTime = new BigDecimal(outTime.doubleValue() + ( (distanceHighway.doubleValue() * coef)) ).setScale(3,BigDecimal.ROUND_HALF_UP);

		  }


		  if (distanceGround.doubleValue() > 0 ){
			  rdFilter.typeRef.code = ENRoadType.GROUND;
			  rdFilter.conditionSQL = " distance <= "+distanceGround;
			  rdFilter.orderBySQL = "distance desc";
			  rdList = rdDAO.getScrollableFilteredList(rdFilter,0,-1);

			  coef = isWinter ? coef_Ground_Winter : coef_Ground_noWinter;

			  if ( rdList.totalCount > 0 ){
				  outTime = outTime.add(rdList.get(0).coeff).setScale(3,BigDecimal.ROUND_HALF_UP);
			      outTime = outTime.add( new BigDecimal((distanceGround.doubleValue() - rdList.get(0).distance.doubleValue())* coef) ).setScale(3,BigDecimal.ROUND_HALF_UP);
			  }
			  else
				  outTime = new BigDecimal(outTime.doubleValue() + ( (distanceGround.doubleValue() * coef)) ).setScale(3,BigDecimal.ROUND_HALF_UP);

		  }


		  if (distanceRoute.doubleValue() > 0 ){
			  rdFilter.typeRef.code = ENRoadType.ROUTE;
			  rdFilter.conditionSQL = " distance <= "+distanceRoute;
			  rdFilter.orderBySQL = "distance desc";
			  rdList = rdDAO.getScrollableFilteredList(rdFilter,0,-1);

			  coef = isWinter ? coef_Route_Winter : coef_Route_noWinter;

			  if ( rdList.totalCount > 0 ){
				  outTime = outTime.add(rdList.get(0).coeff).setScale(3,BigDecimal.ROUND_HALF_UP);
			      outTime = outTime.add( new BigDecimal((distanceRoute.doubleValue() - rdList.get(0).distance.doubleValue())* coef) ).setScale(3,BigDecimal.ROUND_HALF_UP);
			  }
			  else
				  outTime = new BigDecimal(outTime.doubleValue() + ( (distanceRoute.doubleValue() * coef)) ).setScale(3,BigDecimal.ROUND_HALF_UP);
		  }

		//	System.out.println("Finish calc distance for ..." + msg + " code =" + planWorkCode);

		  return outTime;

	  }

	  public BigDecimal calculateTimeForPlanItemByDistance(int planWorkItemCode) throws PersistenceException
	  {
		  //System.out.println("Start calculateTimeForPlanItemByDistance for " + planWorkItemCode);
		  BigDecimal out = new BigDecimal(0);
		  out = calculateTimeForPlanByDistance(planWorkItemCode, 1);
		  //System.out.println("Final calculateTimeForPlanItemByDistance for " + planWorkItemCode + " values=" + out);
		  return out;
	  }


	  //public checkTranspoertForPlan
	  public void calculateTransportItem_(int transportItemCode) throws PersistenceException{
		ENTransportItemDAO eDao = new ENTransportItemDAO(connection, userProfile);
		ENTransportItem eObj = eDao.getObject(transportItemCode);

		TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
		ENTransportItemData mData = kDao.getTransportDataItemsByTransport(eObj.transportReal.code);

		//eObj.price = mData.price;
	//	eObj.cost = mData.price.multiply(eObj.countFact).setScale(2,BigDecimal.ROUND_HALF_UP);

		eDao.save(eObj);

	}

	public void createENTransportItems(int planItemCode) throws PersistenceException{

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
		ENTransportItemDAO eDao = new ENTransportItemDAO(connection, userProfile);

		ENPlanWorkItem planItemObj = dao.getObject(planItemCode);

		//ENPlanWorkDAO planDAO = new ENPlanWorkDAO(connection, userProfile);
		//ENPlanWork plan = planDAO.getObject(planItemObj.planRef.code);

		TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);
		ENTransportItemData[] data = kDao.getTransportDataItems(planItemObj.kartaRef.code);
		for (int i=0; i<data.length; i++){
			ENTransportItem eItem = new ENTransportItem();
			eItem.planItemRef.code = planItemObj.code;
			eItem.planRef.code = planItemObj.planRef.code;
			eItem.transport.code = data[i].trasnportCode;
			// Количество машино часов - литры
			eItem.countWorkGen = data[i].trasnportRealCount.multiply(planItemObj.countGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP); //data[i].trasnportRealCount.multiply(planItemObj.countGen).multiply(data[i].rashodWork).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			//eItem.price = data[i].price;
			//eItem.cost =  new BigDecimal(0);//(data[i].)+ data[i].price.multiply(eItem.countWorkGen).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			eItem.countWorkFact = eItem.countWorkGen;
			eItem.typeRef.code = 1; // auto ...

			eItem.tktransportType.code = data[i].transportType;

			//eItem.distanceTo = plan.distanceTo;
			//eItem.distanceAlong = plan.distanceAlong;

			eItem.code = eDao.add(eItem);

			// расчитаем расходы ... и развяжем с материалом ...
			generateGSMEstimate(eItem.code);
		}

	}

/*	public void createENEstimate11(int planCode) throws PersistenceException{

		cancelENEstimate11(planCode);

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItemFilter filter = new ENPlanWorkItemFilter();
		filter.planRef.code = planCode;
		ENPlanWorkItemShortList list = dao.getScrollableFilteredList(filter,0,-1);
		for (int i = 0 ; i < list.totalCount; i++){
			createENEstimateItems(list.get(i).code);
		}
	}

		public void cancelENEstimate11(int planCode) throws PersistenceException{

		PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
		if (planLogic.isNotEditablePlan(planCode)){
			throw new EnergyproSystemException("Plan CLOSED. Using Reopen");
		}

		ENPlanWorkItemDAO dao = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItemFilter filter = new ENPlanWorkItemFilter();
		filter.planRef.code = planCode;
		ENPlanWorkItemShortList list = dao.getScrollableFilteredList(filter,0,-1);
		for (int i = 0 ; i < list.totalCount; i++){
			cancelENEstimateItem11(list.get(i).code);
		}
	}

	public void cancelENEstimateItem11(int planItemCode) throws PersistenceException{
		ENEstimateItemDAO eDao = new ENEstimateItemDAO(connection, userProfile);
		ENEstimateItemFilter filter = new ENEstimateItemFilter();
		filter.planItemRef.code = planItemCode;
		//filter.typeRef.code = ENEstimateItemType.AUTO;
		ENEstimateItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
		for (int i=0; i < list.totalCount; i++){
			//if (list.get(i).typeRefCode == ENEstimateItemType.MANUAL){
			//	throw new EnergyproSystemException("Estimate item is MANUAL. Drop it manually. code = "+list.get(i).code);
			//}
			eDao.remove(list.get(i).code);
		}
	}
*/
	/*
	 * удаляет все части СМЕТЫ по коду части плана
	 */
	public void removeENTransportItemsByPlanItemCode(int planItemCode) throws PersistenceException{
		ENTransportItemDAO eDao = new ENTransportItemDAO(connection, userProfile);
		//ENDistanceDAO distDAO = new ENDistanceDAO(connection, userProfile);
		ENTransportItemFilter filter = new ENTransportItemFilter();
		filter.planItemRef.code = planItemCode;

		//ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection, userProfile);
		//ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);

		//filter.typeRef.code = ENEstimateItemType.AUTO;

		//Vector finWorkerCodes = new Vector();

		//ENTransportItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
		int[] arr = eDao.getFilteredCodeArray(filter,0,-1);
		for (int i=0; i < arr.length; i++){
			// удалим РАССТОЯНИЯ
			//ENDistanceFilter distFilter = new ENDistanceFilter();
			//distFilter.transportItemRef.code = list.get(i).code;
			//ENDistanceShortList distList = distDAO.getScrollableFilteredList(distFilter, 0, -1);
			//for (int j = 0; j < distList.totalCount; j++){
			//	distDAO.remove(distList.get(j).code);
			//}

			// запомним ФИНВОРКЕРОВ ... и удалим их тоже !!!
			//if (list.get(i).finWorkerCode > Integer.MIN_VALUE ){
			//	finWorkerCodes.add(new Integer(list.get(i).finWorkerCode));
			//}


			//  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
			//  t2Filter.transportRef.code = list.get(i).code;
			//  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);

			//  if ( t2eList.totalCount > 0){
			//	  for (i=0; i < t2eList.totalCount; i++){
				    	 // удалим связку и материал ...
			//	    	 t2DAO.remove(t2eList.get(i).code);
			//	    	 estDAO.remove(t2eList.get(i).estimateRefCode);
			//	  }
			// }
			// все что связано с ТранспортИтемом выноситься в ДАО ...
			eDao.remove(arr[i]);
		}

		// удалим уже ;) неиспользуемых  ФИНВОРКЕРОВ ...
		//FINWorkerDAO finWorkerDAO = new FINWorkerDAO(connection, userProfile);
		//for ( int j = 0; j < finWorkerCodes.size(); j++ ){
		//	finWorkerDAO.remove(  ((Integer)(finWorkerCodes.get(j))).intValue() );
		//}

	}


	public int removeGSMByTransportItemCode(int transportItemCode) throws PersistenceException
	{
		  int materialCode = Integer.MIN_VALUE;
		  ENEstimateItemDAO estDAO = new ENEstimateItemDAO(connection,userProfile);
		  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);
		  ENEstimateItem2ENEstimateItemDAO e2DAO = new ENEstimateItem2ENEstimateItemDAO(connection, userProfile);
		  EstimateLogic eLogic = new EstimateLogic(connection, userProfile);

		  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
		  t2Filter.transportRef.code = transportItemCode;
		  ENTransport2ENEstimateShortList t2List = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);
		  for (int i=0; i < t2List.totalCount; i++){


			  FINMaterialsShortList fList = eLogic.getFINMaterialsListByEstimateItemCode(t2List.get(i).estimateRefCode);
			  if ( fList.totalCount > 0){
				  throw new EnergyproSystemException("На строке ГСМ есть зарезервированный материал ... Отмените резервирование !!!"
						  , userProfile);
			  }
			  if (materialCode == Integer.MIN_VALUE){
				  ENEstimateItem e = estDAO.getObject(t2List.get(i).estimateRefCode);
				  materialCode = e.materialRef.code;
			  }
			  t2DAO.remove(t2List.get(i).code);

			  /// Вынесем связку эстимейтов
			  ENEstimateItem2ENEstimateItemFilter e2Filter = new ENEstimateItem2ENEstimateItemFilter();
			  e2Filter.estimateItemOutRef.code = t2List.get(i).estimateRefCode;
			  int[] e2Arr = e2DAO.getFilteredCodeArray(e2Filter, 0, -1);

			  for (int j = 0; j < e2Arr.length; j++)
			  {
				  e2DAO.remove(e2Arr[j]);
			  }
			  ///

			  estDAO.remove(t2List.get(i).estimateRefCode);
		  }

		  return materialCode;
	}


	/*
	 * пересчитываем все части СМЕТЫ по коду части плана ... и измененной части плана
	 */
	public void recalcENTransportItemsByPlanItemCode(int planItemCode) throws PersistenceException{

		ENPlanWorkItemDAO pwiDAO = new ENPlanWorkItemDAO(connection, userProfile);
		ENPlanWorkItem pwi = pwiDAO.getObject(planItemCode);


		ENTransportItemDAO eDao = new ENTransportItemDAO(connection, userProfile);
		TKTechCardDAO kDao = new TKTechCardDAO(connection, userProfile);

		ENTransportItemFilter filter = new ENTransportItemFilter();
		filter.planItemRef.code = planItemCode;
		//filter.typeRef.code = ENEstimateItemType.AUTO;

		ENTransportItemData data = new ENTransportItemData();

		//ENTransportItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
		int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);

		if ( arr.length > 0 )
		{

		ENPlanWork plan = new ENPlanWorkDAO(connection, userProfile).getObject(pwi.planRef.code);
		boolean inTravelSheet = false;
		for (int i=0; i < arr.length; i++){
            ENTransportItem eItem = eDao.getObject(arr[i]);



    		data = kDao.getTransportDataItemsByTransportCodeAndTechCardCode(eItem.transport.code, pwi.kartaRef.code );

    		//eItem.transportTypeRef.code = data.transportType;
    		// транспорт в ПЛ
    		inTravelSheet = checkTransportItemInTravelSheet(eItem.code, false);

    		if ( inTravelSheet ){

    			// обнуляли работы ....
    			if (pwi.countGen.doubleValue() == 0){
    				throw new EnergyproSystemException("Ця робота зв'язана з Подорожнім Листом ... видаляйте її з Подорожного Листа");
    			}

    			eItem.countWorkGen = data.trasnportRealCount.multiply(pwi.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);

				if (eItem.tktransportType.code == TKTransportType.BRIGADE){
					eItem.countWorkFact = eItem.countWorkGen;
				}

    			// в нормативе авто есть  ...
    			if ((data.transportType != Integer.MIN_VALUE) && (plan.typeRef.code != ENPlanWorkType.TRUCKING))
    			{
    				if (eItem.countWorkFact.doubleValue() > eItem.countWorkGen.doubleValue()){
    					throw new EnergyproSystemException("Фактична кількість маш/год не повинна перевищувати нормативну ... треба зменшити кількість маш/год у подорожному листі ");
    				}
    			}
    		}
    		else{
	            if (eItem.typeRef.code == ENEstimateItemType.AUTO){
					eItem.countWorkGen = data.trasnportRealCount.multiply(pwi.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					eItem.countWorkFact = eItem.countWorkGen;
				}else
				if (eItem.typeRef.code == ENEstimateItemType.CORRECTED){
					eItem.countWorkGen = data.trasnportRealCount.multiply(pwi.countGen).setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
    		}

    		/// SUPP-25730 п.2 - ограничение работы реального транспорта на Задании План в часах в день на разных планах
    	if(eItem.countWorkFact.compareTo(new BigDecimal(0)) ==1 ) // пропускаем проверку если обнуляют машино часы
    	  if (eItem.tktransportType.code != TKTransportType.BRIGADE)  // бригадные машины не проверяем т.к на них не считается пмм
           if (eItem.transportReal != null ) {
        	 if (eItem.transportReal.code != Integer.MIN_VALUE ) {
               if (plan.kind.code == ENPlanWorkKind.NPW ) {
                this.checkMaxWorkTimeForRealTransportByDay(eItem.code , eItem.transportReal.code , plan.dateStart , eItem.countWorkFact );
               }
        	 }
           }
		    eDao.save(eItem);

		    // ТОПЛИВО расчитывем только если авто БЕЗ тр. листа ...
		    if ( ! inTravelSheet )
		    {
		    	generateGSMEstimate(eItem.code);
		    }

			/*

             else
			if (eItem.typeRef.code == ENEstimateItemType.)
			{
				throw new EnergyproSystemException("Unknown ENEstimateItemType , code = " +eItem.typeRef.code);
			}
			*/

     //       eItem.cost = data.price.multiply(eItem.countFact).setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
	//		eItem.price = data.price;

		}
		}else
		{
			createENTransportItems(planItemCode);
		}
		 // System.out.println("!!!!!!!!!!!!!!");
		// если сдвинулись техкарты ... выбрать о что добавлено ...
	}

	public int countTransportItemInPlan(int planCode) throws PersistenceException{
		ENTransportItemDAO eDao = new ENTransportItemDAO(connection, userProfile);
		ENTransportItemFilter filter = new ENTransportItemFilter();
		filter.planRef.code = planCode;
		//filter.typeRef.code = ENEstimateItemType.AUTO;
		//ENTransportItemShortList list = eDao.getScrollableFilteredList(filter,0,-1);
		int[] arr = eDao.getFilteredCodeArray(filter, 0, -1);
		return arr.length;
	}

	/*
	 * проверка можно ли редактировать транспорт ...
	 * - зависает соместная доставка и т.д.
	 */
	public void validateEditableTransport__(int transportCode) throws PersistenceException
	{
		ENDeliveryOrderFilter doFilter = new ENDeliveryOrderFilter();
		//doFilter.conditionSQL = " d.transportinrefcode = "+ transportCode +" or d.transportoutcode = " + transportCode;
		doFilter.conditionSQL = " ENDELIVERYORDER.transportinrefcode = "+ transportCode +" or ENDELIVERYORDER.transportoutcode = " + transportCode;
		ENDeliveryOrderDAO doDAO = new ENDeliveryOrderDAO(connection, userProfile);
		//ENDeliveryOrderShortList doList = doDAO.getScrollableFilteredList(doFilter, 0, -1);
		int[] arr = doDAO.getFilteredCodeArray(doFilter, doFilter.conditionSQL, null, 0, -1, null);
		if (arr.length > 0){
			throw new EnergyproSystemException("Этот транспорт используеться в совместной доставке на других или на этом планах ... удаляйте совместную доставку!!!");
		}
	}

	public void validateEditableTransportByPlanItemCode__(int planItemCode) throws PersistenceException
	{
		ENTransportItemFilter f = new ENTransportItemFilter();
		f.planItemRef.code = planItemCode;
		f.conditionSQL = "entransportitem.transportrealcode is not null";
		ENTransportItemDAO dao = new ENTransportItemDAO(connection, userProfile);
		int[] arr = dao.getFilteredCodeArray(f, 0, -1);
		for (int i=0; i<arr.length; i++){
			// пока совм. доставка
			validateEditableTransport__(arr[i]);
		}
	}

	 public int getTransportItemCodeFactByTransportItemPlan(int transportItemPlan) throws PersistenceException
	  {
		 int out = Integer.MIN_VALUE;
		 ENTransportItem2TransportItemDAO ti2tiDAO = new ENTransportItem2TransportItemDAO(connection, userProfile);
		 ENTransportItem2TransportItemFilter ti2tiFilter = new ENTransportItem2TransportItemFilter();
		 ti2tiFilter.inRef.code = transportItemPlan;
		 ENTransportItem2TransportItemShortList ti2tiList = ti2tiDAO.getScrollableFilteredList(ti2tiFilter, 0, -1);
		 if (ti2tiList.totalCount == 0)
		 {return out;}

		 return out = ti2tiList.get(0).outRefCode;
	  }

	 /* Расчет нормативного количества топлива для транспорта на основании данных по марке и типу транспорта*/

	 public void generateNORMGSM(int transportItemCode) throws PersistenceException
	  {

		  ENTransportItemDAO tDAO = new ENTransportItemDAO(connection, userProfile);
		  ENEstimateItemDAO eDAO = new ENEstimateItemDAO(connection, userProfile);
		  ENTransport2ENEstimateDAO t2DAO = new ENTransport2ENEstimateDAO(connection, userProfile);

		  ENTransportItem t = tDAO.getObject(transportItemCode);
		  //int[] t2e;

		  if (t.tktransportType.code != TKTransportType.MECHANIZM){

		  BigDecimal byTime = new BigDecimal(0);
		  BigDecimal byDistance = new BigDecimal(0);
		  BigDecimal val = new BigDecimal(0);
		  int estimateCode = Integer.MIN_VALUE;


				  // вытяним дату Плана ... посчитаем коэфф. для зимнего расхода ...
				  ENPlanWork plan = new PlanWorkLogic(connection, userProfile).getPlanByCode(t.planRef.code);
				  BigDecimal winterCoeff = calcWinterCoeff(plan.dateStart);

				  /// для кошториса и кошториса единичного не будем считать ПММ
				  if (plan.kind.code == ENPlanWorkKind.CALCULATION || plan.kind.code == ENPlanWorkKind.CALCULATION_SINGLE)
				  {return;}

				  ENTransport2ENEstimateFilter t2Filter = new ENTransport2ENEstimateFilter();
				  t2Filter.transportRef.code = transportItemCode;
				  ENTransport2ENEstimateShortList t2eList = t2DAO.getScrollableFilteredList(t2Filter, 0, -1);

				  if ( t2eList.totalCount > 0){
					  for (int i=0; i < t2eList.totalCount; i++){
					     ENEstimateItem newEItem = eDAO.getObject(t2eList.get(i).estimateRefCode);
					     estimateCode = newEItem.code;
					     newEItem.materialRef.code = t.transport.transportmark.fueltype.materialRef.code ; //getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!

					     byTime = calculateNormFuelByTime(transportItemCode, plan.dateStart);
					     byDistance = calculateNormFuelByDistance(transportItemCode, plan.dateStart);
					     newEItem.commentGen = t.transport.name + ", марка: " + t.transport.transportmark.name + ", маш/год:" + byTime.toString() + ", пробіг:" + byDistance + ", коэф=" + winterCoeff;

					     val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

					     newEItem.countGen = val;

					 	 newEItem.countFact = newEItem.countGen;
					 	 newEItem.typeRef.code = ENEstimateItemType.AUTO;

					     eDAO.save(newEItem);
					  }
				  }
				  else{

						byTime = calculateNormFuelByTime(transportItemCode, plan.dateStart);
					    byDistance = calculateNormFuelByDistance(transportItemCode, plan.dateStart);
					    val = byTime.add(byDistance).setScale(2, BigDecimal.ROUND_HALF_UP) ;// посчитать !!! ;)

					    if (val.doubleValue() > 0.009)
					    {
						    int eCode = Integer.MIN_VALUE;
							ENEstimateItem ee = new ENEstimateItem();
							ee.kindRef.code = ENEstimateItemKind.GSM;
							ee.planRef.code = t.planRef.code;
							ee.planItemRef.code = t.planItemRef.code;
							ee.countGen = val; //new BigDecimal(0);
							ee.materialRef.code =  t.transport.transportmark.fueltype.materialRef.code ;//getMaterialByFuelType( t.transportReal.transportmark.fueltype.code ); // код БЕНЗА из ТехКАРТ !!!!!!!!!!!!!!!!
							ee.typeRef.code = ENEstimateItemType.AUTO;
							ee.countFact = val; //calculateFuelCount(transportItemCode) ;// посчитать !!! ;)
							ee.cost = new BigDecimal(0); // ???
							ee.userGen = userProfile.userName;
							ee.dateEdit = new Date();

						    ee.commentGen = t.transport.name + ", марка: " + t.transport.transportmark.name + ", витрати : (з маш/г)" + byTime.toString() + " л, (з пробігу): " + byDistance + " л";
							ee.statusRef.code = ENEstimateItemStatus.PLANNED;

						    eCode = eDAO.add(ee);
						    ENTransport2ENEstimate t2 = new ENTransport2ENEstimate();
						    t2.transportRef.code = transportItemCode;
						    t2.estimateRef.code = eCode;
						    t2DAO.add(t2);
						    estimateCode = eCode;
					    }
				  }

				  // проверим не 0 ли в расходе .. если 0 и есть развязка - В САД .. пусть отменяют ...
				  if ( val.doubleValue() < 0.009 ){

					  if (estimateCode != Integer.MIN_VALUE){

					  EstimateLogic eLogic = new EstimateLogic(connection, userProfile);
					  FINMaterialsShortList fList = eLogic.getFINMaterialsListByEstimateItemCode(estimateCode);
					  if ( fList.totalCount > 0){
						  throw new EnergyproSystemException("На строке ГСМ есть зарезервированный материал ... Отмените резервирование !!!");
					  }
					  }
				  }

				  ///// NET-4440 Сохраняем историю ГСМ по плану
				  // 27.02.15 Убираем отсюда, т.к. метод будет вызываться во внешних методах в контроллерах!
				  // PlanWorkLogic planLogic = new PlanWorkLogic(connection, userProfile);
				  // planLogic.generatePlanFuelHistory(t.planRef.code);
				  /////

	  } // если не МЕХАНИЗМ .. для механизма ниче считать не надо ...

	  }


	  public BigDecimal calculateNormFuelByTime(int transportItemCode, Date dateGen) throws PersistenceException
	  {
		BigDecimal out = new BigDecimal(0);
		ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		ENTransportItem tr = trDAO.getObject(transportItemCode);

		// ТОРМОЗЗЗЗ работы гдето раньше надо проверять  ...
		ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

		if ( pwi.countGen.doubleValue() <= 0.0 ){
			return out;
		}

		if (tr.tktransportType.code != TKTransportType.BRIGADE){

					// пусть вводят - просто не будем считать

					  if (tr.transport.transportmark.rashodWork == null){
						  return out;
					  }

					  out = tr.countWorkFact.multiply(tr.transport.transportmark.rashodWork).setScale(2, BigDecimal.ROUND_HALF_UP);

				}

		return out;
	  }

	  public BigDecimal calculateNormFuelByDistance(int transportItemCode, Date dateGen) throws PersistenceException
	  {
			BigDecimal out = new BigDecimal(0);
			ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
			ENTransportItem tr = trDAO.getObject(transportItemCode);

			ENPlanWorkItem pwi = new ENPlanWorkItemDAO(connection, userProfile).getObject(tr.planItemRef.code);

			if ( pwi.countGen.doubleValue() <= 0.0 ){
				return out;
			}

					  ENDistanceFilter dFilter = new ENDistanceFilter();
					  dFilter.transportItemRef.code = transportItemCode;
					  ENDistanceDAO dDAO = new ENDistanceDAO(connection, userProfile);
					  ENDistanceShortList dList = dDAO.getScrollableFilteredList(dFilter,0,-1);

					  BigDecimal allDistance = new BigDecimal(0);

					  for (int j=0; j < dList.totalCount; j++){
						  allDistance = allDistance.add( dList.get(j).distance).setScale(3,BigDecimal.ROUND_HALF_UP);
					  }

					  allDistance = allDistance.setScale(3,BigDecimal.ROUND_HALF_UP);

					  if (allDistance.doubleValue() == 0){
						  return out;
					  }

					  allDistance = new BigDecimal(allDistance.doubleValue() / 100);

					  if (tr.transport.transportmark.rashodProbeg == null){
						  throw new EnergyproSystemException("Не указан расход топлива для МАРКИ " + tr.transport.transportmark.name + ", Code="+tr.transport.transportmark.code);
					  }

					  BigDecimal winterCoef = calcWinterCoeff(dateGen);
					  out = tr.transport.transportmark.rashodProbeg.multiply(allDistance).setScale(2, BigDecimal.ROUND_HALF_UP);
					  out = out.multiply(winterCoef).setScale(2, BigDecimal.ROUND_HALF_UP);
			return out;
	  }


	  public void addDistanceForTransport(int transportItemCode, java.math.BigDecimal distance, int amountOfJourneys) throws PersistenceException
	  {
		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
		 ENDistanceDAO diDAO = new ENDistanceDAO(connection, userProfile);
		 ENDistanceFilter diFilter = new ENDistanceFilter();
		 ENDistance di = new ENDistance();
		 ENTransportItem ti = new ENTransportItem();
		 ti = tiDAO.getObject(transportItemCode);
		 diFilter.transportItemRef.code = transportItemCode;
		 ENDistanceShortList diList =  diDAO.getScrollableFilteredList(diFilter, 0, -1);
		// удалим все дистанции этого транспортитэма
		 if (diList.totalCount > 0)
		 {
			for (int i=0; i < diList.totalCount; i++)
			{
				diDAO.remove(diList.get(i).code);
			}
		 }
		// добавим дистанцию до объекта
		 di.transportItemRef.code = transportItemCode;
		 di.distance = distance.multiply(new BigDecimal(amountOfJourneys));
		 di.commentGen = "Расстояние для нормативного расчета топлива (до объекта)";
		 di.roadType.code = ENRoadType.HIGHWAY;
		 di.typeRef.code =  ENDistanceType.DISTANCE_TO;
		 diDAO.add(di);
		// добавим дистанцию с объекта
		 di.transportItemRef.code = transportItemCode;
		 di.distance = distance.multiply(new BigDecimal(amountOfJourneys));
		 di.commentGen = "Расстояние для нормативного расчета топлива (c объекта)";
		 di.roadType.code = ENRoadType.HIGHWAY;
		 di.typeRef.code =  ENDistanceType.DISTANCE_FROM;
		 diDAO.add(di);
	  // сохраним итэм
		 ti.distanceNorm = distance;
		 ti.amountOfJourneys = amountOfJourneys;
		 tiDAO.save(ti);

	  }

	  public void removeDistanceForTransport(int transportItemCode) throws PersistenceException
	  {
		 ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
		 ENDistanceDAO diDAO = new ENDistanceDAO(connection, userProfile);
		 ENDistanceFilter diFilter = new ENDistanceFilter();
		 ENTransportItem ti = new ENTransportItem();
		 ti = tiDAO.getObject(transportItemCode);
		 diFilter.transportItemRef.code = transportItemCode;
		 ENDistanceShortList diList =  diDAO.getScrollableFilteredList(diFilter, 0, -1);
		// удалим все дистанции этого транспортитэма
		 if (diList.totalCount > 0)
		 {
			for (int i=0; i < diList.totalCount; i++)
			{
				diDAO.remove(diList.get(i).code);
			}
		 }

		 ti.distanceNorm = new BigDecimal(0);
		 ti.amountOfJourneys = 0;
		 tiDAO.save(ti);

	  }

	  /**
	   *
	   * Возвращает <b>true</b> если к ENTransportItem'у подвязан транспорт с типом путевого листа - Трактор
	   *
	   * @param transportItemCode код ENTransportItem'a
	   * @return <b>true</b> - если подвязан транспорт с типом путевого листа трактор
	   *  <br><b>false</b> - если транспорт не подвязан или подвязан с другим типом путевого листа
	   * @throws PersistenceException
	   */
	  public boolean isTraktor(int transportItemCode) throws PersistenceException
	  {
		  ENTransportItemDAO trDAO = new ENTransportItemDAO(connection, userProfile);
		  ENTransportItem obj = trDAO.getObject(transportItemCode);

		  if(obj.trailerTransportReal == null)
			  return false;

		  if(obj.transportReal.travelSheetTypeRef.code != ENTravelSheetType.TRAKTOR)
			  return false;
		  else return true;

	  }


	  /**
	   *
	   * Возвращает значение коэффициента для расчета топлива
	   *
	   * @param transportDepartmentCode
	   * @param date
	   * @return <b>BigDecimal</b> 0 - если нет коэффициента <br><b>Значение коэффициента</b>
	   */
	  public BigDecimal getTemperatureCoeff(int transportDepartmentCode, Date date) throws PersistenceException
	  {
		  ENTransportTemperatureDAO ttDAO = new ENTransportTemperatureDAO(connection, userProfile);
		  ENTransportTemperature ttObj = ttDAO.getTemperature(transportDepartmentCode, date);



		  if(ttObj != null)
		  {
			  double countGen = ttObj.countGen.doubleValue();

			  int tkFuelKoefCode = Integer.MIN_VALUE;

			  if(countGen <= 0 && countGen >= -5)
				  tkFuelKoefCode = TKFuelKoef.TKFUELKOEF_TEMPERATURE_TO_MINUS_FIVE;
			  if(countGen < -5 && countGen >= -10)
				  tkFuelKoefCode = TKFuelKoef.TKFUELKOEF_TEMPERATURE_UP_TO_MINUS_TEN;
			  else
				  if(countGen < -10 && countGen >= -15)
					  tkFuelKoefCode = TKFuelKoef.TKFUELKOEF_TEMPERATURE_UP_TO_MINUS_FIFTEEN;
				  else
					  if(countGen < -15 && countGen >= -20)
						  tkFuelKoefCode = TKFuelKoef.TKFUELKOEF_TEMPERATURE_UP_TO_MINUS_TWENTY;
					  else
						  if(countGen < -20)
							  tkFuelKoefCode = TKFuelKoef.TKFUELKOEF_TEMPERATURE_UP_TO_MINUS_TWENTY_FIVE;

			  if(tkFuelKoefCode == Integer.MIN_VALUE)
			  {
				  /*Если температура не попадает в пределы этих температурных коэффициентов, то возвращается 1*/
				  return new BigDecimal(0);
			  }
			  else
			  {
				  TKFuelKoefDAO fuelKoefDAO = new TKFuelKoefDAO(connection, userProfile);
				  TKFuelKoef fuelKoefObj = fuelKoefDAO.getObject(tkFuelKoefCode);

				  return fuelKoefObj.koef.divide(new BigDecimal(100));
			  }


		  }
		  else
		  {
			  // Если не найдена температура, то возвращается просто коэффициент равный 1
			  return new BigDecimal(0);
		  }
	  }

	  // SUPP-25730 п.2 - ограничение работы реального транспорта на Задании План в часах в день на разных планах
	  /**
	   * @param
	 * @throws PersistenceException
	   * */
	  public void checkMaxWorkTimeForRealTransportByDay(int currTransportitemCode ,  int realTransportCode, Date date, BigDecimal countWorkFactInCurrTransportitem )
	  {

		 try{


			  ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
			  TKTransportRealDAO trrDAO = new TKTransportRealDAO(connection, userProfile);

			  // по реал транспорту посчитаем часы со всех заданий план в указанном дне
			  ENTransportItemFilter tiFilter = new ENTransportItemFilter();

			  tiFilter.transportReal.code = realTransportCode;
			  tiFilter.conditionSQL = " entransportitem.typerefcode <> "+ TKTransportType.BRIGADE +
					  " and  entransportitem.countworkfact > 0 and " +
					  " entransportitem.planrefcode in ( select p.code from enplanwork p where p.kindcode = "+ ENPlanWorkKind.NPW +" and p.datestart = '" + (new SimpleDateFormat("dd.MM.yyyy")).format(date) + "' " +
					  " and entransportitem.planitemrefcode in  (select pi.code from enplanworkitem pi where pi.code = entransportitem.planitemrefcode and pi.countgen > 0) ) ";
			  tiFilter.orderBySQL = "entransportitem.planrefcode";


			  int[] tiArr = tiDAO.getFilteredCodeArray(tiFilter,0, -1);

			  BigDecimal tiCountworkfact = new BigDecimal(0);

			  Hashtable<Integer, BigDecimal> hashByPlan = new Hashtable<Integer, BigDecimal>();

			  ENTransportItem tiObj = null;
			  for (int i=0; i < tiArr.length; i++){
				  tiObj = tiDAO.getObject(tiArr[i]);

				  if (currTransportitemCode!=tiObj.code ){
				    tiCountworkfact = tiCountworkfact.add(tiObj.countWorkFact);

				    if(hashByPlan.containsKey(tiObj.planRef.code)) {
						  BigDecimal countmhinhash = hashByPlan.get(tiObj.planRef.code);
						  hashByPlan.put(tiObj.planRef.code, tiObj.countWorkFact.add(countmhinhash));
					  } else
					   hashByPlan.put(tiObj.planRef.code, tiObj.countWorkFact);

				  }

			  }
			 // накинем машино часы с текущего транспорт итема который заезжает
			  tiCountworkfact = tiCountworkfact.add(countWorkFactInCurrTransportitem);
			  // запишем в темп по коду  плана значение
			  tiObj = tiDAO.getObject(currTransportitemCode);

			  if(hashByPlan.containsKey(tiObj.planRef.code)) {
				  BigDecimal countmhinhash = hashByPlan.get(tiObj.planRef.code);
				  hashByPlan.put(tiObj.planRef.code, countWorkFactInCurrTransportitem.add(countmhinhash));
			  } else
			   hashByPlan.put(tiObj.planRef.code, countWorkFactInCurrTransportitem);


			  if (tiCountworkfact.compareTo(ENConsts.MAXWORKTIMEFORREALTRANSPORTBYDAY) == 1 )
			  {
				  TKTransportReal trrObj = trrDAO.getObject(realTransportCode);

				  String expt = "";
				  expt = "\n Перевищення максимально допустимого часу ("+ ENConsts.MAXWORKTIMEFORREALTRANSPORTBYDAY +" годин) для роботи реального транспорту в робочий день(SUPP-25730 п.2). " +
					  		"  \n Потрібно зменшувати машино-години спецтехніки на планах " +
					  		"  \n Перелік планів по " + trrObj.name + " за дату " + (new SimpleDateFormat("dd.MM.yyyy")).format(date) + " : ";

				  //
				  tiObj = tiDAO.getObject(currTransportitemCode);
				  int curNPWCode = tiObj.planRef.code;

				  int planCode = Integer.MIN_VALUE;
				  BigDecimal countFromHash = new BigDecimal(0);

				  Enumeration<Integer> itemCodes2 = hashByPlan.keys();
				  while(itemCodes2.hasMoreElements()) {

					  planCode = itemCodes2.nextElement();
						  expt = expt + "  \n "+ new String( planCode==curNPWCode ? " поточний " : "" ) + " Завдання-План (ун.код = "+planCode+")" + " маш.год. = "+ hashByPlan.get(planCode);;
					}

				  throw new EnergyproSystemException(expt );


			  }
		 }
		    catch (PersistenceException e)      
		    {throw new EnergyproSystemException(e.getMessage(),e);}
	  }
	  
	  
	  public void checkFuelLevelSensor(TKTransportReal obj) {
			Connection globusConn = null;
			try {
				globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
				GlobusLogic globusLogic = new GlobusLogic(globusConn, userProfile);
				if (obj.reg_id == Integer.MIN_VALUE
						&& obj.fuelCalcTypeRef.code != TKFuelCalcType.BY_FUEL_LEVEL_SENSOR) {
					return;
				} else if (obj.reg_id == Integer.MIN_VALUE
						&& obj.fuelCalcTypeRef.code == TKFuelCalcType.BY_FUEL_LEVEL_SENSOR) {
					throw new EnergyproSystemException(
							"Для використання датчику палива для транспортного засобу необхідно ввести номер регістратору із \"СКТ Глобус\"");
				} else if (obj.reg_id != Integer.MIN_VALUE
						&& obj.fuelCalcTypeRef.code == TKFuelCalcType.BY_FUEL_LEVEL_SENSOR) {
					if (!globusLogic.checkExistFuelLevelSensor(obj.reg_id)) {
						throw new EnergyproSystemException("Для регістратора № "
								+ obj.reg_id
								+ " не встановлений датчик палива у \"СКТ Глобус\"");
					}
				}
			}  
			catch (PersistenceException e)  {
				throw new EnergyproSystemException(e.getMessage(),e);} 
			catch (DatasourceConnectException e) {
			 throw new EnergyproSystemException(e.getMessage(),e);
			} 	     finally {
				try {
					if (globusConn != null && !globusConn.isClosed()) {
						globusConn.close();
						globusConn = null;
					}
				} catch (SQLException e) {
				}
			} 
		}
	  

	public int addTransportReal(TKTransportReal transportRealObj) throws DatasourceConnectException
	  {
		  try
		  {
				ENElement e = new ENElement();
				ENElementDAO eDAO = new ENElementDAO(connection, userProfile);
				DepartmentLogic dLogic = new DepartmentLogic(connection, userProfile);

				e.code = Integer.MIN_VALUE;
				e.renRef.code = dLogic.getEPRen2Department(transportRealObj.departmentRef.code);
				e.typeRef.code = ENElementType.TRANSPORT;
				
				if (transportRealObj.enelement.geoDepartmentRef != null) {
			    	  if (transportRealObj.enelement.geoDepartmentRef.code != Integer.MIN_VALUE ) {
			    		  e.geoDepartmentRef.code = transportRealObj.enelement.geoDepartmentRef.code;
			    	  }
			    	  
			      }
				
				e.code = eDAO.add(e);

				transportRealObj.enelement.code = e.code;

				TKTransportRealDAO transportRealDAO = new TKTransportRealDAO(connection, userProfile);

				if (transportRealObj.transportstatus.code == TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {
					transportRealObj.invNumber = "000000";
					transportRealObj.name = transportRealObj.buhName;
				}

				checkFuelLevelSensor(transportRealObj);

				if (transportRealObj.transportstatus.code != TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {
					TKTransportRealFilter trFilter = new TKTransportRealFilter();
					trFilter.invNumber = transportRealObj.invNumber;
					int[] trcodes = transportRealDAO.getFilteredCodeArray(trFilter, 0, -1);
					if (trcodes.length > 0) {
						throw new EnergyproSystemException(
								"Машина з таким інвентарним номером вже введена!");
					}

				}

				/*
				 * NET-2962 Проверка на уникальность reg_id - номер регистратора из
				 * СКТ "Глобус"
				 */
				if (transportRealObj.reg_id != Integer.MIN_VALUE) {
					TKTransportRealFilter trFilter = new TKTransportRealFilter();
					trFilter.reg_id = transportRealObj.reg_id;
					int[] trcodes = transportRealDAO.getFilteredCodeArray(trFilter, 0, -1);
					for (int i = 0; i < trcodes.length; i++)
						if (trcodes.length > 0 && trcodes[i] != transportRealObj.code) {
							throw new EnergyproSystemException(
									"Машина з таким номером реєстратора з \"СКТ Глобус\" вже введена!");
						}
				}

				int result = transportRealDAO.add(transportRealObj);

				if (transportRealObj.transportstatus.code != TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {
					/*
					 * Вставка в таблицу истории перемещения автомобиля по МОЛам и
					 * подразделениям - TKTransportRealHistory
					 */
					if (transportRealObj.finMolCode.length() != 0
							|| transportRealObj.transportdepartmentRef.code != Integer.MIN_VALUE
							|| transportRealObj.departmentRef.code != Integer.MIN_VALUE
							|| transportRealObj.hasStarter != Integer.MIN_VALUE) {
						TKTransportRealHistoryDAO trhDAO = new TKTransportRealHistoryDAO(connection,userProfile);
						TKTransportRealHistory trhObj = new TKTransportRealHistory();
						trhObj.dateStart = new Date();
						trhObj.dateFinal = null;
						trhObj.departmentRef.code = transportRealObj.departmentRef.code;
						trhObj.transportdepartmentRef.code = transportRealObj.transportdepartmentRef.code;
						trhObj.finMolCode = transportRealObj.finMolCode;
						trhObj.finMolName = transportRealObj.finMolName;
						trhObj.parentRef.code = Integer.MIN_VALUE;
						trhObj.transportRealRef.code = result;
						trhObj.reg_id = transportRealObj.reg_id;
						trhObj.gosNumber = transportRealObj.gosNumber;
						trhObj.hasStarter = transportRealObj.hasStarter;

						trhDAO.add(trhObj);

					}
				}

				return result;

			} catch (PersistenceException e) {
				throw new EnergyproSystemException(e.getMessage(), e);
			} 
	  }
	

	  public void saveTransportReal(TKTransportReal object)  {
	     try
	      {
	      TKTransportRealDAO trDAO = new TKTransportRealDAO(connection, userProfile);
	      ENElementDAO elDao = new ENElementDAO(connection, userProfile);
	      DepartmentLogic dLogic = new DepartmentLogic(connection, userProfile);

	      TKTransportReal oldObj = trDAO.getObject(object.code);

	      checkFuelLevelSensor(object);

	          /*NET-2962 Проверка на уникальность reg_id - номер регистратора из СКТ "Глобус"*/
	          if(object.reg_id != Integer.MIN_VALUE)
	          {
	              TKTransportRealFilter trFilter = new TKTransportRealFilter();
	              trFilter.reg_id = object.reg_id;
	              int [] trcodes  = trDAO.getFilteredCodeArray(trFilter, 0, -1);
	              for(int i = 0; i < trcodes.length; i++)
	                  if (trcodes.length > 0 && trcodes[i] != object.code)
	                  {throw new EnergyproSystemException("Машина з таким номером реєстратора з \"СКТ Глобус\" вже введена!");}
	          }


	          trDAO.save(object);

	      if(oldObj.departmentRef.code != object.departmentRef.code 
	    		  || oldObj.enelement.geoDepartmentRef.code != object.enelement.geoDepartmentRef.code ) {
	      	ENElement element = elDao.getObject(object.enelement.code);
	      	element.renRef.code = dLogic.getEPRen2Department(object.departmentRef.code);
	      	
	      	if (object.enelement.geoDepartmentRef != null) {
		    	  if (object.enelement.geoDepartmentRef.code != Integer.MIN_VALUE ) {
		    		  element.geoDepartmentRef.code = object.enelement.geoDepartmentRef.code;
		    	  }
		    	  
		      }
	      	
	      	elDao.save(element);
	      }

	      if (object.transportstatus.code == TKTransportStatus.TKTRANSPORTSTATUS_FROM_SIDE) {return;}


	      // SUPP-6408 Отдельный метод на изменение расходов топлива
	      BigDecimal rashodProbeg = object.rashodProbeg;
	      BigDecimal rashodWork = object.rashodWork;
	      BigDecimal oldRashodProbeg = oldObj.rashodProbeg;
	      BigDecimal oldRashodWork = oldObj.rashodWork;
	      if(rashodProbeg == null)
	      	rashodProbeg = new BigDecimal(0);
	      if(rashodWork == null)
	      	rashodWork = new BigDecimal(0);
	      if(oldRashodProbeg == null)
	      	oldRashodProbeg = new BigDecimal(0);
	      if(oldRashodWork == null)
	      	oldRashodWork = new BigDecimal(0);

	      // Изменение расходов будет регулироваться отдельным методом
	      if(rashodWork.compareTo(oldRashodWork) != 0 || rashodProbeg.compareTo(oldRashodProbeg) != 0)
	      {
	      	AuthLogic l = new AuthLogic(connection, userProfile);
	      	if(!l.checkPermission("ksoe/techcard/TKTransportRealController", "changeFuelConsumption"))
	      		throw new EnergyproSystemException("Користувач " + getUserProfile().userName + " не має прав змінювати норми витрат палива");
	      }

	      /*Вставка в таблицу истории перемещения автомобиля по МОЛам и подразделениям - TKTransportRealHistory*/
	      // 1. Проверм, что изменялись либо МОЛ либо подразделения

	      //2. Сохранение изменений в БД, если МОЛ или подразделения были изменены.
	      // NET-2962 Теперь также если были изменены гос-номер и номер gps-регистратора
	      // добавим в проверку и сохранение все остальные поля из транспорта
	      if(     object.finMolCode.compareTo((oldObj.finMolCode == null ? " " : oldObj.finMolCode)) != 0 ||
	              object.gosNumber.compareTo((oldObj.gosNumber == null ? " " : oldObj.gosNumber)) != 0 ||
	              object.reg_id != oldObj.reg_id ||
	              object.transportdepartmentRef.code != oldObj.transportdepartmentRef.code ||
	              object.departmentRef.code != oldObj.departmentRef.code ||
	              object.hasStarter != oldObj.hasStarter ||
	              object.name.compareTo((oldObj.name == null ? " " : oldObj.name)) != 0 ||
	              object.buhName.compareTo((oldObj.buhName == null ? " " : oldObj.buhName)) != 0 ||
	              object.invNumber.compareTo((oldObj.invNumber == null ? " " : oldObj.invNumber)) != 0 ||
	              object.finCode != oldObj.finCode ||

	              (object.expensesCode == null ? (new String(" ").compareTo(oldObj.expensesCode == null ? " " : oldObj.expensesCode)) != 0 :
	              	object.expensesCode.compareTo((oldObj.expensesCode == null ? " " : oldObj.expensesCode)) != 0 ) ||

	              (object.rashodWork ==  null ? new BigDecimal(0) : object.rashodWork).compareTo(
	              		(oldObj.rashodWork ==  null ? new BigDecimal(0) : oldObj.rashodWork)) != 0
	               ||

	              (object.rashodProbeg ==  null ? new BigDecimal(0) : object.rashodProbeg).compareTo(
	              		(oldObj.rashodProbeg ==  null ? new BigDecimal(0) : oldObj.rashodProbeg)) != 0
	               ||

	              object.sizCode != oldObj.sizCode ||
	              object.isVerified != oldObj.isVerified ||

	              (object.ladenMass ==  null ? new BigDecimal(0) : object.ladenMass).compareTo((oldObj.ladenMass ==  null ? new BigDecimal(0) : oldObj.ladenMass)) != 0
	               ||

	              (object.capacity ==  null ? new BigDecimal(0) : object.capacity).compareTo((oldObj.capacity ==  null ? new BigDecimal(0) : oldObj.capacity)) != 0
	               ||

	              object.isNotUsed != oldObj.isNotUsed ||
	              object.isOnDuty  != oldObj.isOnDuty ||
	              object.yearOfProducing !=  oldObj.yearOfProducing ||
	              object.transport.code !=  oldObj.transport.code ||
	              object.transportmark.code != oldObj.transportmark.code ||
	              object.transportstatus.code != oldObj.transportstatus.code ||
	              object.fuelCalcTypeRef.code != oldObj.fuelCalcTypeRef.code ||
	              object.travelSheetTypeRef.code != oldObj.travelSheetTypeRef.code ||
	              object.fuelType.code != oldObj.fuelType.code ||
	              object.isOVB != oldObj.isOVB
	              )
	      {
	          if(object.finMolCode.length() != 0 ||
	                  object.transportdepartmentRef.code != Integer.MIN_VALUE ||
	                  object.departmentRef.code != Integer.MIN_VALUE)
	          {
	              TKTransportRealHistory trhObj = new TKTransportRealHistory();

	              trhObj.dateStart = null;
	              trhObj.dateFinal = null;
	              trhObj.userGen = null;
	              trhObj.dateEdit = null;
	              trhObj.departmentRef.code = object.departmentRef.code;
	              trhObj.transportdepartmentRef.code = object.transportdepartmentRef.code;
	              trhObj.finMolCode = object.finMolCode;
	              trhObj.finMolName = object.finMolName;
	              trhObj.reg_id = object.reg_id;
	              trhObj.gosNumber = object.gosNumber;
	              trhObj.transportRealRef.code = object.code;
	              trhObj.koef = trDAO.getAggregateSumKoefs(object.code);
	              trhObj.hasStarter = object.hasStarter;

	              trhObj.name = object.name;
	              trhObj.buhName = object.buhName;
	              trhObj.invNumber = object.invNumber;
	              trhObj.finCode = object.finCode;
	              trhObj.expensesCode = object.expensesCode;
	              trhObj.rashodWork = object.rashodWork;
	              trhObj.rashodProbeg = object.rashodProbeg;
	              trhObj.sizCode = object.sizCode;
	              trhObj.isVerified = object.isVerified;
	              trhObj.ladenMass = object.ladenMass;
	              trhObj.capacity = object.capacity;
	              trhObj.isNotUsed = object.isNotUsed;
	              trhObj.isOnDuty  = object.isOnDuty;
	              trhObj.yearOfProducing = object.yearOfProducing;
	              trhObj.transport.code =  object.transport.code;
	              trhObj.transportmark.code = object.transportmark.code;
	              trhObj.transportstatus.code = object.transportstatus.code;
	              trhObj.fuelCalcTypeRef.code = object.fuelCalcTypeRef.code;
	              trhObj.travelSheetTypeRef.code = object.travelSheetTypeRef.code;
	              trhObj.fuelType.code = object.fuelType.code;
	              trhObj.isOVB  = object.isOVB;

	              addTransportHistory(trhObj);

	          }
	          else
	          {
	              throw new EnergyproSystemException("Не обраний МОЛ або підрозділ");
	          }
	      }

	      }
	     catch (PersistenceException e)       {
	    	 throw new EnergyproSystemException(e.getMessage(),e);} 
	     catch (DatasourceConnectException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    }

	  

	  public int addTransportHistory(TKTransportRealHistory object) throws DatasourceConnectException {
		 
		  Connection globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
		  try
	      {

	    	 
	  	   if(object.reg_id != Integer.MIN_VALUE)
	  	   {

				GlobusLogic globusLogic = new GlobusLogic(globusConn, userProfile);
	  		   /*NET-2962 Проверка что код регистратора есть в СКТ "Глобус"*/
	  		   boolean isExist = globusLogic.checkExist(object.reg_id);
	  		   if(!isExist)
	  			   throw new EnergyproSystemException("Не знайдено реєстратора з номером "+object.reg_id+" в СКТ \"Глобус\"");
	  	   }


	  	   TKTransportRealHistoryDAO trhDAO = new TKTransportRealHistoryDAO(connection,userProfile);

	  	   if(object.parentRef.code == Integer.MIN_VALUE)
	  	   {
	  		   /* Присвоим парентовский код если уже были записи */
	  		   TKTransportRealHistoryFilter trhFilter = new TKTransportRealHistoryFilter();
	  		   trhFilter.transportRealRef.code = object.transportRealRef.code;
	  		   String condition = " select " +
	  		   							" tktransportrealhistory.code " +
	  		   							" from tktransportrealhistory " +
	  		   							" where " +
	  		   							" tktransportrealhistory.transportrealrefcode = " + object.transportRealRef.code +
	  		   							" and tktransportrealhistory.code not in ( select distinct tktransportrealhistory.parentrefcode from tktransportrealhistory where parentrefcode is not null) " +
	  		   							" order by datestart desc limit 1 ";
	  		   trhFilter.conditionSQL = "TKTRANSPORTREALHISTORY.CODE IN (" + condition + ")";
	  		   TKTransportRealHistoryShortList trhList = trhDAO.getScrollableFilteredList(trhFilter, 0, -1);

	  		   if(trhList.totalCount > 1)
	  			   throw new EnergyproSystemException("Помилка у кількості батьківських записів");

	  		   if(trhList.totalCount == 1)
	  		   {
	  			  object.parentRef.code = trhList.get(0).code;

	  			  if(trhList.get(0).dateFinal != null)
	  			  {
	  				  object.dateStart = trhList.get(0).dateFinal;

	  				  Calendar calendar = Calendar.getInstance();
	  				  calendar.setTime(trhList.get(0).dateFinal);
	  				  calendar.add(Calendar.DATE, 1);
	  				  calendar.clear(Calendar.MILLISECOND);
	  				  calendar.clear(Calendar.HOUR);
	  				  calendar.clear(Calendar.HOUR_OF_DAY);
	  				  calendar.clear(Calendar.MINUTE);

	  				  object.dateStart = calendar.getTime();
	  			  }
	  			  else
	  			  	{
	  				  if(object.dateStart == null)
	  				  {
	  					  object.dateStart = Tools.clearTimeOfDate(new Date());
	  				  }


	  					  TKTransportRealHistory trhParentObj = trhDAO.getObject(trhList.get(0).code);

	  					  if(object.dateStart.compareTo(trhParentObj.dateStart) == 0 || object.dateStart.compareTo(trhParentObj.dateStart) == -1)
	  					  {
	  						  /*Поменяем дату начала вводимой записи на день вперед,
	  						   * если она равна дате начала предыдущей - актуально, когда
	  						   * производится попытка вставлять несколько записей в один день*/
	  						  Calendar calendar = Calendar.getInstance();
	  						  calendar.setTime(trhParentObj.dateStart);
	  						  calendar.add(Calendar.DATE, 1);
	  						  calendar.clear(Calendar.MILLISECOND);
	  						  calendar.clear(Calendar.HOUR);
	  						  calendar.clear(Calendar.HOUR_OF_DAY);
	  						  calendar.clear(Calendar.MINUTE);

	  						  object.dateStart = calendar.getTime();
	  					  }


	  					  Calendar calendar = Calendar.getInstance();
	  					  calendar.setTime(object.dateStart);
	  					  calendar.add(Calendar.DATE, -1);
	  					  calendar.clear(Calendar.MILLISECOND);
	  					  calendar.clear(Calendar.HOUR);
	  					  calendar.clear(Calendar.HOUR_OF_DAY);
	  					  calendar.clear(Calendar.MINUTE);

	  					  trhParentObj.dateFinal = calendar.getTime();
	  					  trhDAO.save(trhParentObj);
	  			  	}
	  		   }
	  	   }
	  	   else throw new EnergyproSystemException("Error in attribute parentRef.code -- must be null");

	  	   /*Проверка - нельзя добавить историю с датчиком GPS если уже на этот период он стоял у другой машины*/
	  	   checkReg_id(object);

	  	   return trhDAO.add(object);
	      }
	     catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	     finally {
				try {
					if (globusConn != null && !globusConn.isClosed()) {
						globusConn.close();
						globusConn = null;
					}
				} catch (SQLException e) {
				}
			} 
	  } 


	  public void saveTransportHistory(TKTransportRealHistory object) 
	    {
	     try
	      {
	  	   TKTransportRealHistoryDAO trhDAO = new TKTransportRealHistoryDAO(connection,userProfile);

	  	   TKTransportRealHistory trhOldObj = trhDAO.getObject(object.code);
	  	   TKTransportRealHistory trhParentObj = null;
	  	   if(object.parentRef.code != Integer.MIN_VALUE)
	  		   trhParentObj = trhDAO.getObject(object.parentRef.code);

	  	   checkReg_id(object); // Проверка доступности номер регистратора GPS на заданные сроки


	  	   /*Если меняется дата начала, то изменяется дата конца родительской записи*/

	  	   if(object.dateStart.compareTo(trhOldObj.dateStart) != 0)
	  	   {
	  		   if(trhParentObj != null)
	  		   {
	  				  Calendar calendar = Calendar.getInstance();
	  				  calendar.setTime(object.dateStart);
	  				  calendar.add(Calendar.DATE, -1);
	  				  calendar.clear(Calendar.MILLISECOND);
	  				  calendar.clear(Calendar.HOUR);
	  				  calendar.clear(Calendar.HOUR_OF_DAY);
	  				  calendar.clear(Calendar.MINUTE);

	  				  trhParentObj.dateFinal = calendar.getTime();

	  			   if(trhParentObj.dateStart.after(trhParentObj.dateFinal))
	  				   throw new EnergyproSystemException("Дати повинні бути в хронологічній послідовності");

	  			 trhDAO.save(trhParentObj);
	  		   }
	  	   }

	  	   /*Запрет на изменение чего-либо кроме даты*/
	  	   if((trhOldObj.finMolCode.compareTo(object.finMolCode) != 0) ||
	  			   (trhOldObj.transportdepartmentRef.code != object.transportdepartmentRef.code) ||
	  			   (trhOldObj.departmentRef.code != object.departmentRef.code))
	  		   throw new EnergyproSystemException("Змінюйте тільки дату");

	  	   /*Запрет на изменение записей если они уже являются parent'ами для других записей*/
	  	   TKTransportRealHistoryFilter trhFilter = new TKTransportRealHistoryFilter();
	  	   trhFilter.parentRef.code = object.code;
	  	   int[] trhCodes = trhDAO.getFilteredCodeArray(trhFilter, 0, -1);
	  	   if(trhCodes.length > 0)
	  	   {
	  		   TKTransportRealDAO trDAO = new TKTransportRealDAO(connection,userProfile);
	  		   throw new EnergyproSystemException("По транспорту "+trDAO.getObject(object.transportRealRef.code).buhName + " вже були подальші зміни МОЛ або підрозділів");
	  	   }

	  	   /*Проверка - даты в хронологической последовательности*/
	  	   if(object.dateFinal != null)
	  	   {
	  		   if(object.dateStart.after(object.dateFinal))
	  			   throw new EnergyproSystemException("Дати повинні бути в хронологічній послідовності");
	  	   }


	  	  trhDAO.save(object);
	      }
	     catch (PersistenceException e)       {
	    	 throw new EnergyproSystemException(e.getMessage(),e);
	    	 }
	    }


	
	/**
	   * 
	   * Возвращает актуальную историю на заданную дату
	   * 
	   * @param transportRealCode код реального транспорта
	   * @param date заданнаая дата
	   * @return <b>TKTransportRealHistory</b> актуальная историю на заданную дату
	   * @throws PersistenceException
	   */
	  public TKTransportRealHistory getHistory(int transportRealCode, Date date) throws PersistenceException
	  {
			  	
		        TKTransportRealHistoryDAO  trhDAO = new TKTransportRealHistoryDAO(connection,userProfile);
		        TKTransportRealHistoryFilter trhFilter = new TKTransportRealHistoryFilter();
			  	trhFilter.transportRealRef.code = transportRealCode;
			  	String condition = " SELECT TKTRANSPORTREALHISTORY.CODE FROM TKTRANSPORTREALHISTORY " +
			  		" WHERE TKTRANSPORTREALHISTORY.dateStart <=  '" +new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND COALESCE(TKTRANSPORTREALHISTORY.dateFinal,to_date('31.12.9999', 'dd.mm.yyyy')) >= '" + new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND tktransportrealhistory.transportrealrefcode = " + transportRealCode;
			  	
			  	trhFilter.conditionSQL = "TKTRANSPORTREALHISTORY.CODE IN (" + condition + ")";
			  	

			  	TKTransportRealHistoryShortList trhList = trhDAO.getScrollableFilteredList(trhFilter, 0, -1);
		   
			  	if(trhList.totalCount != 1)
			  		throw new EnergyproSystemException("Помилка у кількості записів по транспорту з кодом - " + transportRealCode);
		   
			  	TKTransportRealHistory obj = null;
		   
			  	if(trhList.totalCount == 1)
			  	{
			  		obj = trhDAO.getObject(trhList.get(0).code);
			  	}
		   
			  	return obj;
	  }
	  
	  /**
	   * 
	   * Возвращает был ли установлен GPS датчик на заданную дату
	   * 
	   * @param transportRealCode код реального транспорта
	   * @param date заданнаая дата
	   * @return <b>true </b> - установлен
	   * 		 <b>false </b> - не установлен
	   * @throws PersistenceException
	   */
	  public boolean isGPS(int transportRealCode, Date date) throws PersistenceException
	  {
		  TKTransportRealHistory trObj = getHistory(transportRealCode, date);
		  
		  boolean result = false;
		  
		  if(trObj != null)
			  if(trObj.reg_id != Integer.MIN_VALUE)
				  result = true;
		  
		  return result;
	  }
	  
	  
	  /**
	   * 
	   * Проверка доступности номера регистратора на заданный период истории
	   * 
	   * @param object сохраняемый объект TKTransportRealHistory
	   * @throws PersistenceException
	   */
	  public void checkReg_id(TKTransportRealHistory object) throws PersistenceException
	  {
		  TKTransportRealHistoryDAO  trhDAO = new TKTransportRealHistoryDAO(connection,userProfile); 
		  if(object.reg_id != Integer.MIN_VALUE)
		   {
			   /*Проверка - нельзя добавить историю с датчиком GPS если уже на этот период он стоял у другой машины*/
			   String condition = "select re.code From tktransportrealhistory as re " +
				   				" where ((re.datestart >= ? and coalesce(re.datefinal, to_date('31.12.9999','dd.mm.yyyy')) <= coalesce(?,to_date('31.12.9999','dd.mm.yyyy'))) " +
				   				" or (? >= re.datestart and coalesce(?,to_date('31.12.9999','dd.mm.yyyy')) <= coalesce(re.datefinal, to_date('31.12.9999','dd.mm.yyyy'))) " +
				   				" or (re.datestart between ? and coalesce(?,to_date('31.12.9999','dd.mm.yyyy'))) " +
				   				" or (coalesce(re.datefinal, to_date('31.12.9999','dd.mm.yyyy')) between ? and coalesce(?,to_date('31.12.9999','dd.mm.yyyy')))) ";
			   
			   if(object.code != Integer.MIN_VALUE)
				   condition = condition + " and re.code <> " + object.code;
			   
			   if(object.transportRealRef.code != Integer.MIN_VALUE)
				   condition = condition + " and re.transportrealrefcode <> " + object.transportRealRef.code;
			   
			   TKTransportRealHistoryFilter reg_idFilter = new TKTransportRealHistoryFilter();
			   reg_idFilter.reg_id = object.reg_id;
			   reg_idFilter.conditionSQL = TKTransportRealHistory.code_QFielld + " IN (" + condition + ")";
			   
			   Vector bindObjects = new Vector();
			   bindObjects.add(object.dateStart);
			   bindObjects.add(object.dateFinal);
			   bindObjects.add(object.dateStart);
			   bindObjects.add(object.dateFinal);
			   bindObjects.add(object.dateStart);
			   bindObjects.add(object.dateFinal);
			   bindObjects.add(object.dateStart);
			   bindObjects.add(object.dateFinal);

			   int[] reg_idCodes = trhDAO.getFilteredCodeArray(reg_idFilter, reg_idFilter.conditionSQL, "", 0, -1, bindObjects);
			   
			   if(reg_idCodes.length > 0)
			   {
				   TKTransportRealHistoryShort trhShort = trhDAO.getShortObject(reg_idCodes[0]);
				   throw new EnergyproSystemException("Номер реєстратора " + object.reg_id + " вже встановлений на цей період. " + ((trhShort != null) ? "Транспорт: " +trhShort.transportRealRefBuhName+" № "+trhShort.transportRealRefGosNumber : ""));
			   }
		   }
	  }
	  
	  
	  public void useChangeByFuelCard(ENFuelCard fuelCardObj ) 
	  {
			Connection globusConn = null;
			Connection authConn = null;
			  try { 
				
		  authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
		  
		  ENFuelCardHistoryDAO fcHistDAO = new ENFuelCardHistoryDAO(connection,userProfile);
		  
		  ENFuelCardHistoryFilter fcFil = new ENFuelCardHistoryFilter();
		  fcFil.fuelCard.code = fuelCardObj.code;
			/*
			 * fcFil.conditionSQL = " enfuelcardhistory.datefinal >= " + "'" + new
			 * SimpleDateFormat("dd.MM.yyyy").format(fuelCardObj.dateApply).toString() +"'"
			 * + " or  enfuelcardhistory.datestart <= " + "'" + new
			 * SimpleDateFormat("dd.MM.yyyy").format(fuelCardObj.dateApply).toString() +"'"
			 * ;
			 */
		  fcFil.conditionSQL =  "(('"+ new SimpleDateFormat("dd.MM.yyyy").format(fuelCardObj.dateApply).toString() + "'" 
				   + " between enfuelcardhistory.datestart and enfuelcardhistory.datefinal  ) or (  enfuelcardhistory.datestart >=  " +
				  "'" + new SimpleDateFormat("dd.MM.yyyy").format(fuelCardObj.dateApply).toString() +"'" +") )  ";
		  
		  ENFuelCardHistoryShortList list = fcHistDAO.getScrollableFilteredList(fcFil, 0, -1);
		  if (list.totalCount > 0) {
			  throw new SystemException(" \"Дата застосування змін\" повинна бути бульше ніж дати попередніх періодів " );
		  }
		    
		  if(fuelCardObj.dateApply != null ) {
			  ENFuelCardHistory fcCurrHist = getFuelCardHistory(fuelCardObj.code, fuelCardObj.dateApply);
			
			  if (fcCurrHist != null) {
			    // сохраним строчку текущей истории
				Calendar calendarFinal = Calendar.getInstance();
				calendarFinal.setTime(fuelCardObj.dateApply);
				calendarFinal.add(Calendar.DATE, -1);
				calendarFinal.clear(Calendar.MILLISECOND);
				calendarFinal.clear(Calendar.HOUR);
				calendarFinal.clear(Calendar.HOUR_OF_DAY);
				calendarFinal.clear(Calendar.MINUTE);
					
				fcCurrHist.dateFinal = calendarFinal.getTime();
				fcHistDAO.save(fcCurrHist);
			  } 	 
				 
				 // вставим новую строчку истории установки трекера
				 ENFuelCardHistory fcHist = new ENFuelCardHistory();			  
				 fcHist.dateStart = fuelCardObj.dateApply;
				 fcHist.fuelType.code = fuelCardObj.fuelType.code;
				 fcHist.reg_id = fuelCardObj.reg_id;
				 fcHist.fuelCard.code = fuelCardObj.code;
				 fcHist.finWorker.code = fuelCardObj.finWorker.code;
				 fcHist.dateEdit = new Date();
				 fcHist.userGen = userProfile.getUserName();
				  
				 fcHistDAO.add(fcHist);
			  
		  }
		  
		 
		 
		 
		 }	catch (PersistenceException e)  {
				throw new EnergyproSystemException(e.getMessage(),e);} 
			catch (DatasourceConnectException e) {
			 throw new EnergyproSystemException(e.getMessage(),e);
			} finally {
					try {
						if (globusConn != null && !globusConn.isClosed()) {
							globusConn.close();
							globusConn = null;
						}
					} catch (SQLException e) {
					}
					try {
						if (authConn != null && !authConn.isClosed()) {
							authConn.close();
							authConn = null;
						}
					} catch (SQLException e) {
					}
				}
	  }
	  
	  
	  public void installGPS(int gpsTrackerCode,int transportRealCode, Date date) 
	  {
			Connection globusConn = null;
			Connection authConn = null;
			  try { 
				
			  globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
			  GlobusLogic globusLogic = new GlobusLogic(globusConn, userProfile);
			  authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
			  
		  TKTransportRealHistory trHistoryObj = getHistory(transportRealCode, date);
		  
		  ENGPSTrackerHistory gtCurrHist = getTrackerHistory(gpsTrackerCode, date);
		  ENGPSTrackerDAO trackerDAO = new ENGPSTrackerDAO(connection,userProfile);
		  ENGPSTrackerHistoryDAO trackerHistDAO = new ENGPSTrackerHistoryDAO(connection,userProfile);
		  ENGPSTracker trackerToInstall = trackerDAO.getObject(gpsTrackerCode); 
		  
		  ENGPSTrackerFilter trackerToUnInstallFilter = new ENGPSTrackerFilter();
		  trackerToUnInstallFilter.realTransport.code = transportRealCode;
		  ENGPSTrackerShortList trackerToUnInstallList = trackerDAO.getScrollableFilteredList(trackerToUnInstallFilter, 0, -1);
		  if (trackerToUnInstallList.totalCount > 0) {
			  if (trackerToUnInstallList.totalCount > 1) {
				  throw new SystemException("Трекер установлен больше чем на одном транспортном средстве!");
			  }
			  
			  unInstallGPS(trackerToUnInstallList.get(0).code , Tools.addDays(date, -1));
		  }
		    
		 
		  TKTransportReal trObj = getTransportReal(transportRealCode);
		  
		  if(trObj != null)
			  if(trObj.reg_id != Integer.MIN_VALUE) {
				  if (new String(""+trObj.reg_id).compareTo(trackerToInstall.reg_id) == 0) {
					  throw new SystemException("На обраному транспорті вже встановлено цей пристрій!");
				  }
			  }
 
		  
		  if(trHistoryObj != null)
			  if(trHistoryObj.reg_id != Integer.MIN_VALUE) {
				  if (new String(""+trHistoryObj.reg_id).compareTo(trackerToInstall.reg_id) == 0) {
					  throw new SystemException("На обраному транспорті вже встановлено цей пристрій!");
				  }
			  }
		  
		 if (trackerToInstall.realTransport.code == transportRealCode) {
			 throw new SystemException("На обраному транспорті вже встановлено цей пристрій!");
		 }

		 // сохраним информацию на трекере
		 trackerToInstall.realTransport.code = transportRealCode;
		 trackerDAO.save(trackerToInstall);
		 
		 // сохраним строчку текущей истории
			Calendar calendarFinal = Calendar.getInstance();
			calendarFinal.setTime(date);
			calendarFinal.add(Calendar.DATE, -1);
			calendarFinal.clear(Calendar.MILLISECOND);
			calendarFinal.clear(Calendar.HOUR);
			calendarFinal.clear(Calendar.HOUR_OF_DAY);
			calendarFinal.clear(Calendar.MINUTE);
			
		 gtCurrHist.dateFinal = calendarFinal.getTime();
		 trackerHistDAO.save(gtCurrHist);
		 
		 // вставим новую строчку истории установки трекера
		 ENGPSTrackerHistory gtHist = new ENGPSTrackerHistory();			  
		 gtHist.dateStart = date;
		 gtHist.cardNumber = gtCurrHist.cardNumber;
		 gtHist.phoneNumber = gtCurrHist.phoneNumber;
		 gtHist.reg_id = gtCurrHist.reg_id;
		 gtHist.gpsTracker.code = gtCurrHist.gpsTracker.code;
		 gtHist.realTransport.code = transportRealCode;
		 trackerHistDAO.add(gtHist);
		 
		 // засетим в транспорт новый трекер
		 trObj.reg_id = new Integer(trackerToInstall.reg_id);
		 saveTransportReal(trObj);
		  
		 // поставим в истории машины дату установки трекера 
		 Date maxDate = new Date();
		 maxDate = (maxDate.compareTo(date) < 0) ? date : maxDate;
		 TKTransportRealHistory trHistoryNextObj = getHistory(trObj.code, maxDate);
		 trHistoryNextObj.dateStart = date;
		 saveTransportHistory(trHistoryNextObj);
		  
		 // проапдейтим трекер в глобусе
		 ENTransportDepartment dep = new ENTransportDepartmentDAO(connection,userProfile).getObject(trObj.transportdepartmentRef.code);
		 globusLogic.renameVehicle(new Integer(trackerToInstall.reg_id), 
				                          trObj.buhName + " " + trObj.gosNumber);
		 globusLogic.moveToFolder(new Integer(trackerToInstall.reg_id), dep.name);
		 
		 User2StaffingDAO u2sDAO = new User2StaffingDAO(authConn, userProfile);
		 User2StaffingFilter u2sFilter = new User2StaffingFilter();
		 u2sFilter.conditionSQL = " user_code in (select td2u.usercode from " +
				                  " entransportdep2user td2u " +
				                  " where td2u.transportdepartmentcod = " + dep.code + ")";
		 User2StaffingShortList u2sList = u2sDAO.getScrollableFilteredList(u2sFilter,0,-1);
		 Vector<String> userNames = new Vector<String>();
		 if (u2sList.totalCount > 0) {
			 for(User2StaffingShort item : u2sList.list) {
				 userNames.add(item.userName);
			 }
		 }
		 Vector<Integer> reg_ids = new Vector<Integer>();
		 reg_ids.add(new Integer(trackerToInstall.reg_id));
		 
		 globusLogic.allowDeviceForUser(userNames, reg_ids);
		 
		 }	catch (PersistenceException e)  {
				throw new EnergyproSystemException(e.getMessage(),e);} 
			catch (DatasourceConnectException e) {
			 throw new EnergyproSystemException(e.getMessage(),e);
			} finally {
					try {
						if (globusConn != null && !globusConn.isClosed()) {
							globusConn.close();
							globusConn = null;
						}
					} catch (SQLException e) {
					}
					try {
						if (authConn != null && !authConn.isClosed()) {
							authConn.close();
							authConn = null;
						}
					} catch (SQLException e) {
					}
				}
	  }
	  
	  
	  public void unInstallGPS(int gpsTrackerCode, Date date) 
	  {
			Connection globusConn = null;
			Connection authConn = null;
			  try { 
				
			  globusConn = getConnection(AuthorizationJNDINames.GLOBUS_DATASOURCE);
			  GlobusLogic globusLogic = new GlobusLogic(globusConn, userProfile);
			  authConn = getConnection(AuthorizationJNDINames.AUTHORIZATION_DATASOURCE);
		
		  ENGPSTrackerDAO trackerDAO = new ENGPSTrackerDAO(connection,userProfile);
		  ENGPSTrackerHistoryDAO trackerHistDAO = new ENGPSTrackerHistoryDAO(connection,userProfile);
		  ENGPSTracker trackerToUnInstall = trackerDAO.getObject(gpsTrackerCode); 
		  
		  if (trackerToUnInstall.realTransport == null ||
				  trackerToUnInstall.realTransport.code == Integer.MIN_VALUE) {
			  throw new SystemException("Трекер демонтований, проведення зняття неможливе!");
		  }
		  
          TKTransportReal trObj = getTransportReal(trackerToUnInstall.realTransport.code);
		  
		  ENGPSTrackerHistory gtCurrHist = getTrackerHistory(gpsTrackerCode, date);
		    
		  
		 // сохраним информацию по снятию на трекере
		 trackerToUnInstall.realTransport.code = Integer.MIN_VALUE;
		 trackerDAO.save(trackerToUnInstall);
		 
		 // сохраним строчку текущей истории
		 Calendar calendarFinal = Calendar.getInstance();
		 calendarFinal.setTime(date);
		 calendarFinal.add(Calendar.DATE, -1);
		 calendarFinal.clear(Calendar.MILLISECOND);
			calendarFinal.clear(Calendar.HOUR);
			calendarFinal.clear(Calendar.HOUR_OF_DAY);
			calendarFinal.clear(Calendar.MINUTE);
			
		 gtCurrHist.dateFinal = calendarFinal.getTime();
		 trackerHistDAO.save(gtCurrHist);
		 
		 // вставим новую строчку истории снятия трекера
		 ENGPSTrackerHistory gtHist = new ENGPSTrackerHistory();			
		 gtHist.dateStart = date;
		 gtHist.cardNumber = gtCurrHist.cardNumber;
		 gtHist.phoneNumber = gtCurrHist.phoneNumber;
		 gtHist.reg_id = gtCurrHist.reg_id;
		 gtHist.gpsTracker.code = gtCurrHist.gpsTracker.code;
		 gtHist.realTransport.code = Integer.MIN_VALUE;
		 trackerHistDAO.add(gtHist);
		 
		 // засетим в транспорт снятие трекера
		 trObj.reg_id = Integer.MIN_VALUE;
		 saveTransportReal(trObj);
		  
		 // поставим в истории машины дату снятия трекера 
		 Date maxDate = new Date();
		 maxDate = (maxDate.compareTo(date) < 0) ? date : maxDate;
		 TKTransportRealHistory trHistoryNextObj = getHistory(trObj.code, maxDate);
		 trHistoryNextObj.dateStart = date;
		 saveTransportHistory(trHistoryNextObj);
		  
		 // проапдейтим трекер в глобусе
		 ENTransportDepartment dep = new ENTransportDepartmentDAO(connection,userProfile).getObject(trObj.transportdepartmentRef.code);
		 globusLogic.renameVehicle(new Integer(trackerToUnInstall.reg_id), 
				                          "Демонтировано");
		 globusLogic.moveToFolder(new Integer(trackerToUnInstall.reg_id), "Демонтированные устройства");
		 
		 User2StaffingDAO u2sDAO = new User2StaffingDAO(authConn, userProfile);
		 User2StaffingFilter u2sFilter = new User2StaffingFilter();
		 u2sFilter.conditionSQL = " user_code in (select td2u.usercode from " +
				                  " entransportdep2user td2u " +
				                  " where td2u.transportdepartmentcod = " + dep.code + ")";
		 User2StaffingShortList u2sList = u2sDAO.getScrollableFilteredList(u2sFilter,0,-1);
		 Vector<String> userNames = new Vector<String>();
		 if (u2sList.totalCount > 0) {
			 for(User2StaffingShort item : u2sList.list) {
				 userNames.add(item.userName);
			 }
		 }
		 Vector<Integer> reg_ids = new Vector<Integer>();
		 reg_ids.add(new Integer(trackerToUnInstall.reg_id));
		 globusLogic.revokeDeviceForUser(userNames, reg_ids);
		 
		 }	catch (PersistenceException e)  {
				throw new EnergyproSystemException(e.getMessage(),e);} 
			catch (DatasourceConnectException e) {
			 throw new EnergyproSystemException(e.getMessage(),e);
			} finally {
					try {
						if (globusConn != null && !globusConn.isClosed()) {
							globusConn.close();
							globusConn = null;
						}
					} catch (SQLException e) {
					}
					try {
						if (authConn != null && !authConn.isClosed()) {
							authConn.close();
							authConn = null;
						}
					} catch (SQLException e) {
					}
				} 
	  } 
	  
	  /**
	   * 
	   * Возвращает актуальную историю по трекеру на заданную дату
	   * 
	   * @param gpsTrackerCode код ENGPSTracker
	   * @param date заданнаая дата
	   * @return <b>ENGPSTrackerHistory</b> актуальная история по трекеру на заданную дату
	   * @throws PersistenceException
	   */
	  public ENGPSTrackerHistory getTrackerHistory(int gpsTrackerCode, Date date) throws PersistenceException
	  {
			  	
		        ENGPSTrackerHistoryDAO  gtHistDAO = new ENGPSTrackerHistoryDAO(connection,userProfile);
		        ENGPSTrackerHistoryFilter gtHistFilter = new ENGPSTrackerHistoryFilter();
		        gtHistFilter.gpsTracker.code = gpsTrackerCode;
			  	String condition = " SELECT ENGPSTRACKERHISTORY.CODE FROM ENGPSTRACKERHISTORY " +
			  		" WHERE ENGPSTRACKERHISTORY.dateStart <=  '" +new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND COALESCE(ENGPSTRACKERHISTORY.dateFinal,to_date('31.12.9999', 'dd.mm.yyyy')) >= '" + new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND ENGPSTRACKERHISTORY.gpstrackercode = " + gpsTrackerCode;
			  	
			  	gtHistFilter.conditionSQL = "ENGPSTRACKERHISTORY.CODE IN (" + condition + ")";
			  	

			  	ENGPSTrackerHistoryShortList gtHistList = gtHistDAO.getScrollableFilteredList(gtHistFilter, 0, -1);
		   
			  	if(gtHistList.totalCount > 1)
			  		throw new EnergyproSystemException("Помилка у кількості записів");
		   
			  	ENGPSTrackerHistory obj = null;
		   
			  	if(gtHistList.totalCount == 1)
			  	{
			  		obj = gtHistDAO.getObject(gtHistList.get(0).code);
			  	}
		   
			  	return obj;
	  }
	  
	  /**
	   * 
	   * Возвращает актуальную историю по топливной карте на заданную дату
	   * 
	   * @param fuelCardeCode 
	   * @param date заданнаая дата
	   * @return <b>ENFuelCardHistory</b> актуальная история по топливной карте на заданную дату
	   * @throws PersistenceException
	   */
	  public ENFuelCardHistory getFuelCardHistory(int fuelCardeCode, Date date) throws PersistenceException
	  {
			  	
		        ENFuelCardHistoryDAO  fcHistDAO = new ENFuelCardHistoryDAO(connection , userProfile);
		        ENFuelCardHistoryFilter fcHistFiter = new ENFuelCardHistoryFilter();
		        fcHistFiter.fuelCard.code = fuelCardeCode;
			  	String condition = " SELECT enfuelcardhistory.CODE FROM enfuelcardhistory " +
			  		" WHERE enfuelcardhistory.dateStart <=  '" +new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND COALESCE(enfuelcardhistory.dateFinal,to_date('31.12.9999', 'dd.mm.yyyy')) >= '" + new SimpleDateFormat("dd.MM.yyyy").format(date).toString()+"'"+
			  		" AND enfuelcardhistory.fuelcardcode = " + fuelCardeCode;
			  	
			  	fcHistFiter.conditionSQL = "enfuelcardhistory.CODE IN (" + condition + ")";
			  	

			  	ENFuelCardHistoryShortList fcHistList = fcHistDAO.getScrollableFilteredList(fcHistFiter, 0, -1);
		   
			  	if(fcHistList.totalCount > 1)
			  		throw new EnergyproSystemException("Помилка у кількості записів");
		   
			  	ENFuelCardHistory obj = null;
		   
			  	if(fcHistList.totalCount == 1)
			  	{
			  		obj = fcHistDAO.getObject(fcHistList.get(0).code);
			  	}
		   
			  	return obj;
	  }
	  
	  /**
	   * 
	   * Возвращает транспортРиал по коду
	   * 
	   * @param transportRealCode код TKTransportReal
	   * @return <b>TKTransportReal</b> 
	   * @throws PersistenceException
	   */
	  public TKTransportReal getTransportReal(int transportRealCode) throws PersistenceException
	  {
			  	
		        TKTransportRealDAO  trDAO = new TKTransportRealDAO(connection,userProfile);
		        return  trDAO.getObject(transportRealCode);
		   
	  }
	  
	  
	  /* Выстроить предварительный порядок строк для фактических строк путевого*/
	  public void setOrder(int travelSheetCode) throws PersistenceException 
	   {
	    	ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(userProfile,connection);
	    	
	    	TravelSheetLogic l = new TravelSheetLogic(connection,userProfile);
	    	
	    	ENTravelSheet ts = l.getTravelSheetByCode(travelSheetCode);
	        
	        if (ts.statusRef.code > ENTravelSheetStatus.FACT) {
	        	throw new SystemException("Подорожній лист вже розраховано або закрито!");
	        } 
		    
	        ENTravelSheetItemFilter orderedItemFilter = new ENTravelSheetItemFilter();
	        orderedItemFilter.travelSheetRef.code = ts.code;
	        orderedItemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
	        orderedItemFilter.conditionSQL = " entravelsheetitem.STATUSREFCODE <> " + ENTravelSheetItemStatus.DELETED + 
	        		                         " and entravelsheetitem.travelorder is not null" + 
	        		                         " and coalesce(entravelsheetitem.commentgen,'') <> 'сумісна доставка'"; 
	        ENTravelSheetItemShortList orderedItems = itemDAO.getScrollableFilteredList(orderedItemFilter, 0, -1);
	        if (orderedItems.totalCount > 0) {
	        	
		        for (int i=0;i<orderedItems.totalCount;i++) {
		        	ENTravelSheetItem item = itemDAO.getObject(orderedItems.get(i).code); 
		        	item.travelOrder = Integer.MIN_VALUE;
		        	item.speedometerStart = null;
		        	item.speedometerFinal = null;
		        	item.fuelCounterStart = null;
		        	item.fuelCounterFinal = null;
		        	item.timeStart = null;
		        	item.timeFinal = null;
		        	item.statusRef.code = ENTravelSheetItemStatus.GOOD;
		        	itemDAO.save(item);
		        }
	        }
	        
	        
	        ENTravelSheetItemFilter itemFilter = new ENTravelSheetItemFilter();
	        itemFilter.travelSheetRef.code = ts.code;
	        itemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
	        itemFilter.conditionSQL = " entravelsheetitem.STATUSREFCODE <> " + ENTravelSheetItemStatus.DELETED + 
	        		                  " and coalesce(entravelsheetitem.commentgen,'') <> 'сумісна доставка'";
	        itemFilter.orderBySQL = "tsi2.TIMESTART";
	        ENTravelSheetItemShortList items = itemDAO.getScrollableFilteredList(itemFilter, 0, -1);
	        
	        for (int i=0;i<items.totalCount;i++) {
	        	ENTravelSheetItem item = itemDAO.getObject(items.get(i).code); 
	        	item.travelOrder = i+1;
	        	itemDAO.save(item);
	        }

	  //  	ENTravelSheetItem item = itemDAO.getObject(code);
	  //  	l.removeItem(code, false);
	  	//    l.removeGSMByTransportItemCode(t.code);
	    	
	   // 	l.changeStatusTravelSheet(item.travelSheetRef.code);
	   
	   
	   }
	  
	  
	  /* Поменять порядок строк для фактических строк путевого*/
	  public void changeOrder(int travelSheetItemCode, int travelOrder) throws PersistenceException 
	   {
	    	ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(userProfile,connection);
	    	ENTravelSheetItem itemForChangeOrder = itemDAO.getObject(travelSheetItemCode);
	    	ENTravelSheetItem contiguousItem = getСontiguousItem(travelSheetItemCode, travelOrder);
	    	
	    	TravelSheetLogic l = new TravelSheetLogic(connection,userProfile);
	    	
	    	ENTravelSheet ts = l.getTravelSheetByCode(itemForChangeOrder.travelSheetRef.code);
	        
	        if (ts.statusRef.code > ENTravelSheetStatus.FACT) {
	        	throw new SystemException("Подорожній лист вже розраховано або закрито!");
	        } 
		    
	        ENTravelSheetItemFilter orderedItemFilter = new ENTravelSheetItemFilter();
	        orderedItemFilter.travelSheetRef.code = ts.code;
	        orderedItemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
	        orderedItemFilter.conditionSQL = " entravelsheetitem.STATUSREFCODE <> " + ENTravelSheetItemStatus.DELETED + 
	        		                         " and entravelsheetitem.travelorder is not null" + 
	        		                         " and coalesce(entravelsheetitem.commentgen,'') <> 'сумісна доставка'"; 
	        ENTravelSheetItemShortList orderedItems = itemDAO.getScrollableFilteredList(orderedItemFilter, 0, -1);
	        if (orderedItems.totalCount > 0) {
	        	
		        for (int i=0;i<orderedItems.totalCount;i++) {
		        	ENTravelSheetItem item = itemDAO.getObject(orderedItems.get(i).code); 
		        	if (item.code == itemForChangeOrder.code) {
			        	item.travelOrder = contiguousItem.travelOrder;
		        	};
		        	if (item.code == contiguousItem.code) {
			        	item.travelOrder = itemForChangeOrder.travelOrder;
		        	}; 
		        	item.speedometerStart = null;
		        	item.speedometerFinal = null;
		        	item.fuelCounterStart = null;
		        	item.fuelCounterFinal = null;
		        	item.timeStart = null;
		        	item.timeFinal = null;
		        	item.statusRef.code = ENTravelSheetItemStatus.GOOD;
		        	itemDAO.save(item);
		        }
	        }
	   
	   }
	  
	  /* Взять строку смежную с изменяемой, в порядке следования путевого*/
	  public ENTravelSheetItem getСontiguousItem(int travelSheetItemCode, int travelOrder) throws PersistenceException 
	   {
	    	ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(userProfile,connection);
	    	ENTravelSheetItem itemForChangeOrder = itemDAO.getObject(travelSheetItemCode);
	        
	        ENTravelSheetItemFilter сontiguousItemFilter = new ENTravelSheetItemFilter();
	        сontiguousItemFilter.travelSheetRef.code = itemForChangeOrder.travelSheetRef.code;
	        сontiguousItemFilter.kindRef.code = ENTravelSheetItemKind.FACT;
	        сontiguousItemFilter.travelOrder = travelOrder;
	        ENTravelSheetItemShortList сontiguousItemList = itemDAO.getScrollableFilteredList(сontiguousItemFilter, 0, -1);
	        
	        if (сontiguousItemList.totalCount == 1) {
	        return	itemDAO.getObject(сontiguousItemList.get(0).code);	
	        }
			
	        return null;
	        
	   }
	  
		 public BigDecimal getMachineHoursByTravelSheetItem(int travelSheetItem) throws PersistenceException
		  {
			 BigDecimal out = new BigDecimal(0);
			 ENTransportItemDAO tiDAO = new ENTransportItemDAO(connection, userProfile);
			 ENTransportItemFilter tiFilter = new ENTransportItemFilter();
			 tiFilter.conditionSQL = " entransportitem.code in ( " +
             " select trav2ti.transportitemrefcode from entravlshttm2trnsprttm trav2ti, entransportitem ti " +
             " where trav2ti.transportitemrefcode = ti.code " +
             " and ti.tktransporttypecode not in (1, 75000009, 75000005, 75000008, 75000000, 75000010, 75000003) " +
             " and trav2ti.travelsheetitemrefcode = " + travelSheetItem + ")";
			 ENTransportItemShortList tiList = tiDAO.getScrollableFilteredList(tiFilter, 0, -1);
			 if (tiList.totalCount == 0)
			 {return out;}

			 for (int t=0; t<tiList.totalCount;t++) {
				 out = out.add(tiList.get(t).countWorkFact);
			 }
			 return out;
			 
		  }
	  
}
