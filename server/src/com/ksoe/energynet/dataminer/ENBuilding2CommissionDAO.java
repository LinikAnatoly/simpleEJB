
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBuilding2CommissionDAOGen;

/**
 * DAO Object for ENBuilding2Commission;
 *
 */

public class ENBuilding2CommissionDAO extends ENBuilding2CommissionDAOGen {

    public ENBuilding2CommissionDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuilding2CommissionDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENBuilding2CommissionDAO
