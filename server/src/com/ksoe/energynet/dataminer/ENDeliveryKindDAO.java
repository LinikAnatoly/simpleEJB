//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDeliveryKindDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDeliveryKind;
 *
 */

public class ENDeliveryKindDAO extends ENDeliveryKindDAOGen {

    public ENDeliveryKindDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDeliveryKindDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDeliveryKindDAO

