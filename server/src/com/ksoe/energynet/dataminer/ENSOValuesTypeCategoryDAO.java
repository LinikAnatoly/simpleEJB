
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSOValuesTypeCategoryDAOGen;

/**
 * DAO Object for ENSOValuesTypeCategory;
 *
 */

public class ENSOValuesTypeCategoryDAO extends ENSOValuesTypeCategoryDAOGen {

    public ENSOValuesTypeCategoryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOValuesTypeCategoryDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSOValuesTypeCategoryDAO
