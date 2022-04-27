
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBuilding2ENactDAOGen;

/**
 * DAO Object for ENBuilding2ENact;
 *
 */

public class ENBuilding2ENactDAO extends ENBuilding2ENactDAOGen {

    public ENBuilding2ENactDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuilding2ENactDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENBuilding2ENactDAO
