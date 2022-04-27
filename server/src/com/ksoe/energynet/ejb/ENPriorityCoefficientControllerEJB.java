
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENPriorityCoefficientDAO;

/**
 * EJB Controller for ENPriorityCoefficient;
 *
 */

import com.ksoe.energynet.ejb.generated.ENPriorityCoefficientControllerEJBGen;
import com.ksoe.energynet.valueobject.ENPriorityCoefficient;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENPriorityCoefficientControllerEJB extends ENPriorityCoefficientControllerEJBGen {

	public ENPriorityCoefficientControllerEJB() {
	}


	/* ENPriorityCoefficient. Добавить */
	@Override
	public int add(ENPriorityCoefficient object) {
		try {
			ENPriorityCoefficientDAO objectDAO = new ENPriorityCoefficientDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.dateEdit = new Date();
			object.userGen = getUserProfile().userName;

			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't add {%com.ksoe.energynet.valueobject.ENPriorityCoefficient%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/* ENPriorityCoefficient. Изменить */
	@Override
	public void save(ENPriorityCoefficient object) {
		try {
			ENPriorityCoefficientDAO objectDAO = new ENPriorityCoefficientDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException("Can't save {%com.ksoe.energynet.valueobject.ENPriorityCoefficient%} object.", e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENPriorityCoefficient