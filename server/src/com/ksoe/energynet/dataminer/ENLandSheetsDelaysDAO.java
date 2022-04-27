
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENLandSheetsDelaysDAOGen;

/**
 * DAO Object for ENLandSheetsDelays;
 *
 */

public class ENLandSheetsDelaysDAO extends ENLandSheetsDelaysDAOGen {

    public ENLandSheetsDelaysDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENLandSheetsDelaysDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENLandSheetsDelaysDAO
