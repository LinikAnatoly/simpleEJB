//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENManagementDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENManagement;
 *
 */

public class ENManagementDAO extends ENManagementDAOGen {

    public ENManagementDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENManagementDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENManagementDAO

