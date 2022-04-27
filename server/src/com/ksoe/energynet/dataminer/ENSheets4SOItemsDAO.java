
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSheets4SOItemsDAOGen;

/**
 * DAO Object for ENSheets4SOItems;
 *
 */

public class ENSheets4SOItemsDAO extends ENSheets4SOItemsDAOGen {

    public ENSheets4SOItemsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSheets4SOItemsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSheets4SOItemsDAO
