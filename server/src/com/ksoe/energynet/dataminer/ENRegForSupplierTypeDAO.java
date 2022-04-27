
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENRegForSupplierTypeDAOGen;

/**
 * DAO Object for ENRegForSupplierType;
 *
 */

public class ENRegForSupplierTypeDAO extends ENRegForSupplierTypeDAOGen {

    public ENRegForSupplierTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENRegForSupplierTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENRegForSupplierTypeDAO
