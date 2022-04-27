
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAgreeData2ServicesObjectDAOGen;

/**
 * DAO Object for ENAgreeData2ServicesObject;
 *
 */

public class ENAgreeData2ServicesObjectDAO extends ENAgreeData2ServicesObjectDAOGen {

    public ENAgreeData2ServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAgreeData2ServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENAgreeData2ServicesObjectDAO
