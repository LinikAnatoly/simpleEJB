//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesContragentTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENServicesContragentType;
 *
 */

public class ENServicesContragentTypeDAO extends ENServicesContragentTypeDAOGen {

    public ENServicesContragentTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesContragentTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENServicesContragentTypeDAO

