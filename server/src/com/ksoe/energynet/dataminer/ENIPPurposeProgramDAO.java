
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENIPPurposeProgramDAOGen;

/**
 * DAO Object for ENIPPurposeProgram;
 *
 */

public class ENIPPurposeProgramDAO extends ENIPPurposeProgramDAOGen {

    public ENIPPurposeProgramDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPPurposeProgramDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENIPPurposeProgramDAO
