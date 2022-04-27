
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENWorkOrderBytStatusDAOGen;

/**
 * DAO Object for ENWorkOrderBytStatus;
 *
 */

public class ENWorkOrderBytStatusDAO extends ENWorkOrderBytStatusDAOGen {

    public ENWorkOrderBytStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderBytStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENWorkOrderBytStatusDAO
