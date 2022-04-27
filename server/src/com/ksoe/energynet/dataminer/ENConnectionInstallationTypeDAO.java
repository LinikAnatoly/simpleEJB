
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionInstallationTypeDAOGen;

/**
 * DAO Object for ENConnectionInstallationType;
 *
 */

public class ENConnectionInstallationTypeDAO extends ENConnectionInstallationTypeDAOGen {

    public ENConnectionInstallationTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionInstallationTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENConnectionInstallationTypeDAO
