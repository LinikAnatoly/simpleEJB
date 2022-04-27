//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTiresInstallPlacesDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTiresInstallPlaces;
 *
 */

public class ENTiresInstallPlacesDAO extends ENTiresInstallPlacesDAOGen {

    public ENTiresInstallPlacesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTiresInstallPlacesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTiresInstallPlacesDAO

