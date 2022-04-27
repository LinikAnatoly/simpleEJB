//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINDoc2ActDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINDoc2Act;
 *
 */

public class FINDoc2ActDAO extends FINDoc2ActDAOGen {

    public FINDoc2ActDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINDoc2ActDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINDoc2ActDAO

