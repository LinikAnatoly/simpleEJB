//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPurchasesNoObjectTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPurchasesNoObjectType;
 *
 */

public class ENPurchasesNoObjectTypeDAO extends ENPurchasesNoObjectTypeDAOGen {

    public ENPurchasesNoObjectTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPurchasesNoObjectTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPurchasesNoObjectTypeDAO

