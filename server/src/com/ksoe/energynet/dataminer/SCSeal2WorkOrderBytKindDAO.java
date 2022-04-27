
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.SCSeal2WorkOrderBytKindDAOGen;

/**
 * DAO Object for SCSeal2WorkOrderBytKind;
 *
 */

public class SCSeal2WorkOrderBytKindDAO extends SCSeal2WorkOrderBytKindDAOGen {

    public SCSeal2WorkOrderBytKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCSeal2WorkOrderBytKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of SCSeal2WorkOrderBytKindDAO
