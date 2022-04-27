
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFamilySize2ServicesObjectDAOGen;

/**
 * DAO Object for ENFamilySize2ServicesObject;
 *
 */

public class ENFamilySize2ServicesObjectDAO extends ENFamilySize2ServicesObjectDAOGen {

    public ENFamilySize2ServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFamilySize2ServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENFamilySize2ServicesObjectDAO
