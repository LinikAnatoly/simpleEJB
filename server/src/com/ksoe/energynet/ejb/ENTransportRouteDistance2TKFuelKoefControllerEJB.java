
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTransportRouteDistance2TKFuelKoef;  
  * 	
  */



import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDistance2TKFuelKoefDAO;
import com.ksoe.energynet.dataminer.ENTransportRouteDistanceDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENTransportRouteDistance2TKFuelKoefControllerEJBGen;
//import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;
//import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;
//import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistance2TKFuelKoefShortList;
//import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.ENTransportRouteDistance;
import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistance2TKFuelKoefShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKFuelKoefDAO;
import com.ksoe.techcard.valueobject.TKFuelKoef;
import com.ksoe.techcard.valueobject.TKFuelKoefType;

public class ENTransportRouteDistance2TKFuelKoefControllerEJB extends ENTransportRouteDistance2TKFuelKoefControllerEJBGen
 {

  public ENTransportRouteDistance2TKFuelKoefControllerEJB() {}

  
  public int add(ENTransportRouteDistance2TKFuelKoef object)
  {
	  try
	  {
		  ENTransportRouteDistance2TKFuelKoefDAO objDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  TKFuelKoefDAO fkDAO = new TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
		  TKFuelKoef fkObj = fkDAO.getObject(object.tkFuelKoefRef.code);
		  

	  
		  if(object.transportRouteDistanceRef == null)
			  throw new EnergyproSystemException("Error in ENTransportRouteDistance.code");
		  else
			  if(object.transportRouteDistanceRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTransportRouteDistance.code");
	  
		  /*Проверка для этой строки - этот коэффициент является уникальным*/
		  ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		  trd2fkFilter.transportRouteDistanceRef.code = object.transportRouteDistanceRef.code;
		  trd2fkFilter.tkFuelKoefRef.code = object.tkFuelKoefRef.code;
		  ENTransportRouteDistance2TKFuelKoefShortList trd2fkList = objDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
		  if(trd2fkList.totalCount > 0)
		  		throw new EnergyproSystemException("Для цієї дистанції вже є коефіціент \"" + trd2fkList.get(0).tkFuelKoefRefName+"\"");
		  
		  /*Проверка - нельзя на одну строку добавить коэффициент работы в тяжелых и сверхтяжелых условиях*/
		  if(object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF__HEAVY || object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY)
		  {
			  String condition = "TKFUELKOEFREFCODE IN ("+TKFuelKoef.TKFUELKOEF__HEAVY+","+TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY+")";
			  trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
			  trd2fkFilter.transportRouteDistanceRef.code = object.transportRouteDistanceRef.code;
			  trd2fkFilter.conditionSQL = condition;
			  trd2fkList = objDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
			  if(trd2fkList.totalCount > 0)
				  throw new EnergyproSystemException("Для цієї дистанції вже є коефіціент \"" + trd2fkList.get(0).tkFuelKoefRefName+"\"");
		  }
		  
		  /*Проверка - нельзя выбирать коэффициенты с типом "для транспорта" */
		  if(fkObj.tkFuelKoefTypeRef.code != TKFuelKoefType.TRAVELSHEETITEM)
			  throw new EnergyproSystemException("Можна обирати тільки коєфіціенти з типом \"для строки подорожнього листа\"");
	  
		  int out = super.add(object);
	  
		  /*Сохранение строки дистанции */
		  ENTransportRouteDistanceDAO itemDistanceDAO = new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	  
		  ENTransportRouteDistance itemDistanceObj = itemDistanceDAO.getObject(object.transportRouteDistanceRef.code);
		  ENTransportRoute routeObj = routeDAO.getObject(itemDistanceObj.transportRouteRef.code);
		  itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
	  
		  itemDistanceDAO.save(itemDistanceObj);
		  
		  // Поиск строки путевого листа
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = routeObj.planRef.code;
		  ENTravelSheetItemShortList tsItemList = itemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("Помилка у кількості строк подорожнього листа");
		  
		  ENTravelSheetItem trItemObj = itemDAO.getObject(tsItemList.get(0).code);
		  
		  // Если строка путевого утвержденна - то выводится ошибка
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  trItemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = trItemObj.modify_time;
			  itemDAO.save(trItemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  itemDAO.updateModify_time(trItemObj.code, oldModify_time);
		  }
	  
	  return out;
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }
  
  public void save(ENTransportRouteDistance2TKFuelKoef object)
  {
	  try
	  {
		  ENTransportRouteDistance2TKFuelKoefDAO objDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  
		  if(object.transportRouteDistanceRef == null)
			  throw new EnergyproSystemException("Error in ENTransportRouteDistance.code");
		  else
			  if(object.transportRouteDistanceRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTransportRouteDistance.code");
		  
		  /*Проверка для этой строки - этот коэффициент является уникальным*/
		  ENTransportRouteDistance2TKFuelKoefFilter trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
		  trd2fkFilter.transportRouteDistanceRef.code = object.transportRouteDistanceRef.code;
		  trd2fkFilter.tkFuelKoefRef.code = object.tkFuelKoefRef.code;
		  trd2fkFilter.conditionSQL = ENTransportRouteDistance2TKFuelKoef.code_QFielld + " <> " + object.code;
		  ENTransportRouteDistance2TKFuelKoefShortList trd2fkList = objDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
		  if(trd2fkList.totalCount > 0)
			  	throw new EnergyproSystemException("Для цієї дистанції вже є коефіціент \"" + trd2fkList.get(0).tkFuelKoefRefName+"\"");
		  
		  if(object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF__HEAVY || object.tkFuelKoefRef.code == TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY)
		  {
			  String condition = "TKFUELKOEFREFCODE IN ("+TKFuelKoef.TKFUELKOEF__HEAVY+","+TKFuelKoef.TKFUELKOEF_EXTRA_HEAVY+") AND " +
			  	ENTransportRouteDistance2TKFuelKoef.code_QFielld + " <> " + object.code;
			  trd2fkFilter = new ENTransportRouteDistance2TKFuelKoefFilter();
			  trd2fkFilter.transportRouteDistanceRef.code = object.transportRouteDistanceRef.code;
			  trd2fkFilter.conditionSQL = condition;
			  trd2fkList = objDAO.getScrollableFilteredList(trd2fkFilter, 0, -1);
			  if(trd2fkList.totalCount > 0)
				  throw new EnergyproSystemException("Для цієї дистанції вже є коефіціент \"" + trd2fkList.get(0).tkFuelKoefRefName+"\"");
		  }


		  super.save(object);
		  
		  /*Сохранение строки дистанции */
		  ENTransportRouteDistanceDAO itemDistanceDAO = new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
		  ENTransportRouteDistance itemDistanceObj = itemDistanceDAO.getObject(object.transportRouteDistanceRef.code);
		  ENTransportRoute routeObj = routeDAO.getObject(itemDistanceObj.transportRouteRef.code);

		  itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
		  
		  itemDistanceDAO.save(itemDistanceObj);
		  
		  // Поиск строки путевого листа
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = routeObj.planRef.code;
		  ENTravelSheetItemShortList tsItemList = itemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("Помилка у кількості строк подорожнього листа");
		  
		  ENTravelSheetItem trItemObj = itemDAO.getObject(tsItemList.get(0).code);
		  
		  // Если строка путевого утвержденна - то выводится ошибка
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  trItemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = trItemObj.modify_time;
			  itemDAO.save(trItemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  itemDAO.updateModify_time(trItemObj.code, oldModify_time);
		  }

	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              {closeConnection();}
  }
  
  public void remove(int code)
  {
	  try
	  {
		ENTransportRouteDistance2TKFuelKoefDAO objDAO = new ENTransportRouteDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

	  	ENTransportRouteDistance2TKFuelKoef obj = objDAO.getObject(code);
	  
	  

	  	super.remove(code);
	  
	  	/*Сохранение строки дистанции */
	  	ENTransportRouteDistanceDAO itemDistanceDAO = new ENTransportRouteDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
	  
	  	ENTransportRouteDistance itemDistanceObj = itemDistanceDAO.getObject(obj.transportRouteDistanceRef.code);
	  	ENTransportRoute routeObj = routeDAO.getObject(itemDistanceObj.transportRouteRef.code);

	  	itemDistanceObj.koef = itemDistanceDAO.getAggregateSumOfKoefs(itemDistanceObj.code);
	  
	  	itemDistanceDAO.save(itemDistanceObj);
	  	
		  // Поиск строки путевого листа
		  ENTravelSheetItemFilter tsItemFilter = new ENTravelSheetItemFilter();
		  tsItemFilter.planRef.code = routeObj.planRef.code;
		  ENTravelSheetItemShortList tsItemList = itemDAO.getScrollableFilteredList(tsItemFilter, 0, -1);
		  if(tsItemList.totalCount != 1)
			  throw new EnergyproSystemException("Помилка у кількості строк подорожнього листа");
		  
		  ENTravelSheetItem trItemObj = itemDAO.getObject(tsItemList.get(0).code);
		  
		  // Если строка путевого утвержденна - то выводится ошибка
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(trItemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  trItemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = trItemObj.modify_time;
			  itemDAO.save(trItemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  itemDAO.updateModify_time(trItemObj.code, oldModify_time);
		  }

	  }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef%} object.",e);}
	    catch (PersistenceException e)       	    {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally                              {closeConnection();}
  }


} // end of EJB Controller for ENTransportRouteDistance2TKFuelKoef