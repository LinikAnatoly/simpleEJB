
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServicesObjectKindFKDAOGen;

/**
 * DAO Object for ENServicesObjectKindFK;
 *
 */

public class ENServicesObjectKindFKDAO extends ENServicesObjectKindFKDAOGen {

    public ENServicesObjectKindFKDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesObjectKindFKDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENServicesObjectKindFKDAO
