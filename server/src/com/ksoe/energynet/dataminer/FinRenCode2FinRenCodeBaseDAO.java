
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.FinRenCode2FinRenCodeBaseDAOGen;

/**
 * DAO Object for FinRenCode2FinRenCodeBase;
 *
 */

public class FinRenCode2FinRenCodeBaseDAO extends FinRenCode2FinRenCodeBaseDAOGen {

    public FinRenCode2FinRenCodeBaseDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FinRenCode2FinRenCodeBaseDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FinRenCode2FinRenCodeBaseDAO
