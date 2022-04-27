//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDeliveryTimePlanDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDeliveryTimePlan;
 *
 */

public class ENDeliveryTimePlanDAO extends ENDeliveryTimePlanDAOGen {

    public ENDeliveryTimePlanDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDeliveryTimePlanDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDeliveryTimePlanDAO

