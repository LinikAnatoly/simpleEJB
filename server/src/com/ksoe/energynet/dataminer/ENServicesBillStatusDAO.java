//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesBillStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENServicesBillStatus;
 *
 */

public class ENServicesBillStatusDAO extends ENServicesBillStatusDAOGen {

    public ENServicesBillStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesBillStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENServicesBillStatusDAO

