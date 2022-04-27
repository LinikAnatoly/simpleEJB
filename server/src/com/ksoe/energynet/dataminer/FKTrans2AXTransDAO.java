
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.FKTrans2AXTransDAOGen;

/**
 * DAO Object for FKTrans2AXTrans;
 *
 */

public class FKTrans2AXTransDAO extends FKTrans2AXTransDAOGen {

    public FKTrans2AXTransDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FKTrans2AXTransDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FKTrans2AXTransDAO
