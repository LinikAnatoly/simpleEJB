
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelDAOGen;

/**
 * DAO Object for ENTravelSheetFuel;
 *
 */

public class ENTravelSheetFuelDAO extends ENTravelSheetFuelDAOGen {

    public ENTravelSheetFuelDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetFuelDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelSheetFuelDAO
