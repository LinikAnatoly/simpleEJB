//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENElement2EstimateItemDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENElement2EstimateItem;
 *
 */

public class ENElement2EstimateItemDAO extends ENElement2EstimateItemDAOGen {

    public ENElement2EstimateItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElement2EstimateItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENElement2EstimateItemDAO

