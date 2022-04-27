
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENGeographicDepartmentDAOGen;

/**
 * DAO Object for ENGeographicDepartment;
 *
 */

public class ENGeographicDepartmentDAO extends ENGeographicDepartmentDAOGen {

    public ENGeographicDepartmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENGeographicDepartmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENGeographicDepartmentDAO
