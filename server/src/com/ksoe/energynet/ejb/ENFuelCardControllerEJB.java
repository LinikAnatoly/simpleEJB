
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENFuelCardDAO;
import com.ksoe.energynet.dataminer.ENTravelSheetItemDAO;
import com.ksoe.energynet.dataminer.FINWorkerDAO;

/**
 * EJB Controller for ENFuelCard;
 *
 */

import com.ksoe.energynet.ejb.generated.ENFuelCardControllerEJBGen;
import com.ksoe.energynet.logic.AuthLogic;
import com.ksoe.energynet.logic.FINLogic;
import com.ksoe.energynet.logic.HumenLogic;
import com.ksoe.energynet.logic.TransportLogic;
import com.ksoe.energynet.logic.AuthLogic.FinConnectionData;
import com.ksoe.energynet.valueobject.ENFuelCard;
import com.ksoe.energynet.valueobject.ENFuelCardHistory;
import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;
import com.ksoe.energynet.valueobject.ENTravelSheet;
import com.ksoe.energynet.valueobject.ENTravelSheetItem;
import com.ksoe.energynet.valueobject.ENTravelSheetItemStatus;
import com.ksoe.energynet.valueobject.FINChargeType;
import com.ksoe.energynet.valueobject.FINWorker;
import com.ksoe.energynet.valueobject.filter.ENTravelSheetItemFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENFuelCardControllerEJB extends
		ENFuelCardControllerEJBGen {
	
	public ENFuelCardControllerEJB() {
	}
	
	
	
	/* ENFuelCard. Изменить */
	public void save(ENFuelCard object) {
		Connection finConn = null;
		try {
			
			AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
       		FinConnectionData finConnectionData = l.getFinConnectionData();
			finConn = getConnection(finConnectionData.connectionString); 
			
			ENFuelCardDAO objectDAO = new ENFuelCardDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        object.dateEdit = new Date();
	        
	        ENFuelCard oldObject = objectDAO.getObject(object.code);
	        
	        
	        if (object.finWorker != null){
                if (object.finWorker.tabNumber != null) {
                FINWorkerDAO wDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                FINWorker w = new FINWorker();
 
                if  (object.finWorker.code > Integer.MIN_VALUE){
                    w = wDAO.getObject(object.finWorker.code);
                }

                // проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;
                date_srez = new Date();

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

                w.code = object.finWorker.code;
                w.name = object.finWorker.name;
                w.tabNumber = object.finWorker.tabNumber;
                w.positionCode = object.finWorker.positionCode;
                w.positionName = object.finWorker.positionName;
                w.departmentCode = object.finWorker.departmentCode;
                w.departmentName = object.finWorker.departmentName;
                w.priceGen = object.finWorker.priceGen;
                w.categor = object.finWorker.categor;
                w.finCode = object.finWorker.finCode;
                 
                w.positionId = object.finWorker.positionId;

                
                w.isSentAssignment = 0;
                /////

                w.kindRef.code = object.finWorker.kindRef.code;

                // если инвалид тогда проставляем в финворкер процент отчислений со справочника FINCHARGEHISTORY и тип отчислений FINChargeType = 2
                // иначе процент отчислений также берем со справочника но только для обычных работников  FINChargeType = 1
                HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
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
            else{
                throw new EnergyproSystemException("Введіть водія ...");
            }
	        boolean isChangeHist = false;
	        // вставка в историю если меняем водителя 
	        if ( ( (oldObject.finWorker.code != Integer.MIN_VALUE && object.finWorker.code == Integer.MIN_VALUE )  
	        		|| (oldObject.finWorker.code == Integer.MIN_VALUE && object.finWorker.code != Integer.MIN_VALUE ) ) 
	    	|| ( ( oldObject.finWorker.code != Integer.MIN_VALUE && object.finWorker.code != Integer.MIN_VALUE ) && 
				oldObject.finWorker.code != object.finWorker.code ) )   {
		      
	        	if ( oldObject.finWorker.code != Integer.MIN_VALUE && object.finWorker.code != Integer.MIN_VALUE )
		        	
		        	if (object.dateApply == null) {
		        		throw new SystemException(" Вкажіть значення \"Дата застосування змін\" " );
		        	}
	            	TransportLogic transportLogic = new TransportLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE),getUserProfile());
					transportLogic.useChangeByFuelCard(object);
	
					isChangeHist = true; 
	        }
	      //если история не менялась тогда дату применения не меняем тоже   
          if (!isChangeHist) {
        	  object.dateApply = oldObject.dateApply;  
          }
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENFuelCard%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	
	/* ENFuelCard. Добавить */
	public int add(ENFuelCard object) {
		Connection finConn = null;
		
		try {
			AuthLogic l = new AuthLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
       		FinConnectionData finConnectionData = l.getFinConnectionData();
			finConn = getConnection(finConnectionData.connectionString);
			
			ENFuelCardDAO objectDAO = new ENFuelCardDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
		    
		    object.dateEdit = new Date();
		    
		    if ((object.finWorker != null) && (object.finWorker.finCode != Integer.MIN_VALUE || object.finWorker.tabNumber != null))
            {
                FINWorkerDAO fwDAO = new FINWorkerDAO(getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
                FINWorker w = new FINWorker();

                HumenLogic hLogic = new HumenLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
                // проверим является ли воркер инвалидом
                // дата среза проверки принимаем на дату старт плана
                Date date_srez;                 
                date_srez = new Date();

                FINLogic fLogicFin = new FINLogic(finConn, getUserProfile());

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
                w.positionId = object.finWorker.positionId;
                w.isSentAssignment = 0;
                w.kindRef.code = object.finWorker.kindRef.code;

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

                object.finWorker.code = fwDAO.add(w);

            }
            else{
                new EnergyproSystemException("Оберіть водія ...");
            }

		    int enFuelCardObj = objectDAO.add(object);
		    
		    
		    
			return enFuelCardObj; 
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENFuelCard%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENFuelCard