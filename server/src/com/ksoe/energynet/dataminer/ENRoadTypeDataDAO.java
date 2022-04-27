//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENRoadTypeDataDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENRoadTypeData;
 *
 */

public class ENRoadTypeDataDAO extends ENRoadTypeDataDAOGen {

    public ENRoadTypeDataDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRoadTypeDataDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENRoadTypeDataDAO

