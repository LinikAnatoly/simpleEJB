
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENSettingForDFDecree;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENSettingForDFDecreeDAO;
import com.ksoe.energynet.ejb.generated.ENSettingForDFDecreeControllerEJBGen;
import com.ksoe.energynet.valueobject.ENSettingForDFDecree;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENSettingForDFDecreeControllerEJB extends
		ENSettingForDFDecreeControllerEJBGen {

	public ENSettingForDFDecreeControllerEJB() {
	}
	
	
	/* ENSettingForDFDecree. �������� */
	public int add(ENSettingForDFDecree object) {
		try {
			ENSettingForDFDecreeDAO objectDAO = new ENSettingForDFDecreeDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			if (object.departmentRef.code == Integer.MIN_VALUE){
				throw new SystemException(
						" �� �������� ������� !!! ");
			}

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENSettingForDFDecree%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENSettingForDFDecree