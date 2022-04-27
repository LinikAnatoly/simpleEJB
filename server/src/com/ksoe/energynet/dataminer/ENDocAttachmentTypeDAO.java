
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachmentTypeDAOGen;

/**
 * DAO Object for ENDocAttachmentType;
 *
 */

public class ENDocAttachmentTypeDAO extends ENDocAttachmentTypeDAOGen {

    public ENDocAttachmentTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachmentTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttachmentTypeDAO
