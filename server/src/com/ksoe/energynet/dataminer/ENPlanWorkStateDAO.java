//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanWorkStateDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanWorkState;
 *
 */

public class ENPlanWorkStateDAO extends ENPlanWorkStateDAOGen {

    public ENPlanWorkStateDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWorkStateDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanWorkStateDAO

