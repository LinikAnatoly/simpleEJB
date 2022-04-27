
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENFuelDistributionSheetItem;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetDAO;
import com.ksoe.energynet.dataminer.ENFuelDistributionSheetItemDAO;
import com.ksoe.energynet.ejb.generated.ENFuelDistributionSheetItemControllerEJBGen;
import com.ksoe.energynet.logic.ENConsts;
import com.ksoe.energynet.logic.TravelSheetFuelLogic;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheet;
import com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem;
import com.ksoe.energynet.valueobject.lists.ENFuelDistributionSheetItemShortList;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFuelDistributionSheetItemControllerEJB extends
		ENFuelDistributionSheetItemControllerEJBGen {

	public ENFuelDistributionSheetItemControllerEJB() {
	}
	
	

	
	public ENFuelDistributionSheetItemShortList getFreePMM(int ENFuelDistributionSheetCode) {
		try {
			ENFuelDistributionSheetItemDAO fuelDistrItemDao = new ENFuelDistributionSheetItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			
			return  fuelDistrItemDao.getFreePMM(ENFuelDistributionSheetCode);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't get list getFreePMM of {%com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem%} objects.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENFuelDistributionSheetItem. Изменить */
	public void save(ENFuelDistributionSheetItem object) {
		try {
			ENFuelDistributionSheetItemDAO objectDAO = new ENFuelDistributionSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			TravelSheetFuelLogic travShLog = new TravelSheetFuelLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENFuelDistributionSheetDAO sheetDAO = new ENFuelDistributionSheetDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENFuelDistributionSheet sheet = sheetDAO.getObject(object.fuelDistributionRef.code);
			
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        // Проверка декады
			/*Date currentDate = new Date(System.currentTimeMillis());
			if(currentDate.after(Tools.getLastDateOfDecade(sheet.yearGen, sheet.monthGen, object.decadeNumber))) {
				throw new EnergyproSystemException("Неможливо змінювати строку, так як декада № " + object.decadeNumber + " вже пройшла");
			}*/
	        
	        ENFuelDistributionSheetItem oldObject = objectDAO.getObject(object.code);
	        
	        // проверим , если колличество увеличиваем то что бы не указывали больше топлива чем доступно для декады по выделенным деньгам
	        if (oldObject.count1.compareTo(object.count1) ==-1  ){
	        	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_SERVICES ,  object.count1.subtract(oldObject.count1) );	
	        }
	        
            if (oldObject.count2.compareTo(object.count2) ==-1  ){
            	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_GENERAL_WORK ,  object.count2.subtract(oldObject.count2) );
	        }
            
            if (oldObject.count3.compareTo(object.count3) ==-1  ){
            	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_IP ,  object.count3.subtract(oldObject.count3) );
	        }
            
            if (oldObject.count4.compareTo(object.count4) ==-1  ){
            	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_VKB_OTHER ,  object.count4.subtract(oldObject.count4) );	
	        }
            
            if (oldObject.count5.compareTo(object.count5) ==-1  ){
            	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_VRTU ,  object.count5.subtract(oldObject.count5) );
	        }
            
            if (oldObject.count6.compareTo(object.count6) ==-1  ){
            	travShLog.checkCountPMM(object , ENConsts.ENFUELDISTRIBUTIONSHEET_AVAR ,  object.count6.subtract(oldObject.count6) );
	        }
	        
		    objectDAO.save(object);
		    
		   
		   
		       
		    
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENFuelDistributionSheetItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void setConfirmed(int itemCode, boolean isConfirmed) {
		try {
			ENFuelDistributionSheetItemDAO objectDAO = new ENFuelDistributionSheetItemDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			// Сравнение с предыдущим объектом
			ENFuelDistributionSheetItem object = objectDAO.getObject(itemCode);
			
			if(object.isConfirmed == ENFuelDistributionSheetItem.CONFIRMED) {
				 if(isConfirmed) {
						throw new EnergyproSystemException("Ця строка вже затверджена, поновіть результати!!!");					 
				 }
			} else {
				if(!isConfirmed) {
					throw new EnergyproSystemException("Ця строка вже не є затвердженою, поновіть результати!!!");					
				}
			}
			
			object.isConfirmed = (isConfirmed) ? ENFuelDistributionSheetItem.CONFIRMED : ENFuelDistributionSheetItem.NOT_CONFIRMED;
			objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}
		finally {
			closeConnection();
		}
		
	}



} // end of EJB Controller for ENFuelDistributionSheetItem