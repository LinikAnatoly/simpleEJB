//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINMolTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINMolType;
 *
 */

public class FINMolTypeDAO extends FINMolTypeDAOGen {

    public FINMolTypeDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINMolTypeDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINMolTypeDAO

