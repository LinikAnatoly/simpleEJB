
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActIncomeServices2SOBillDAOGen;

/**
 * DAO Object for ENActIncomeServices2SOBill;
 *
 */

public class ENActIncomeServices2SOBillDAO extends ENActIncomeServices2SOBillDAOGen {

    public ENActIncomeServices2SOBillDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncomeServices2SOBillDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENActIncomeServices2SOBillDAO
