//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPurchasesObjectReasonDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPurchasesObjectReason;
 *
 */

public class ENPurchasesObjectReasonDAO extends ENPurchasesObjectReasonDAOGen {

    public ENPurchasesObjectReasonDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPurchasesObjectReasonDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENPurchasesObjectReasonDAO

