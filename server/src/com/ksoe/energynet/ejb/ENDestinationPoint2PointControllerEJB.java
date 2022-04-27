//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDestinationPoint2Point;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDestinationPoint2PointDAO;
import com.ksoe.energynet.ejb.generated.ENDestinationPoint2PointControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDestinationPoint2Point;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;

public class ENDestinationPoint2PointControllerEJB extends
		ENDestinationPoint2PointControllerEJBGen {

	public ENDestinationPoint2PointControllerEJB() {
	}

	/* ENDestinationPoint2Point. Добавить */
	public int add(ENDestinationPoint2Point object) {
		try {

			ENDestinationPoint2PointDAO objectDAO = new ENDestinationPoint2PointDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			return objectDAO.add(object);

		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDestinationPoint2Point%} object.",
					e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENDestinationPoint2Point