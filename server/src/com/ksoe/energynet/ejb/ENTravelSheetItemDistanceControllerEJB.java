
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Controller for ENTravelSheetItemDistance;  
  * 	
  */



import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransportRouteDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistance2TKFuelKoefDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDistanceDAO;
import com.ksoe.energynet.ejb.generated.ENTravelSheetItemDistanceControllerEJBGen;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
import com.ksoe.energynet.valueobject.ENTravelSheetItemKind;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.ENTravelSheetStatus;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistance2TKFuelKoefFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.techcard.dataminer.TKTransportRealHistoryDAO;
//import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
//import com.ksoe.energynet.valueobject.ENTravelSheetItemDistance;
//import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemDistanceShortList;
//import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemDistanceFilter;

public class ENTravelSheetItemDistanceControllerEJB extends ENTravelSheetItemDistanceControllerEJBGen
 {

  public ENTravelSheetItemDistanceControllerEJB() {}
  
  public int add(ENTravelSheetItemDistance object)
  {
	  Connection techConn = null;
	  try
	  {
		  techConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTransportRouteDAO routeDAO = new ENTransportRouteDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		 
		  // Проверка - нельзя добавлять дистанции с пустыми расстоянием и машиночасами
		  if(object.distance.compareTo(new BigDecimal(0)) == 0 && object.sumMachineHours.compareTo(new BigDecimal(0)) == 0)
			  throw new EnergyproSystemException("Введіть дистанцію або машиногодини");
		  
		  if(object.travelSheetItemRef == null)
			  throw new EnergyproSystemException("Error in ENTravelSheetItem.code");
		  else
			  if(object.travelSheetItemRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTravelSheetItem.code");
		  
		  ENTravelSheetItem itemObj = itemDAO.getObject(object.travelSheetItemRef.code);
		  
		  // Добавлять можно только для фактических строк
		  if(itemObj.kindRef.code != ENTravelSheetItemKind.FACT)
			  throw new EnergyproSystemException("Строка подорожнього листа повинна бути фактичною для додавання на неї дистанцій з коефіціентами");

		  
		  /*Проверка на наличие маршрутов - если есть, то добавлять дистанции на маршруты*/
		  ENTransportRouteFilter routeFilter = new ENTransportRouteFilter();
		  routeFilter.planRef.code = itemObj.planRef.code;
		  int[] routeCodes = routeDAO.getFilteredCodeArray(routeFilter, 0, -1);
		  if(routeCodes.length > 0)
			  throw new EnergyproSystemException("Занесіть дистанції з коефіціентами на маршрутах");
		  
		  
		  object.koef = new BigDecimal(1);
		  
		  // Ввод только для фактических строк путевых
		  ENTravelSheet tsObj = tsDAO.getObject(itemObj.travelSheetRef.code);
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("Дистанції вводяться тільки для подорожніх листів в статусі \"Формування Фактів\"");
		  
		  // Если строка утвержденна - то выводится ошибка
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  itemDAO.save(itemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  itemDAO.updateModify_time(itemObj.code, oldModify_time);
		  }
		  
		  /*Проверка - устанавливать коэффициенты только для машин с GPS*/
		  TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
		  boolean isGPS = transportLogic.isGPS(tsObj.transportReal.code, tsObj.dateFinal);
		  if(!isGPS) throw new EnergyproSystemException("Дистанції з коефіціентами заносяться тільки на транспорт з GPS");

		  int out = super.add(object);
		  		  
		  return out;
		  
		  
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't add {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally                              
	  {closeConnection();
			try {
				if (techConn != null && ! techConn.isClosed()) {
					techConn.close();
					techConn = null;
				}
			} catch (SQLException e) {}
	  }
  }
  
  public void save(ENTravelSheetItemDistance object)
  {
	  try
	  {
		  ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO itemDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  
		  if(object.travelSheetItemRef == null)
			  throw new EnergyproSystemException("Error in ENTravelSheetItem.code");
		  else
			  if(object.travelSheetItemRef.code == Integer.MIN_VALUE)
				  throw new EnergyproSystemException("Error in ENTravelSheetItem.code");
	  
		  // Проверка - нельзя добавлять дистанции с пустыми расстоянием и машиночасами
		  if(object.distance.compareTo(new BigDecimal(0)) == 0 && object.sumMachineHours.compareTo(new BigDecimal(0)) == 0)
			  throw new EnergyproSystemException("Введіть дистанцію або машиногодини");

		  
		  ENTravelSheetItem itemObj = itemDAO.getObject(object.travelSheetItemRef.code);
		  
		  object.koef = itemDistanceDAO.getAggregateSumOfKoefs(object.code);
		  
		  // Изменение только для фактических строк путевых
		  ENTravelSheet tsObj = tsDAO.getObject(itemObj.travelSheetRef.code);
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("Дистанції змінюються тільки для подорожніх листів в статусі \"Формування Фактів\"");
		  
		  // Если строка утвержденна - то выводится ошибка
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  itemDAO.save(itemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  itemDAO.updateModify_time(itemObj.code, oldModify_time);
		  }

		  super.save(object);
	  }
	    catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't save {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance%} object.",e);}
		catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	    finally {closeConnection();}
	  
  }

  public void remove(int code)
  {
	  try
	  {
		  ENTravelSheetItemDistance2TKFuelKoefDAO tsid2fkDAO = new ENTravelSheetItemDistance2TKFuelKoefDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDistanceDAO tsidDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetItemDAO tsiDAO = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());

		  ENTravelSheetItemDistance object = tsidDAO.getObject(code);
		  ENTravelSheetItem itemObj = tsiDAO.getObject(object.travelSheetItemRef.code);
		  
		  // Удаление всех коэффициентов на строку
		  ENTravelSheetItemDistance2TKFuelKoefFilter tsid2fkFilter = new ENTravelSheetItemDistance2TKFuelKoefFilter();
		  tsid2fkFilter.travelSheetItemDistanceRef.code = code;
		  int[] tsid2fkCodes = tsid2fkDAO.getFilteredCodeArray(tsid2fkFilter, 0, -1);
		  
		  for(int i = 0; i < tsid2fkCodes.length; i++)
			  tsid2fkDAO.remove(tsid2fkCodes[i]);
		  
		  // Изменение только для фактических строк путевых
		  ENTravelSheet tsObj = tsDAO.getObject(itemObj.travelSheetRef.code);
		  
		  if(tsObj.statusRef.code != ENTravelSheetStatus.FACT)
			  throw new EnergyproSystemException("Дистанції видаляються тільки для подорожніх листів в статусі \"Формування Фактів\"");
		  
		  // Если строка утвержденна - то выводится ошибка
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CLOSED)
			  throw new EnergyproSystemException("Строка подорожнього листа затверджена");
		  
		  // Если строка путевого расчитанна - то изменять ее статус на черновой
		  if(itemObj.statusRef.code == ENTravelSheetItemStatus.CALCULATED)
		  {
			  itemObj.statusRef.code = ENTravelSheetItemStatus.GOOD;
			  long oldModify_time = itemObj.modify_time;
			  tsiDAO.save(itemObj);
			  // update modify_time на старое, т.к. без него при сохранении с клиента
			  // строки путевого листа будет выбивать optimisting locking
			  tsiDAO.updateModify_time(itemObj.code, oldModify_time);
		  }


		  super.remove(code);
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't remove {%com.ksoe.energynet.valueobject.ENTravelSheetItemDistance%} object.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally {closeConnection();}
  }
  
  public BigDecimal getAggregateSumOfKoefs(int code)
  {
	  try
	  {
		  ENTravelSheetItemDistanceDAO itemDistanceDAO = new ENTravelSheetItemDistanceDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
		  return itemDistanceDAO.getAggregateSumOfKoefs(code);
	  }
	  catch (DatasourceConnectException e) {throw new EnergyproSystemException("Can't execute getAggregateMultiplicationOfKoefs.",e);}
	  catch (PersistenceException e)       {throw new EnergyproSystemException(e.getMessage(),e);}
	  finally {closeConnection();}
	  
  }

} // end of EJB Controller for ENTravelSheetItemDistance