
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportRealRepairDAOGen;

/**
 * DAO Object for ENTransportRealRepair;
 *
 */

public class ENTransportRealRepairDAO extends ENTransportRealRepairDAOGen {

    public ENTransportRealRepairDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTransportRealRepairDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENTransportRealRepairDAO
