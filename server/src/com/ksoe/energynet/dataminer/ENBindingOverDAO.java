//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENBindingOverDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENBindingOver;
 *
 */

public class ENBindingOverDAO extends ENBindingOverDAOGen {

    public ENBindingOverDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBindingOverDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENBindingOverDAO

