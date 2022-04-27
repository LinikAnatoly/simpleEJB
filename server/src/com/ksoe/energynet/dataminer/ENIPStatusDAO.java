
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENIPStatusDAOGen;

/**
 * DAO Object for ENIPStatus;
 *
 */

public class ENIPStatusDAO extends ENIPStatusDAOGen {

    public ENIPStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENIPStatusDAO
