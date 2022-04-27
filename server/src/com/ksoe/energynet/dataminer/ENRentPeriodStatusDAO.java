
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENRentPeriodStatusDAOGen;

/**
 * DAO Object for ENRentPeriodStatus;
 *
 */

public class ENRentPeriodStatusDAO extends ENRentPeriodStatusDAOGen {

    public ENRentPeriodStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRentPeriodStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENRentPeriodStatusDAO
