
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSOTechParamsDAOGen;
import com.ksoe.energynet.logic.ServicesLogic;
import com.ksoe.energynet.valueobject.ENSOTechParams;
import com.ksoe.energynet.valueobject.ENTechConditionsObjects;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENSOTechParams;
 *
 */

public class ENSOTechParamsDAO extends ENSOTechParamsDAOGen {

	public ENSOTechParamsDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENSOTechParamsDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}



	@Override
	public void save(ENSOTechParams techParams) throws PersistenceException {

		ENSOTechParams oldTechParams = getObject(techParams.code);

		if (oldTechParams.installationTypeRef.code != Integer.MIN_VALUE
				&& oldTechParams.installationTypeRef.code != techParams.installationTypeRef.code) {

			ServicesLogic servicesLogic = new ServicesLogic(getConnection(), getUserProfile());
			ENTechConditionsObjects oldTechConditionsObjects = servicesLogic.getTechCoditionByServicesObjectCode(techParams.servicesobject.code);

			if (oldTechConditionsObjects.identNumber != Integer.MIN_VALUE) {
				throw new SystemException("\n\n"
						+ "Після присвоєння ідентифікатора \"Тип електроустановки замовника\" не змінюється!");
			}

		}



		save(techParams, null);
	}



} // end of ENSOTechParamsDAO
