
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENIPImplementationTypeDAOGen;

/**
 * DAO Object for ENIPImplementationType;
 *
 */

public class ENIPImplementationTypeDAO extends ENIPImplementationTypeDAOGen {

    public ENIPImplementationTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPImplementationTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENIPImplementationTypeDAO
