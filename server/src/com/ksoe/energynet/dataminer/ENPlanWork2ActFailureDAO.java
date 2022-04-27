
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlanWork2ActFailureDAOGen;

/**
 * DAO Object for ENPlanWork2ActFailure;
 *
 */

public class ENPlanWork2ActFailureDAO extends ENPlanWork2ActFailureDAOGen {

    public ENPlanWork2ActFailureDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWork2ActFailureDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanWork2ActFailureDAO
