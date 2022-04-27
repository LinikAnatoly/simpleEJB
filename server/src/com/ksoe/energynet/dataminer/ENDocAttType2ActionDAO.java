
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttType2ActionDAOGen;

/**
 * DAO Object for ENDocAttType2Action;
 *
 */

public class ENDocAttType2ActionDAO extends ENDocAttType2ActionDAOGen {

    public ENDocAttType2ActionDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttType2ActionDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttType2ActionDAO
