
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAct2RQFKOrderTypeDAOGen;

/**
 * DAO Object for ENAct2RQFKOrderType;
 *
 */

public class ENAct2RQFKOrderTypeDAO extends ENAct2RQFKOrderTypeDAOGen {

    public ENAct2RQFKOrderTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2RQFKOrderTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENAct2RQFKOrderTypeDAO
