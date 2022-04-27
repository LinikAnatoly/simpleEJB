
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.logic.ENSettingsLogic;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
/**
 * EJB Controller for ENSettingsValues;
 *
 */
import com.ksoe.energynet.ejb.generated.ENSettingsValuesControllerEJBGen;

public class ENSettingsValuesControllerEJB extends
		ENSettingsValuesControllerEJBGen {
	private static final long serialVersionUID = 1L;

	public ENSettingsValuesControllerEJB() {
	}
	
	public String getValue(String key) {
		return this.getValue(key, null);
	}
	
	public String getValue(String key, Date date) {
		try {
			ENSettingsLogic logic = new ENSettingsLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			if(date == null) {
				return logic.getValue(key);
			} else {
				return logic.getValue(key, date);
			}
		} catch (DatasourceConnectException e) {
			throw new EnergyproSystemException(e);
		} catch (PersistenceException e) {
			throw new EnergyproSystemException(e);
		}		
	}

} // end of EJB Controller for ENSettingsValues