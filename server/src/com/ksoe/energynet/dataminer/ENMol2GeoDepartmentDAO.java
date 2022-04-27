
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENMol2GeoDepartmentDAOGen;

/**
 * DAO Object for ENMol2GeoDepartment;
 *
 */

public class ENMol2GeoDepartmentDAO extends ENMol2GeoDepartmentDAOGen {

    public ENMol2GeoDepartmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMol2GeoDepartmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENMol2GeoDepartmentDAO
