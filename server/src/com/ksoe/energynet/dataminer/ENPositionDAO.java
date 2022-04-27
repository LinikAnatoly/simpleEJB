//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPositionDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPosition;
 *
 */

public class ENPositionDAO extends ENPositionDAOGen {

    public ENPositionDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPositionDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPositionDAO

