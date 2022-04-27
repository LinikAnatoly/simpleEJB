//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDeliveryTimeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDeliveryTime;
 *
 */

public class ENDeliveryTimeDAO extends ENDeliveryTimeDAOGen {

    public ENDeliveryTimeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDeliveryTimeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDeliveryTimeDAO

