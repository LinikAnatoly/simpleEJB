
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENTechAgreement2ServicesObject;
 *
 */

import java.util.Date;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENTechAgreement2ServicesObjectDAO;
import com.ksoe.energynet.ejb.generated.ENTechAgreement2ServicesObjectControllerEJBGen;
import com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENTechAgreement2ServicesObjectControllerEJB extends
		ENTechAgreement2ServicesObjectControllerEJBGen {

	public ENTechAgreement2ServicesObjectControllerEJB() {
	}


	/* ENTechAgreement2ServicesObject. Добавить */
	@Override
	public int add(ENTechAgreement2ServicesObject object) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			if (object.basisForAction != null) {
				object.basisForAction = object.basisForAction.trim();
			}

			if (object.objectName != null) {
				object.objectName = object.objectName.trim();
			}


		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


   	/* ENTechAgreement2ServicesObject. Изменить */
	@Override
	public void save(ENTechAgreement2ServicesObject object) {
		try {
			ENTechAgreement2ServicesObjectDAO objectDAO = new ENTechAgreement2ServicesObjectDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));


			if (object.basisForAction != null) {
				object.basisForAction = object.basisForAction.trim();
			}

			if (object.objectName != null) {
				object.objectName = object.objectName.trim();
			}


		    object.userGen = getUserProfile().userName;
	        object.dateEdit = new Date();

		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENTechAgreement2ServicesObject%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENTechAgreement2ServicesObject