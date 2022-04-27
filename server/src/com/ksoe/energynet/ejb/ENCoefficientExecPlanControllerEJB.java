
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCoefficientExecPlan;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.AXOrgId2FKOrgIdDAO;
import com.ksoe.energynet.dataminer.ENCoefficientExecPlanDAO;
import com.ksoe.energynet.ejb.generated.ENCoefficientExecPlanControllerEJBGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.ENCoefficientExecPlan;
import com.ksoe.energynet.valueobject.filter.AXOrgId2FKOrgIdFilter;
import com.ksoe.energynet.valueobject.lists.AXOrgId2FKOrgIdShortList;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCoefficientExecPlanControllerEJB extends
		ENCoefficientExecPlanControllerEJBGen {

	public ENCoefficientExecPlanControllerEJB() {
	}
	
	
	/* ENCoefficientExecPlan. Добавить */
	public int add(ENCoefficientExecPlan object) {
		try {
			ENCoefficientExecPlanDAO objectDAO = new ENCoefficientExecPlanDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			AXOrgId2FKOrgIdDAO ax2fkPodrDAO = new AXOrgId2FKOrgIdDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
//			 Calendar calendar = Calendar.getInstance();
//             calendar.setTime(object.dateGen);
//             calendar.set(Calendar.DAY_OF_MONTH, 1);
//             calendar.set(Calendar.HOUR_OF_DAY, 0);
//             calendar.set(Calendar.MINUTE, 0);
//             calendar.set(Calendar.SECOND, 0);
//             calendar.set(Calendar.MILLISECOND, 0);
			
			object.dateGen = Tools.getFirstDayOfMonth(object.dateGen);
			
			if ( !object.axOrgId.equals("") && object.finPodrCode == Integer.MIN_VALUE ){
				AXOrgId2FKOrgIdFilter ax2fkpodrFilter = new AXOrgId2FKOrgIdFilter();
				ax2fkpodrFilter.axOrgId = object.axOrgId;
				AXOrgId2FKOrgIdShortList ax2fkpodrList = ax2fkPodrDAO.getScrollableFilteredList(ax2fkpodrFilter, 0, -1);
				if (ax2fkpodrList.totalCount > 0 ){
					object.finPodrCode = Integer.parseInt(ax2fkpodrList.get(0).fkOrgId);
				}
			}

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENCoefficientExecPlan%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	/* ENCoefficientExecPlan. Изменить */
	public void save(ENCoefficientExecPlan object) {
		try {
			ENCoefficientExecPlanDAO objectDAO = new ENCoefficientExecPlanDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			AXOrgId2FKOrgIdDAO ax2fkPodrDAO = new AXOrgId2FKOrgIdDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
//			Calendar calendar = Calendar.getInstance();
//            calendar.setTime(object.dateGen);
//            calendar.set(Calendar.DAY_OF_MONTH, 1); 
//            calendar.set(Calendar.HOUR_OF_DAY, 0);
//            calendar.set(Calendar.MINUTE, 0);
//            calendar.set(Calendar.SECOND, 0);
//            calendar.set(Calendar.MILLISECOND, 0);
            
            object.dateGen = Tools.getFirstDayOfMonth(object.dateGen);
            
            if ( !object.axOrgId.equals("") && object.finPodrCode == Integer.MIN_VALUE ){
				AXOrgId2FKOrgIdFilter ax2fkpodrFilter = new AXOrgId2FKOrgIdFilter();
				ax2fkpodrFilter.axOrgId = object.axOrgId;
				AXOrgId2FKOrgIdShortList ax2fkpodrList = ax2fkPodrDAO.getScrollableFilteredList(ax2fkpodrFilter, 0, -1);
				if (ax2fkpodrList.totalCount > 0 ){
					object.finPodrCode = Integer.parseInt(ax2fkpodrList.get(0).fkOrgId);
				}
			}

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENCoefficientExecPlan%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENCoefficientExecPlan