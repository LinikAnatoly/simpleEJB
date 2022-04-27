
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTechAgr2SOKindDAOGen;

/**
 * DAO Object for ENTechAgr2SOKind;
 *
 */

public class ENTechAgr2SOKindDAO extends ENTechAgr2SOKindDAOGen {

    public ENTechAgr2SOKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTechAgr2SOKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTechAgr2SOKindDAO
