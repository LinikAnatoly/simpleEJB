
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENActInvest2DFDocDAO;

/**
 * EJB Controller for ENActInvest2DFDoc;
 *
 */

import com.ksoe.energynet.ejb.generated.ENActInvest2DFDocControllerEJBGen;
import com.ksoe.energynet.valueobject.ENActInvest2DFDoc;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENActInvest2DFDocControllerEJB extends
		ENActInvest2DFDocControllerEJBGen {

	public ENActInvest2DFDocControllerEJB() {
	}
	
	
	/* ENActInvest2DFDoc. Добавить */
	public int add(ENActInvest2DFDoc object) {
		try {
			ENActInvest2DFDocDAO objectDAO = new ENActInvest2DFDocDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
		    object.userAdd = getUserProfile().userName;
		    object.dateAdd = new Date();

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENActInvest2DFDoc%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENActInvest2DFDoc. Удалить */
	public void remove(int code) {
		try {
			ENActInvest2DFDocDAO objectDAO = new ENActInvest2DFDocDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENActInvest2DFDoc%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENActInvest2DFDoc. Изменить */
	public void save(ENActInvest2DFDoc object) {
		try {
			ENActInvest2DFDocDAO objectDAO = new ENActInvest2DFDocDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
	        object.dateEdit = new Date();
	        object.userGen = getUserProfile().userName;

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENActInvest2DFDoc%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENActInvest2DFDoc