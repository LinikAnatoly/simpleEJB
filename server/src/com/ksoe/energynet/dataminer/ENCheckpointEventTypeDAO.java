
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCheckpointEventTypeDAOGen;

/**
 * DAO Object for ENCheckpointEventType;
 *
 */

public class ENCheckpointEventTypeDAO extends ENCheckpointEventTypeDAOGen {

    public ENCheckpointEventTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCheckpointEventTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENCheckpointEventTypeDAO
