//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTiresInstallStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTiresInstallStatus;
 *
 */

public class ENTiresInstallStatusDAO extends ENTiresInstallStatusDAOGen {

    public ENTiresInstallStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTiresInstallStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTiresInstallStatusDAO

