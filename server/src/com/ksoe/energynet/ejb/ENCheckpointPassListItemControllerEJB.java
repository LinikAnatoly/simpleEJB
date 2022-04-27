
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCheckpointPassListItem;
 *
 */

import java.rmi.RemoteException;
import java.util.Date;

import javax.ejb.CreateException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCheckpointPassListDAO;
import com.ksoe.energynet.dataminer.ENCheckpointPassListItemDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENCheckpointPassListItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCheckpointEventType;
import com.ksoe.energynet.valueobject.ENCheckpointPassList;
import com.ksoe.energynet.valueobject.ENCheckpointPassListItem;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.brief.ENCheckpointPassListItemShort;
import com.ksoe.energynet.valueobject.filter.ENCheckpointPassListFilter;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energynet.valueobject.lists.ENCheckpointPassListShortList;
import com.ksoe.energynet.valueobject.lists.ENTravelSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCheckpointPassListItemControllerEJB extends
		ENCheckpointPassListItemControllerEJBGen {

	public ENCheckpointPassListItemControllerEJB() {
	}
	
	public int add_old(ENCheckpointPassListItem  object)
	{
		try
		{
			ENCheckpointPassListItemDAO passListItemDao = new ENCheckpointPassListItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			checkPeriod(object);
			
			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();
		
			return passListItemDao.add(object);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();
		}
	}
	
	public int add( ENCheckpointPassListItemShort[] objectList)
	{
		try
		{
			ENCheckpointPassListItemDAO passListItemDao = new ENCheckpointPassListItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			if (objectList.length == 0){
	                throw new EnergyproSystemException("Кількість строк для вставки равно 0");
	            }
			
			 
			
			int out_code=0;
			for (int i=0; i < objectList.length; i++){
				
				if (objectList[i].checkpointPassListRefCode != Integer.MIN_VALUE 
						& objectList[i].transportRealRefCode !=  Integer.MIN_VALUE
						& objectList[i].eventTypeRefCode != Integer.MIN_VALUE ) {
					
				System.out.print(" objectList[i].checkpointPassListRefCode = " + objectList[i].checkpointPassListRefCode + " || objectList[i].transportRealRefCode =  " + objectList[i].transportRealRefCode + "||  objectList[i].eventTypeRefCode = " + objectList[i].eventTypeRefCode );	
				ENCheckpointPassListItem ENCheckpointPassListItemObj = new ENCheckpointPassListItem();
				
				ENCheckpointPassListItemObj.checkpointPassListRef.code = objectList[i].checkpointPassListRefCode;
				ENCheckpointPassListItemObj.transportRealRef.code = objectList[i].transportRealRefCode;
				ENCheckpointPassListItemObj.eventTypeRef.code = objectList[i].eventTypeRefCode;
				ENCheckpointPassListItemObj.dateEvent = objectList[i].dateEvent;
				
				checkPeriod(ENCheckpointPassListItemObj);
				
				ENCheckpointPassListItemObj.userGen = getUserProfile().userName;
				ENCheckpointPassListItemObj.dateEdit = new Date();
			
				out_code = passListItemDao.add(ENCheckpointPassListItemObj);
			}
			}
			
			return out_code;
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();
		}
	}
	
	
	public int checkAndCreateCheckpointPassList(ENCheckpointPassList passList)  {
		
		try
		{
		ENCheckpointPassListDAO passListDAO = new ENCheckpointPassListDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
		ENCheckpointPassListFilter passListFilter = new ENCheckpointPassListFilter();
		passListFilter.checkpointRef.code = passList.checkpointRef.code;
		passListFilter.conditionSQL = " (encheckpointpasslist.datestart between to_timestamp(to_char(current_date,'dd.MM.yyyy')||' 00:00','dd.MM.yyyy HH24:MI') " + 
		                              " and to_timestamp(to_char(current_date,'dd.MM.yyyy')||' 23:59','dd.MM.yyyy HH24:MI') " +
		                              " and encheckpointpasslist.datefinal between to_timestamp(to_char(current_date,'dd.MM.yyyy')||' 00:00','dd.MM.yyyy HH24:MI') " +
		                              " and to_timestamp(to_char(current_date,'dd.MM.yyyy')||' 23:59:59','dd.MM.yyyy HH24:MI:ss')) ";
		ENCheckpointPassListShortList passListList = passListDAO.getScrollableFilteredList(passListFilter, 0, -1);
		
		if (passListList.totalCount > 1) {
			throw new SystemException("Что-то пошло не так. Найдено более одного реестра регистрации на КПП");
		}
		
		int passListCode = Integer.MIN_VALUE;
		
		   if (passListList.totalCount == 1) {
			   passListCode = passListList.get(0).code;
		   }
		
		// если на текущую дату еще нет реестра регистрации на КПП, то создадим его
		if (passListList.totalCount == 0) {
			
            Context context = new InitialContext();
            Object objRef = null;
            objRef = context.lookup(ENCheckpointPassListController.JNDI_NAME);
            ENCheckpointPassListControllerHome checkpointPassListHome = (ENCheckpointPassListControllerHome) PortableRemoteObject.narrow(objRef, ENCheckpointPassListControllerHome.class);
            ENCheckpointPassListController checkpointPassListController = checkpointPassListHome.create();
             
            Date dateStart = new Date();
            dateStart.setHours(0);
            dateStart.setMinutes(0);
            dateStart.setSeconds(0);
            
            Date dateFinal = new Date();
            dateFinal.setHours(23);
            dateFinal.setMinutes(59);
            dateFinal.setSeconds(0);
            
            passList.dateStart = dateStart;
            passList.dateFinal = dateFinal;
            
            passListCode = checkpointPassListController.add(passList);
		} 
		
		return passListCode;
		}
		catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (NamingException e) {
			throw new EnergyproSystemException(e);
		} catch (RemoteException e) {
			throw new EnergyproSystemException(e);
		} catch (CreateException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();
		}
		
	}
	
	public void addRideIn( ENCheckpointPassListItem object) {
		addRide(object, ENCheckpointEventType.MOVE_IN);
	}
	
	
	public void addRideOut( ENCheckpointPassListItem object) {
		addRide(object, ENCheckpointEventType.MOVE_OUT);	
	}
	
	public void addRide(ENCheckpointPassListItem object, int eventType)
	{
		try
		{
			ENCheckpointPassListItemDAO passListItemDao = new ENCheckpointPassListItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTravelSheetDAO tsDAO = new ENTravelSheetDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTravelSheetItemDAO travelSheetItemDao = new ENTravelSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENTravelSheet ts = tsDAO.getObject(object.travelSheetRef.code);
			
			ENTravelSheetItemFilter travelSheetItemFilter = new ENTravelSheetItemFilter();
			travelSheetItemFilter.travelSheetRef.code = ts.code;
			travelSheetItemFilter.conditionSQL = "entravelsheetitem.planrefcode IS NOT NULL";
			ENTravelSheetItemShortList travelSheetItemList = travelSheetItemDao.getScrollableFilteredList(travelSheetItemFilter, 0, -1);
			if(travelSheetItemList.totalCount == 0) {
				throw new SystemException(String.format("У подорожньому листі № %s немає діючих наряд-завдань!", ts.numberGen));
			}
			
			ENCheckpointPassList passList = new ENCheckpointPassList();
			// тут checkpointPassListRef.code на самом деле код Checkpoint'a для создания 
			// этого самого checkpointPassList'a
			passList.checkpointRef.code = object.checkpointPassListRef.code;
			passList.dateStart = ts.dateStart;
			
			int passListCode = Integer.MIN_VALUE;
			passListCode = checkAndCreateCheckpointPassList(passList);
			
			if (passListCode == Integer.MIN_VALUE) {
				throw new SystemException("Что-то пошло не так. Не создался реестр для регистрации на КПП");
			}
			// а вот здесь мы ставим object'у уже реальное значение в поле checkpointPassListRef.code
			object.checkpointPassListRef.code = passListCode;
			object.eventTypeRef.code = eventType;
			object.transportRealRef.code = ts.transportReal.code;
			object.dateEvent = new Date();
			checkPeriod(object);
            object.userGen = getUserProfile().userName;
            object.dateEdit = new Date();
			
				if (object.checkpointPassListRef.code != Integer.MIN_VALUE 
						& object.transportRealRef.code !=  Integer.MIN_VALUE
						& object.eventTypeRef.code != Integer.MIN_VALUE ) {
				System.out.print(" objectList[i].checkpointPassListRefCode = " + object.checkpointPassListRef.code + " || object.transportRealRef.Code =  " + object.transportRealRef.code + "||  objectList[i].eventTypeRef.Code = " + object.eventTypeRef.code );	
				passListItemDao.add(object);
				}

			
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();
		}
	}
	
	public void save(ENCheckpointPassListItem object)
	{
		try
		{
			ENCheckpointPassListItemDAO passListItemDao = new ENCheckpointPassListItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			checkPeriod(object);
			
			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();
			
			passListItemDao.save(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
		finally
		{
			closeConnection();			
		}
	}
	
	/**
	 * 
	 * проверяет, что дата входит в период реестра кпп
	 * 
	 * @param object строка реестра кпп
	 */
	public void checkPeriod(ENCheckpointPassListItem object)
	{
		try
		{
			ENCheckpointPassListDAO passListDao = new ENCheckpointPassListDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			ENCheckpointPassList passList = passListDao.getObject(object.checkpointPassListRef.code);
			
			Date now = new Date(); 
			
			if(passList.dateStart.compareTo(object.dateEvent) == 1)
			{
				throw new EnergyproSystemException("Дата події повина бути після дати початку реєстру");
			}
			if(passList.dateFinal.compareTo(object.dateEvent) == -1)
			{
				throw new EnergyproSystemException("Дата події повина бути меньша за дату закінчення початку реєстру");
			}
			if(now.compareTo(object.dateEvent) == -1 ) {
				throw new SystemException("Дата події не може бути у майбутньому!");
			}
			
			
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		}
	}

} // end of EJB Controller for ENCheckpointPassListItem