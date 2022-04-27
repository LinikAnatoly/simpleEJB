//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENConnectionCalcTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENConnectionCalcType;
 *
 */

public class ENConnectionCalcTypeDAO extends ENConnectionCalcTypeDAOGen {

    public ENConnectionCalcTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionCalcTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENConnectionCalcTypeDAO

