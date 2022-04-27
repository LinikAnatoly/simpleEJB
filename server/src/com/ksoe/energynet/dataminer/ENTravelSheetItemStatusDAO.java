//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetItemStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetItemStatus;
 *
 */

public class ENTravelSheetItemStatusDAO extends ENTravelSheetItemStatusDAOGen {

    public ENTravelSheetItemStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetItemStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetItemStatusDAO

