
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSO2Node;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCalcPowerReserveItemDAO;
import com.ksoe.energynet.dataminer.ENSO2NodeDAO;
import com.ksoe.energynet.ejb.generated.ENSO2NodeControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSO2Node;
import com.ksoe.energynet.valueobject.filter.ENCalcPowerReserveItemFilter;
import com.ksoe.energynet.valueobject.filter.ENSO2NodeFilter;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSO2NodeControllerEJB extends
		ENSO2NodeControllerEJBGen {

	public ENSO2NodeControllerEJB() {
	}
	
	
	/* ENSO2Node. Удалить */
	public void remove(int code) {
		try {
			ENSO2NodeDAO objectDAO = new ENSO2NodeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENSO2Node object = objectDAO.getObject(code);
			
			ENSO2NodeFilter so2nFilter = new ENSO2NodeFilter();
			so2nFilter.servicesobject.code = object.servicesobject.code;
			so2nFilter.conditionSQL = "code <> " + object.code;
			int[] so2nArr = objectDAO.getFilteredCodeArray(so2nFilter, 0, -1);
			if (so2nArr.length == 0) 
			{
				throw new SystemException("Ця точка приєднання є останньою! Видалення неможливо - використовувайте редагування!");
			}
			
			// дропнем строки из расчетов, если удаляют саму строку
			ENCalcPowerReserveItemDAO priDAO = new ENCalcPowerReserveItemDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENCalcPowerReserveItemFilter priFilter = new ENCalcPowerReserveItemFilter();
			priFilter.so2nodeRef.code = code;
			int[] priArr = priDAO.getFilteredCodeArray(priFilter, 0, -1);
			
			for (int pri=0;pri<priArr.length;pri++){
				priDAO.remove(priArr[pri]);
			}
			
			
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENSO2Node%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
   	/* ENSO2Node. Изменить */
	public void save(ENSO2Node object) {
		try {
			ENSO2NodeDAO objectDAO = new ENSO2NodeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

			// дропнем строки из расчетов, если редактируют узел, иначе потом в расчете резерва будет будяк
			ENCalcPowerReserveItemDAO priDAO = new ENCalcPowerReserveItemDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			ENCalcPowerReserveItemFilter priFilter = new ENCalcPowerReserveItemFilter();
			priFilter.so2nodeRef.code = object.code;
			int[] priArr = priDAO.getFilteredCodeArray(priFilter, 0, -1);
			
			for (int pri=0;pri<priArr.length;pri++){
				priDAO.remove(priArr[pri]);
			}
	        
	        
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSO2Node%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENSO2Node. Добавить */
	public int add(ENSO2Node object) {
		try {
			ENSO2NodeDAO objectDAO = new ENSO2NodeDAO(getUserProfile(),getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
//	        ENSO2NodeFilter so2nodeFilter = new ENSO2NodeFilter();
//	        so2nodeFilter.servicesobject.code = object.servicesobject.code;
//	        so2nodeFilter.so2nodeType.code = object.so2nodeType.code;
//	        int[] so2nodeArr = objectDAO.getFilteredCodeArray(so2nodeFilter, 0, -1);
//	        
//	        if (so2nodeArr.length == 1) {
//	        	objectDAO.remove(so2nodeArr[0]);
//	        } else if (so2nodeArr.length > 1)
//	        {
//	        	throw new SystemException("Ошибка в привязке точки присоединения!");
//	        }
	        

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSO2Node%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENSO2Node