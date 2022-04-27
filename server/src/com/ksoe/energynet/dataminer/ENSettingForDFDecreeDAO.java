
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSettingForDFDecreeDAOGen;

/**
 * DAO Object for ENSettingForDFDecree;
 *
 */

public class ENSettingForDFDecreeDAO extends ENSettingForDFDecreeDAOGen {

    public ENSettingForDFDecreeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSettingForDFDecreeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSettingForDFDecreeDAO
