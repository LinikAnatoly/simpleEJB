
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDamageRecovery2ENActDAOGen;

/**
 * DAO Object for ENDamageRecovery2ENAct;
 *
 */

public class ENDamageRecovery2ENActDAO extends ENDamageRecovery2ENActDAOGen {

    public ENDamageRecovery2ENActDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDamageRecovery2ENActDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDamageRecovery2ENActDAO
