
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENMOLSTOREKEEPER2PlanWorkDAOGen;

/**
 * DAO Object for ENMOLSTOREKEEPER2PlanWork;
 *
 */

public class ENMOLSTOREKEEPER2PlanWorkDAO extends ENMOLSTOREKEEPER2PlanWorkDAOGen {

    public ENMOLSTOREKEEPER2PlanWorkDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMOLSTOREKEEPER2PlanWorkDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENMOLSTOREKEEPER2PlanWorkDAO
