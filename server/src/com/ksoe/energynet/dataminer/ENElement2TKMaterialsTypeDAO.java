
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENElement2TKMaterialsTypeDAOGen;

/**
 * DAO Object for ENElement2TKMaterialsType;
 *
 */

public class ENElement2TKMaterialsTypeDAO extends ENElement2TKMaterialsTypeDAOGen {

    public ENElement2TKMaterialsTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElement2TKMaterialsTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENElement2TKMaterialsTypeDAO
