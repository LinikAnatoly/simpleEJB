//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCCounterStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCCounterStatus;
 *
 */

public class SCCounterStatusDAO extends SCCounterStatusDAOGen {

    public SCCounterStatusDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCCounterStatusDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCCounterStatusDAO

