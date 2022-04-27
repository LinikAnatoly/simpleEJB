
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.AXOrgId2FKOrgIdDAOGen;

/**
 * DAO Object for AXOrgId2FKOrgId;
 *
 */

public class AXOrgId2FKOrgIdDAO extends AXOrgId2FKOrgIdDAOGen {

    public AXOrgId2FKOrgIdDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public AXOrgId2FKOrgIdDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of AXOrgId2FKOrgIdDAO
