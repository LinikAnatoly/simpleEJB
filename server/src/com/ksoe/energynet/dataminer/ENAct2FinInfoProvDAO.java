
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAct2FinInfoProvDAOGen;

/**
 * DAO Object for ENAct2FinInfoProv;
 *
 */

public class ENAct2FinInfoProvDAO extends ENAct2FinInfoProvDAOGen {

    public ENAct2FinInfoProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2FinInfoProvDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENAct2FinInfoProvDAO
