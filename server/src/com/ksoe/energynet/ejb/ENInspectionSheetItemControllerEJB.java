
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENInspectionSheetItemDAO;

/**
 * EJB Controller for ENInspectionSheetItem;
 *
 */

import com.ksoe.energynet.ejb.generated.ENInspectionSheetItemControllerEJBGen;
import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENInspectionSheetItemControllerEJB extends
		ENInspectionSheetItemControllerEJBGen {

	public ENInspectionSheetItemControllerEJB() {
	}


   	/* ENInspectionSheetItem. Изменить */
	@Override
	public void save(ENInspectionSheetItem object) {
		try {
			ENInspectionSheetItemDAO objectDAO = new ENInspectionSheetItemDAO(
					getUserProfile(), getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

	        if (object.defectName != null) {
	        	object.defectName = object.defectName.trim();
	        }

	        if (object.commentGen != null) {
	        	object.commentGen = object.commentGen.trim();
	        }


	        objectDAO.save(object);

		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENInspectionSheetItem%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENInspectionSheetItem