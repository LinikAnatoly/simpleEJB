//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Sat Sep 26 14:38:30 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanWorkStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanWorkStatus;
 *
 */

public class ENPlanWorkStatusDAO extends ENPlanWorkStatusDAOGen {

    public ENPlanWorkStatusDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWorkStatusDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPlanWorkStatusDAO

