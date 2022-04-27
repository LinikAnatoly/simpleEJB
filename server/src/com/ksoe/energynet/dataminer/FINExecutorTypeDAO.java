//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINExecutorTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINExecutorType;
 *
 */

public class FINExecutorTypeDAO extends FINExecutorTypeDAOGen {

	public FINExecutorTypeDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public FINExecutorTypeDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

} // end of FINExecutorTypeDAO

