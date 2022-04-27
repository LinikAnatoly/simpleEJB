
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSO2NodeTypeDAOGen;

/**
 * DAO Object for ENSO2NodeType;
 *
 */

public class ENSO2NodeTypeDAO extends ENSO2NodeTypeDAOGen {

    public ENSO2NodeTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSO2NodeTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSO2NodeTypeDAO
