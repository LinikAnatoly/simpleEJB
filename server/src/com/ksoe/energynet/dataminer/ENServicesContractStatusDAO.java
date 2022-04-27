//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesContractStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENServicesContractStatus;
 *
 */

public class ENServicesContractStatusDAO extends ENServicesContractStatusDAOGen {

    public ENServicesContractStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesContractStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENServicesContractStatusDAO

