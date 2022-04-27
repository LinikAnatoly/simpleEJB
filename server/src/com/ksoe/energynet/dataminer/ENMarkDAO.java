//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMarkDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENMark;
 *
 */

public class ENMarkDAO extends ENMarkDAOGen {

    public ENMarkDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMarkDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENMarkDAO

