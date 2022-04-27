//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENEstimateItemStatusHistoryDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItemStatusHistory;
 *
 */

public class ENEstimateItemStatusHistoryDAO extends
        ENEstimateItemStatusHistoryDAOGen {

    public ENEstimateItemStatusHistoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItemStatusHistoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateItemStatusHistoryDAO

