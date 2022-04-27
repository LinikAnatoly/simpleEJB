//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENConnectionWorkTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENConnectionWorkType;
 *
 */

public class ENConnectionWorkTypeDAO extends ENConnectionWorkTypeDAOGen {

    public ENConnectionWorkTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionWorkTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENConnectionWorkTypeDAO

