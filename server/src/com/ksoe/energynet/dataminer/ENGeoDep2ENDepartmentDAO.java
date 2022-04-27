
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENGeoDep2ENDepartmentDAOGen;

/**
 * DAO Object for ENGeoDep2ENDepartment;
 *
 */

public class ENGeoDep2ENDepartmentDAO extends ENGeoDep2ENDepartmentDAOGen {

    public ENGeoDep2ENDepartmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENGeoDep2ENDepartmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENGeoDep2ENDepartmentDAO
