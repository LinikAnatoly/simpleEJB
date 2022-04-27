
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSO2SecObjectRespDAOGen;

/**
 * DAO Object for ENSO2SecObjectResp;
 *
 */

public class ENSO2SecObjectRespDAO extends ENSO2SecObjectRespDAOGen {

    public ENSO2SecObjectRespDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSO2SecObjectRespDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENSO2SecObjectRespDAO
