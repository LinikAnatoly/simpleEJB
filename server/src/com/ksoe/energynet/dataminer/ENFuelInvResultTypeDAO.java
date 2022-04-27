
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelInvResultTypeDAOGen;

/**
 * DAO Object for ENFuelInvResultType;
 *
 */

public class ENFuelInvResultTypeDAO extends ENFuelInvResultTypeDAOGen {

    public ENFuelInvResultTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelInvResultTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENFuelInvResultTypeDAO
