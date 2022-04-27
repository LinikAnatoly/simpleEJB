//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENActStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENActStatus;
 *
 */

public class ENActStatusDAO extends ENActStatusDAOGen {

    public ENActStatusDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActStatusDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENActStatusDAO

