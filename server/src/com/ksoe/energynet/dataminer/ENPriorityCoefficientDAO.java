
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPriorityCoefficientDAOGen;

/**
 * DAO Object for ENPriorityCoefficient;
 *
 */

public class ENPriorityCoefficientDAO extends ENPriorityCoefficientDAOGen {

    public ENPriorityCoefficientDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPriorityCoefficientDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENPriorityCoefficientDAO
