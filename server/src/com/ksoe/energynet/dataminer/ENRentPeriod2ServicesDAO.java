
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENRentPeriod2ServicesDAOGen;

/**
 * DAO Object for ENRentPeriod2Services;
 *
 */

public class ENRentPeriod2ServicesDAO extends ENRentPeriod2ServicesDAOGen {

    public ENRentPeriod2ServicesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRentPeriod2ServicesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENRentPeriod2ServicesDAO
