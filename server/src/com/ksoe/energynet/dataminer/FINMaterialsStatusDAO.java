//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINMaterialsStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINMaterialsStatus;
 *
 */

public class FINMaterialsStatusDAO extends FINMaterialsStatusDAOGen {

    public FINMaterialsStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINMaterialsStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINMaterialsStatusDAO

