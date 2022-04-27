//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENEstimateItem2TypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItem2Type;
 *
 */

public class ENEstimateItem2TypeDAO extends ENEstimateItem2TypeDAOGen {

    public ENEstimateItem2TypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItem2TypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateItem2TypeDAO

