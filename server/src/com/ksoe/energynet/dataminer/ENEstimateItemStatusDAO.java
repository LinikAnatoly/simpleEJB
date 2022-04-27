//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItemStatus;
 *
 */

public class ENEstimateItemStatusDAO extends ENEstimateItemStatusDAOGen {

    public ENEstimateItemStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItemStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateItemStatusDAO

