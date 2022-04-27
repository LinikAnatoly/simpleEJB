
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENRegForSupplierStatusDAOGen;

/**
 * DAO Object for ENRegForSupplierStatus;
 *
 */

public class ENRegForSupplierStatusDAO extends ENRegForSupplierStatusDAOGen {

    public ENRegForSupplierStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRegForSupplierStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENRegForSupplierStatusDAO
