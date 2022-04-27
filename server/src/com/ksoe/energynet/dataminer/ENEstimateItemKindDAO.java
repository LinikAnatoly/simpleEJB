//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENEstimateItemKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItemKind;
 *
 */

public class ENEstimateItemKindDAO extends ENEstimateItemKindDAOGen {

    public ENEstimateItemKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItemKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENEstimateItemKindDAO

