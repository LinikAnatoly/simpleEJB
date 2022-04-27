//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Thu Oct 08 13:57:38 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDepartmentTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDepartmentType;
 *
 */

public class ENDepartmentTypeDAO extends ENDepartmentTypeDAOGen {

    public ENDepartmentTypeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDepartmentTypeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDepartmentTypeDAO

