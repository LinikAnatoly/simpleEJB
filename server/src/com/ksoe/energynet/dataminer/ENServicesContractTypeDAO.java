//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesContractTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENServicesContractType;
 *
 */

public class ENServicesContractTypeDAO extends ENServicesContractTypeDAOGen {

    public ENServicesContractTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesContractTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENServicesContractTypeDAO

