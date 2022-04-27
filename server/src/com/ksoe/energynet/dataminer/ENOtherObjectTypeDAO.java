//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENOtherObjectTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENOtherObjectType;
 *
 */

public class ENOtherObjectTypeDAO extends ENOtherObjectTypeDAOGen {

    public ENOtherObjectTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENOtherObjectTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENOtherObjectTypeDAO

