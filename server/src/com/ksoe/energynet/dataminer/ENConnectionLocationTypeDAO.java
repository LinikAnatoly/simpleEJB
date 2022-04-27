
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionLocationTypeDAOGen;

/**
 * DAO Object for ENConnectionLocationType;
 *
 */

public class ENConnectionLocationTypeDAO extends ENConnectionLocationTypeDAOGen {

    public ENConnectionLocationTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionLocationTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENConnectionLocationTypeDAO
