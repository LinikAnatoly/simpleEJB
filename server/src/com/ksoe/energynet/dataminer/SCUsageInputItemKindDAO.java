//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCUsageInputItemKind;
 *
 */

public class SCUsageInputItemKindDAO extends SCUsageInputItemKindDAOGen {

    public SCUsageInputItemKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInputItemKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCUsageInputItemKindDAO

