
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENEstimateItem2PlanTypeDAOGen;

/**
 * DAO Object for ENEstimateItem2PlanType;
 *
 */

public class ENEstimateItem2PlanTypeDAO extends ENEstimateItem2PlanTypeDAOGen {

    public ENEstimateItem2PlanTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItem2PlanTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateItem2PlanTypeDAO
