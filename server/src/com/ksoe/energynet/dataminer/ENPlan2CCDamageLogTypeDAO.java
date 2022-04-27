
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlan2CCDamageLogTypeDAOGen;

/**
 * DAO Object for ENPlan2CCDamageLogType;
 *
 */

public class ENPlan2CCDamageLogTypeDAO extends ENPlan2CCDamageLogTypeDAOGen {

    public ENPlan2CCDamageLogTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlan2CCDamageLogTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlan2CCDamageLogTypeDAO
