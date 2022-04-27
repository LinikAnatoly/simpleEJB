//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDistanceTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDistanceType;
 *
 */

public class ENDistanceTypeDAO extends ENDistanceTypeDAOGen {

    public ENDistanceTypeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDistanceTypeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDistanceTypeDAO

