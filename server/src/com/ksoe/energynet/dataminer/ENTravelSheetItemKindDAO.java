//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetItemKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetItemKind;
 *
 */

public class ENTravelSheetItemKindDAO extends ENTravelSheetItemKindDAOGen {

    public ENTravelSheetItemKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetItemKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetItemKindDAO

