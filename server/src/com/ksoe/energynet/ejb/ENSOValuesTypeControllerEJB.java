
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energyWorkflow.dataminer.WFGroup2ENSOValuesTypeDAO;
import com.ksoe.energyWorkflow.valueobject.WFGroup2ENSOValuesType;
import com.ksoe.energyWorkflow.valueobject.brief.WFGroup2ENSOValuesTypeShort;
import com.ksoe.energyWorkflow.valueobject.filter.WFGroup2ENSOValuesTypeFilter;
import com.ksoe.energyWorkflow.valueobject.lists.WFGroup2ENSOValuesTypeShortList;
import com.ksoe.energynet.dataminer.ENSOValuesTypeDAO;

/**
 * EJB Controller for ENSOValuesType;
 *
 */

import com.ksoe.energynet.ejb.generated.ENSOValuesTypeControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSOValuesTypeControllerEJB extends
		ENSOValuesTypeControllerEJBGen {

	public ENSOValuesTypeControllerEJB() {
	}
	
	public void save(ENSOValuesType object) {
		Connection workFlowConn = null;
		try {
			ENSOValuesTypeDAO objectDAO = new ENSOValuesTypeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();
	        
	        

		    objectDAO.save(object);
		    
			WFGroup2ENSOValuesTypeDAO group2TypeDao = new WFGroup2ENSOValuesTypeDAO(getUserProfile(), workFlowConn);
			
			WFGroup2ENSOValuesTypeFilter group2TypeFilter = new WFGroup2ENSOValuesTypeFilter();
			group2TypeFilter.soValuesTypeRefCode = object.code;
			WFGroup2ENSOValuesTypeShortList group2TypeList = group2TypeDao.getScrollableFilteredList(group2TypeFilter, 0, -1);
			for(WFGroup2ENSOValuesTypeShort item : group2TypeList.list) {
				WFGroup2ENSOValuesType group2Type = group2TypeDao.getObject(item.code);
				group2Type.soValuesTypeRefName = object.name;
				group2TypeDao.save(group2Type);
			}
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSOValuesType%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if(workFlowConn != null && !workFlowConn.isClosed()) {
					workFlowConn.close();
				}
			} catch (SQLException e) {}
			closeConnection();
		}
	}
	
	public void remove(int code) {
		Connection workFlowConn = null;
		try {
			if(code == Integer.MIN_VALUE) {
				throw new java.lang.NullPointerException("Не заданий код типу додаткового реквізиту!");
			}
			workFlowConn = getConnection(AuthorizationJNDINames.ENERGYWORKFLOW_DATASOURCE);
			ENSOValuesTypeDAO objectDAO = new ENSOValuesTypeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			WFGroup2ENSOValuesTypeDAO group2TypeDao = new WFGroup2ENSOValuesTypeDAO(getUserProfile(), workFlowConn);
			
			WFGroup2ENSOValuesTypeFilter group2TypeFilter = new WFGroup2ENSOValuesTypeFilter();
			group2TypeFilter.soValuesTypeRefCode = code;
			WFGroup2ENSOValuesTypeShortList group2TypeList = group2TypeDao.getScrollableFilteredList(group2TypeFilter, 0, 1);
			if(group2TypeList.totalCount > 0) {
				ENSOValuesType object = objectDAO.getObject(code);
				throw new SystemException(String.format("Тип реквізиту \"%s\" пов'язаний із групою станів \"%s\".\n"
						+ "Перед видаленням типу додаткового реквізиту необхідно видалити зв'язок із групою!"
						, object.getName()
						, group2TypeList.get(0).wfgroupName));
			}
			
			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENSOValuesType%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if(workFlowConn != null && !workFlowConn.isClosed()) {
					workFlowConn.close();
				}
			} catch (SQLException e) {}
			closeConnection();
		}
	}
	
	

} // end of EJB Controller for ENSOValuesType