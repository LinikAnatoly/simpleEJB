//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENAutoTires;
 *
 */

import java.sql.Connection;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENAutoTiresDAO;
import com.ksoe.energynet.ejb.generated.ENAutoTiresControllerEJBGen;
import com.ksoe.energynet.valueobject.ENAutoTiresInstallInfo;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENAutoTiresControllerEJB extends ENAutoTiresControllerEJBGen {

	public ENAutoTiresControllerEJB() {
	}

	public ENAutoTiresInstallInfo getInstallInfo(int tiresCode) {
		try {
			Connection enConn = null;
			enConn = getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE);

			ENAutoTiresDAO tiresDAO = new ENAutoTiresDAO(getUserProfile(), enConn);
			ENAutoTiresInstallInfo info = tiresDAO.getInstallInfo(tiresCode);

			return info;
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException("Can't connect to DataSource", e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENAutoTires