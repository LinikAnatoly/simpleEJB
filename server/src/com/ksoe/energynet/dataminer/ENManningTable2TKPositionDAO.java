//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENManningTable2TKPositionDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENManningTable2TKPosition;
 *
 */

public class ENManningTable2TKPositionDAO extends
        ENManningTable2TKPositionDAOGen {

    public ENManningTable2TKPositionDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENManningTable2TKPositionDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENManningTable2TKPositionDAO

