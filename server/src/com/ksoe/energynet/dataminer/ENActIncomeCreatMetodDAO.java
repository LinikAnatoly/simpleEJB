
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActIncomeCreatMetodDAOGen;

/**
 * DAO Object for ENActIncomeCreatMetod;
 *
 */

public class ENActIncomeCreatMetodDAO extends ENActIncomeCreatMetodDAOGen {

    public ENActIncomeCreatMetodDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncomeCreatMetodDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActIncomeCreatMetodDAO
