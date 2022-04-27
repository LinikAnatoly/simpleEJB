
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelFillDAOGen;

/**
 * DAO Object for ENTravelSheetFuelFill;
 *
 */

public class ENTravelSheetFuelFillDAO extends ENTravelSheetFuelFillDAOGen {

    public ENTravelSheetFuelFillDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetFuelFillDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetFuelFillDAO
