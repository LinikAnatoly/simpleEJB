
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTechCond2PlanWorkDAOGen;
import com.ksoe.energynet.logic.TechConditionsLogic;
import com.ksoe.energynet.valueobject.ENTechCond2PlanWork;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTechCond2PlanWork;
 *
 */

public class ENTechCond2PlanWorkDAO extends ENTechCond2PlanWorkDAOGen {

	public ENTechCond2PlanWorkDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENTechCond2PlanWorkDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public int add(ENTechCond2PlanWork techCond2PlanWork) throws PersistenceException {

		if (techCond2PlanWork.techConServicesRef.code != Integer.MIN_VALUE) {

			TechConditionsLogic techConditionsLogic = new TechConditionsLogic(getConnection(), getUserProfile());
            techConditionsLogic.checkActIncone(techCond2PlanWork.techConServicesRef.code);
		}

		return add(techCond2PlanWork, true);
	}

} // end of ENTechCond2PlanWorkDAO
