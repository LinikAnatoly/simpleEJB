//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransport2ENEstimateDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTransport2ENEstimate;
 *
 */

public class ENTransport2ENEstimateDAO extends ENTransport2ENEstimateDAOGen {

    public ENTransport2ENEstimateDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTransport2ENEstimateDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTransport2ENEstimateDAO

