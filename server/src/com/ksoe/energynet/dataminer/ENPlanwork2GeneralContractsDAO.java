
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlanwork2GeneralContractsDAOGen;

/**
 * DAO Object for ENPlanwork2GeneralContracts;
 *
 */

public class ENPlanwork2GeneralContractsDAO extends ENPlanwork2GeneralContractsDAOGen {

    public ENPlanwork2GeneralContractsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanwork2GeneralContractsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENPlanwork2GeneralContractsDAO
