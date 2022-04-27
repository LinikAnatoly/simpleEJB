
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENInvestObjectTypeDAOGen;

/**
 * DAO Object for ENInvestObjectType;
 *
 */

public class ENInvestObjectTypeDAO extends ENInvestObjectTypeDAOGen {

    public ENInvestObjectTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInvestObjectTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENInvestObjectTypeDAO
