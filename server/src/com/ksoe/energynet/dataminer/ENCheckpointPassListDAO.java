
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCheckpointPassListDAOGen;

/**
 * DAO Object for ENCheckpointPassList;
 *
 */

public class ENCheckpointPassListDAO extends ENCheckpointPassListDAOGen {

    public ENCheckpointPassListDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCheckpointPassListDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENCheckpointPassListDAO
