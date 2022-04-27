
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENCoefficientQualityStandards;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENCoefficientQualityStandardsDAO;
import com.ksoe.energynet.ejb.generated.ENCoefficientQualityStandardsControllerEJBGen;
import com.ksoe.energynet.valueobject.ENCoefficientQualityStandards;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENCoefficientQualityStandardsControllerEJB extends
		ENCoefficientQualityStandardsControllerEJBGen {

	public ENCoefficientQualityStandardsControllerEJB() {
	}

	/* ENCoefficientQualityStandards. Изменить */
	public void save(ENCoefficientQualityStandards object) {
		try {
			ENCoefficientQualityStandardsDAO objectDAO = new ENCoefficientQualityStandardsDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENCoefficientQualityStandards%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
} // end of EJB Controller for ENCoefficientQualityStandards