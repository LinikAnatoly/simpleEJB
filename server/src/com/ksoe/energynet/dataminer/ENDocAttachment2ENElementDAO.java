
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachment2ENElementDAOGen;

/**
 * DAO Object for ENDocAttachment2ENElement;
 *
 */

public class ENDocAttachment2ENElementDAO extends ENDocAttachment2ENElementDAOGen {

    public ENDocAttachment2ENElementDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachment2ENElementDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttachment2ENElementDAO
