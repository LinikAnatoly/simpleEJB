//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENWorkOrderStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENWorkOrderStatus;
 *
 */

public class ENWorkOrderStatusDAO extends ENWorkOrderStatusDAOGen {

    public ENWorkOrderStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENWorkOrderStatusDAO

