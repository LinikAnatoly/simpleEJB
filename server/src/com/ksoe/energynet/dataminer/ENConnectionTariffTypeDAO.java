
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionTariffTypeDAOGen;

/**
 * DAO Object for ENConnectionTariffType;
 *
 */

public class ENConnectionTariffTypeDAO extends ENConnectionTariffTypeDAOGen {

    public ENConnectionTariffTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENConnectionTariffTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENConnectionTariffTypeDAO
