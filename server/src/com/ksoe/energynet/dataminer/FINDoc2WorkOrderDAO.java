//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINDoc2WorkOrderDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for FINDoc2WorkOrder;
 *
 */

public class FINDoc2WorkOrderDAO extends FINDoc2WorkOrderDAOGen {

    public FINDoc2WorkOrderDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINDoc2WorkOrderDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of FINDoc2WorkOrderDAO

