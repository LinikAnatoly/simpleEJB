
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTenderPurchaseKindDAOGen;

/**
 * DAO Object for ENTenderPurchaseKind;
 *
 */

public class ENTenderPurchaseKindDAO extends ENTenderPurchaseKindDAOGen {

    public ENTenderPurchaseKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTenderPurchaseKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTenderPurchaseKindDAO
