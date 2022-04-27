
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZ2ProvDAOGen;

/**
 * DAO Object for SCUsageInputItemOZ2Prov;
 *
 */

public class SCUsageInputItemOZ2ProvDAO extends SCUsageInputItemOZ2ProvDAOGen {

    public SCUsageInputItemOZ2ProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInputItemOZ2ProvDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCUsageInputItemOZ2ProvDAO
