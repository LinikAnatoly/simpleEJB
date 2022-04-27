//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENStandardConstEntryDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENStandardConstEntry;
 *
 */

public class ENStandardConstEntryDAO extends ENStandardConstEntryDAOGen {

	public ENStandardConstEntryDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENStandardConstEntryDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

} // end of ENStandardConstEntryDAO

