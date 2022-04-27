//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENAccumulatorStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENAccumulatorStatus;
 *
 */

public class ENAccumulatorStatusDAO extends ENAccumulatorStatusDAOGen {

    public ENAccumulatorStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAccumulatorStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENAccumulatorStatusDAO

