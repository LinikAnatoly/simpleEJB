
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENElement2TKMaterialsDAOGen;

/**
 * DAO Object for ENElement2TKMaterials;
 *
 */

public class ENElement2TKMaterialsDAO extends ENElement2TKMaterialsDAOGen {

    public ENElement2TKMaterialsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElement2TKMaterialsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENElement2TKMaterialsDAO
