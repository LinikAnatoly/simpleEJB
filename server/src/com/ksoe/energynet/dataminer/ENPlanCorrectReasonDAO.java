//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Oct 07 14:18:06 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanCorrectReasonDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanCorrectReason;
 *
 */

public class ENPlanCorrectReasonDAO extends ENPlanCorrectReasonDAOGen {

    public ENPlanCorrectReasonDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanCorrectReasonDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanCorrectReasonDAO

