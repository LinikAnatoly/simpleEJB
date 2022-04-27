
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENAct2SCUsageInputDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENAct2SCUsageInput;
 *
 */

public class ENAct2SCUsageInputDAO extends ENAct2SCUsageInputDAOGen {

    public ENAct2SCUsageInputDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2SCUsageInputDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENAct2SCUsageInputDAO
