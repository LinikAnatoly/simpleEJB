
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENWorkOrderBytTypeDAOGen;

/**
 * DAO Object for ENWorkOrderBytType;
 *
 */

public class ENWorkOrderBytTypeDAO extends ENWorkOrderBytTypeDAOGen {

    public ENWorkOrderBytTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderBytTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENWorkOrderBytTypeDAO
