//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENBuilderObjectTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENBuilderObjectType;
 *
 */

public class ENBuilderObjectTypeDAO extends ENBuilderObjectTypeDAOGen {

    public ENBuilderObjectTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBuilderObjectTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENBuilderObjectTypeDAO

