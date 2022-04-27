
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionPowerPointDAOGen;

/**
 * DAO Object for ENConnectionPowerPoint;
 *
 */

public class ENConnectionPowerPointDAO extends ENConnectionPowerPointDAOGen {

    public ENConnectionPowerPointDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionPowerPointDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENConnectionPowerPointDAO
