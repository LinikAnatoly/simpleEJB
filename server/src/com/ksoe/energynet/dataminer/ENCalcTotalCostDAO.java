//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENCalcTotalCostDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENCalcTotalCost;
 *
 */

public class ENCalcTotalCostDAO extends ENCalcTotalCostDAOGen {

    public ENCalcTotalCostDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCalcTotalCostDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENCalcTotalCostDAO

