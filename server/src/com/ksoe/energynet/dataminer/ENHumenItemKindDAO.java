//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENHumenItemKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENHumenItemKind;
 *
 */

public class ENHumenItemKindDAO extends ENHumenItemKindDAOGen {

    public ENHumenItemKindDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENHumenItemKindDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENHumenItemKindDAO

