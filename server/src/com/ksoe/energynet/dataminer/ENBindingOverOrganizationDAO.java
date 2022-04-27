//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENBindingOverOrganizationDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENBindingOverOrganization;
 *
 */

public class ENBindingOverOrganizationDAO extends
        ENBindingOverOrganizationDAOGen {

    public ENBindingOverOrganizationDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBindingOverOrganizationDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENBindingOverOrganizationDAO

