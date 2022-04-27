
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDisconnectInitiatorDAOGen;

/**
 * DAO Object for ENDisconnectInitiator;
 *
 */

public class ENDisconnectInitiatorDAO extends ENDisconnectInitiatorDAOGen {

    public ENDisconnectInitiatorDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDisconnectInitiatorDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDisconnectInitiatorDAO
