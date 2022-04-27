
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlanProjectCalculationDAOGen;

/**
 * DAO Object for ENPlanProjectCalculation;
 *
 */

public class ENPlanProjectCalculationDAO extends ENPlanProjectCalculationDAOGen {

    public ENPlanProjectCalculationDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanProjectCalculationDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENPlanProjectCalculationDAO
