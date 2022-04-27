
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENDistributionAgree;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDistributionAgreeDAO;
import com.ksoe.energynet.dataminer.ENSO2DistrAgreeDAO;
import com.ksoe.energynet.ejb.generated.ENDistributionAgreeControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDistributionAgree;
import com.ksoe.energynet.valueobject.ENSO2DistrAgree;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENDistributionAgreeControllerEJB extends
		ENDistributionAgreeControllerEJBGen {

	public ENDistributionAgreeControllerEJB() {
	}
	

	/* ENDistributionAgree. Добавить */
	public int add(ENDistributionAgree object,int soCode) {
		try {
			ENDistributionAgreeDAO objectDAO = new ENDistributionAgreeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    object.userGen = getUserProfile().userName;
 
		    
		    int distrCode = objectDAO.add(object);
		    ENSO2DistrAgreeDAO so2distrDAO = new ENSO2DistrAgreeDAO(getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
		    ENSO2DistrAgree so2distr = new ENSO2DistrAgree();
		    so2distr.servicesobject.code = soCode;
		    so2distr.distrAgree.code = distrCode;
		    so2distrDAO.add(so2distr);
		    
		    return distrCode;
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENDistributionAgree%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENDistributionAgree