
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.CNPack2SiteDAOGen;

/**
 * DAO Object for CNPack2Site;
 *
 */

public class CNPack2SiteDAO extends CNPack2SiteDAOGen {

    public CNPack2SiteDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public CNPack2SiteDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of CNPack2SiteDAO
