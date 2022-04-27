//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTransferDate2ServicesObject;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTransferDate2ServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENTransferDate2ServicesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENTransferDate2ServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENTransferDate2ServicesObjectControllerEJB extends
		ENTransferDate2ServicesObjectControllerEJBGen {

	public ENTransferDate2ServicesObjectControllerEJB() {
	}


	/* ENTransferDate2ServicesObject. Изменить */
	@Override
	public void save(ENTransferDate2ServicesObject object) {
		try {
			ENTransferDate2ServicesObjectDAO objectDAO = new ENTransferDate2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;
			object.dateEdit = new Date();

			if (object.code == Integer.MIN_VALUE) {
				int objectCode = objectDAO.add(object);
			} else {
				objectDAO.save(object);
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTransferDate2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENTransferDate2ServicesObject