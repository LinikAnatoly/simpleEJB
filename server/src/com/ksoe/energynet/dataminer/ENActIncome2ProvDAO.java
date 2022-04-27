
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActIncome2ProvDAOGen;

/**
 * DAO Object for ENActIncome2Prov;
 *
 */

public class ENActIncome2ProvDAO extends ENActIncome2ProvDAOGen {

    public ENActIncome2ProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncome2ProvDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActIncome2ProvDAO
