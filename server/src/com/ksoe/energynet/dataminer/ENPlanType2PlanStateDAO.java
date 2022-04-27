//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanType2PlanStateDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanType2PlanState;
 *
 */

public class ENPlanType2PlanStateDAO extends ENPlanType2PlanStateDAOGen {

    public ENPlanType2PlanStateDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanType2PlanStateDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanType2PlanStateDAO

