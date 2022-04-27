
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENElement2ENElementTypeDAOGen;

/**
 * DAO Object for ENElement2ENElementType;
 *
 */

public class ENElement2ENElementTypeDAO extends ENElement2ENElementTypeDAOGen {

    public ENElement2ENElementTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElement2ENElementTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENElement2ENElementTypeDAO
