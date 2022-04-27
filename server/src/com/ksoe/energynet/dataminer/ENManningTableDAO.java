//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENManningTableDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENManningTable;
 *
 */

public class ENManningTableDAO extends ENManningTableDAOGen {

    public ENManningTableDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENManningTableDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENManningTableDAO

