
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanWork2ActFailure;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActFailureDAO;
import com.ksoe.energynet.dataminer.ENPlanWork2ActFailureDAO;
import com.ksoe.energynet.ejb.generated.ENPlanWork2ActFailureControllerEJBGen;
import com.ksoe.energynet.valueobject.ENActFailure;
import com.ksoe.energynet.valueobject.ENPlanWork2ActFailure;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENPlanWork2ActFailureControllerEJB extends
		ENPlanWork2ActFailureControllerEJBGen {

	public int add(ENPlanWork2ActFailure object, ENActFailure actObject) {
		try {
			ENPlanWork2ActFailureDAO objectDAO = new ENPlanWork2ActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENActFailureDAO actObjectDAO = new ENActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			object.actFailureRef.code = actObjectDAO.add(actObject);
			
		    return objectDAO.add(object);
		    
		    
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanWork2ActFailure%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENPlanWork2ActFailure. Удалить */
	public void remove(int code) {
		try {
			ENPlanWork2ActFailureDAO objectDAO = new ENPlanWork2ActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENActFailureDAO actObjectDAO = new ENActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanWork2ActFailure p2aObj = objectDAO.getObject(code);
			objectDAO.remove(code);
			
			actObjectDAO.remove(p2aObj.actFailureRef.code);
			
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENPlanWork2ActFailure%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENPlanWork2ActFailure. Изменить */
	public void save(ENPlanWork2ActFailure object, ENActFailure actObject) {
		try {
			ENPlanWork2ActFailureDAO objectDAO = new ENPlanWork2ActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			ENActFailureDAO actObjectDAO = new ENActFailureDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			actObjectDAO.save(actObject);
			
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENPlanWork2ActFailure%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public ENPlanWork2ActFailureControllerEJB() {
	}

} // end of EJB Controller for ENPlanWork2ActFailure