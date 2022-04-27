//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCCounterKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCCounterKind;
 *
 */

public class SCCounterKindDAO extends SCCounterKindDAOGen {

    public SCCounterKindDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCCounterKindDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCCounterKindDAO

