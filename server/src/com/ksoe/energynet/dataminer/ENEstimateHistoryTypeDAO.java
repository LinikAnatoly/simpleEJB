//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENEstimateHistoryTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateHistoryType;
 *
 */

public class ENEstimateHistoryTypeDAO extends ENEstimateHistoryTypeDAOGen {

    public ENEstimateHistoryTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateHistoryTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateHistoryTypeDAO

