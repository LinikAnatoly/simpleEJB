
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBuilding2ServicesObjectDAOGen;

/**
 * DAO Object for ENBuilding2ServicesObject;
 *
 */

public class ENBuilding2ServicesObjectDAO extends ENBuilding2ServicesObjectDAOGen {

    public ENBuilding2ServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuilding2ServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENBuilding2ServicesObjectDAO
