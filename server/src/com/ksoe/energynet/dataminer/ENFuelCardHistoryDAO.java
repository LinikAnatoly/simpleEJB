
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelCardHistoryDAOGen;

/**
 * DAO Object for ENFuelCardHistory;
 *
 */

public class ENFuelCardHistoryDAO extends ENFuelCardHistoryDAOGen {

    public ENFuelCardHistoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelCardHistoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENFuelCardHistoryDAO
