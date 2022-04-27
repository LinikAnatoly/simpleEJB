//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENRoadTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENRoadType;
 *
 */

public class ENRoadTypeDAO extends ENRoadTypeDAOGen {

    public ENRoadTypeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRoadTypeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENRoadTypeDAO

