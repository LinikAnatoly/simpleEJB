//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENConnectionTariffEntry;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENConnectionTariffEntryDAO;
import com.ksoe.energynet.ejb.generated.ENConnectionTariffEntryControllerEJBGen;
import com.ksoe.energynet.valueobject.ENConnectionTariffEntry;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENConnectionTariffEntryControllerEJB extends
		ENConnectionTariffEntryControllerEJBGen {

	public ENConnectionTariffEntryControllerEJB() {
	}

	/* ENConnectionTariffEntry. Добавить */
	public int add(ENConnectionTariffEntry object) {
		try {
			ENConnectionTariffEntryDAO objectDAO = new ENConnectionTariffEntryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;

			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENConnectionTariffEntry%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENConnectionTariffEntry. Изменить */
	public void save(ENConnectionTariffEntry object) {
		try {
			ENConnectionTariffEntryDAO objectDAO = new ENConnectionTariffEntryDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;

			objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENConnectionTariffEntry%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENConnectionTariffEntry