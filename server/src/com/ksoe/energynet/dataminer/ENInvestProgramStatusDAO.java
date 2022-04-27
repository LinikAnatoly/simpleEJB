
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENInvestProgramStatusDAOGen;

/**
 * DAO Object for ENInvestProgramStatus;
 *
 */

public class ENInvestProgramStatusDAO extends ENInvestProgramStatusDAOGen {

    public ENInvestProgramStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInvestProgramStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENInvestProgramStatusDAO
