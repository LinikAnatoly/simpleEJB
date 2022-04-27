//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINWorkerKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINWorkerKind;
 *
 */

public class FINWorkerKindDAO extends FINWorkerKindDAOGen {

    public FINWorkerKindDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINWorkerKindDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINWorkerKindDAO

