//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENCfoDataDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENCfoData;
 *
 */

public class ENCfoDataDAO extends ENCfoDataDAOGen {

    public ENCfoDataDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCfoDataDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENCfoDataDAO

