//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENWorkerDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENWorker;
 *
 */

public class ENWorkerDAO extends ENWorkerDAOGen {

    public ENWorkerDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkerDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENWorkerDAO

