
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENMethodExecuteWorkDAOGen;

/**
 * DAO Object for ENMethodExecuteWork;
 *
 */

public class ENMethodExecuteWorkDAO extends ENMethodExecuteWorkDAOGen {

    public ENMethodExecuteWorkDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMethodExecuteWorkDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENMethodExecuteWorkDAO
