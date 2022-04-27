//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanWork2PlanWorkReasonDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanWork2PlanWorkReason;
 *
 */

public class ENPlanWork2PlanWorkReasonDAO extends
        ENPlanWork2PlanWorkReasonDAOGen {

    public ENPlanWork2PlanWorkReasonDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWork2PlanWorkReasonDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanWork2PlanWorkReasonDAO

