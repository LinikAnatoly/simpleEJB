
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSORItems2Post04;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSORItems2Post04DAO;
import com.ksoe.energynet.ejb.generated.ENSORItems2Post04ControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSORItems2Post04;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSORItems2Post04ControllerEJB extends
		ENSORItems2Post04ControllerEJBGen {

	public ENSORItems2Post04ControllerEJB() {
	}
	
	/* ENSORItems2Post04. Добавить */
	public int add(ENSORItems2Post04 object) {
		try {
			ENSORItems2Post04DAO objectDAO = new ENSORItems2Post04DAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSORItems2Post04%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENSORItems2Post04. Изменить */
	public void save(ENSORItems2Post04 object) {
		try {
			ENSORItems2Post04DAO objectDAO = new ENSORItems2Post04DAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENSORItems2Post04%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENSORItems2Post04