
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENIPItem2PlanDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIPItem2Plan;
 *
 */

public class ENIPItem2PlanDAO extends ENIPItem2PlanDAOGen {

    public ENIPItem2PlanDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPItem2PlanDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
   
} // end of ENIPItem2PlanDAO
