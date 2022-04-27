
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCalcAdditionalItemTypeDAOGen;

/**
 * DAO Object for ENCalcAdditionalItemType;
 *
 */

public class ENCalcAdditionalItemTypeDAO extends ENCalcAdditionalItemTypeDAOGen {

    public ENCalcAdditionalItemTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCalcAdditionalItemTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENCalcAdditionalItemTypeDAO
