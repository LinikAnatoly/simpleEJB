//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetItem2TransportItemDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetItem2TransportItem;
 *
 */

public class ENTravelSheetItem2TransportItemDAO extends
        ENTravelSheetItem2TransportItemDAOGen {

    public ENTravelSheetItem2TransportItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetItem2TransportItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetItem2TransportItemDAO

