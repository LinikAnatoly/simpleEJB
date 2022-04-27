//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelWorkModeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelWorkMode;
 *
 */

public class ENTravelWorkModeDAO extends ENTravelWorkModeDAOGen {

    public ENTravelWorkModeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelWorkModeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTravelWorkModeDAO

