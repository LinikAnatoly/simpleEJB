
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSheets4SOItemsTemplateDAOGen;

/**
 * DAO Object for ENSheets4SOItemsTemplate;
 *
 */

public class ENSheets4SOItemsTemplateDAO extends ENSheets4SOItemsTemplateDAOGen {

    public ENSheets4SOItemsTemplateDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSheets4SOItemsTemplateDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSheets4SOItemsTemplateDAO
