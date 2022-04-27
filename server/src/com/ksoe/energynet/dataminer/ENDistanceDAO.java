//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDistanceDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDistance;
 *
 */

public class ENDistanceDAO extends ENDistanceDAOGen {

    public ENDistanceDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDistanceDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDistanceDAO

