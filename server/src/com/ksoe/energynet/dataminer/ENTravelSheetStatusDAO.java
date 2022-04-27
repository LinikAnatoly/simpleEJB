//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetStatus;
 *
 */

public class ENTravelSheetStatusDAO extends ENTravelSheetStatusDAOGen {

    public ENTravelSheetStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetStatusDAO

