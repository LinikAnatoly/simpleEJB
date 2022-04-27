//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetType;
 *
 */

public class ENTravelSheetTypeDAO extends ENTravelSheetTypeDAOGen {

    public ENTravelSheetTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetTypeDAO

