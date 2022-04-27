
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSO2SecObjectDAOGen;

/**
 * DAO Object for ENSO2SecObject;
 *
 */

public class ENSO2SecObjectDAO extends ENSO2SecObjectDAOGen {

    public ENSO2SecObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSO2SecObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENSO2SecObjectDAO
