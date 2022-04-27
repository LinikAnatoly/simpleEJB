
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachment2TKClassificationDAOGen;

/**
 * DAO Object for ENDocAttachment2TKClassification;
 *
 */

public class ENDocAttachment2TKClassificationDAO extends ENDocAttachment2TKClassificationDAOGen {

    public ENDocAttachment2TKClassificationDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachment2TKClassificationDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttachment2TKClassificationDAO
