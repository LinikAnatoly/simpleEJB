//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINDocTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINDocType;
 *
 */

public class FINDocTypeDAO extends FINDocTypeDAOGen {

    public FINDocTypeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINDocTypeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINDocTypeDAO

