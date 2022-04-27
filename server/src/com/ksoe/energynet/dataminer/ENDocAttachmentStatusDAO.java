
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDocAttachmentStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDocAttachmentStatus;
 *
 */

public class ENDocAttachmentStatusDAO extends ENDocAttachmentStatusDAOGen {

    public ENDocAttachmentStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachmentStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDocAttachmentStatusDAO
