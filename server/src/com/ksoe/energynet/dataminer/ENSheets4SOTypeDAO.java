
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSheets4SOTypeDAOGen;

/**
 * DAO Object for ENSheets4SOType;
 *
 */

public class ENSheets4SOTypeDAO extends ENSheets4SOTypeDAOGen {

    public ENSheets4SOTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSheets4SOTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSheets4SOTypeDAO
