
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENConnectionTariffEntryDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENConnectionTariffEntry;
 *
 */

public class ENConnectionTariffEntryDAO extends ENConnectionTariffEntryDAOGen {

	public ENConnectionTariffEntryDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENConnectionTariffEntryDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

} // end of ENConnectionTariffEntryDAO
