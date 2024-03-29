
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBuilding2OSDataDAOGen;

/**
 * DAO Object for ENBuilding2OSData;
 *
 */

public class ENBuilding2OSDataDAO extends ENBuilding2OSDataDAOGen {

    public ENBuilding2OSDataDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuilding2OSDataDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENBuilding2OSDataDAO
