//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCUsageInputStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCUsageInputStatus;
 *
 */

public class SCUsageInputStatusDAO extends SCUsageInputStatusDAOGen {

    public SCUsageInputStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInputStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCUsageInputStatusDAO

