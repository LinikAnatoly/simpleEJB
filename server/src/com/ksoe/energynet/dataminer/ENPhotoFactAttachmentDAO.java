
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPhotoFactAttachmentDAOGen;

/**
 * DAO Object for ENPhotoFactAttachment;
 *
 */

public class ENPhotoFactAttachmentDAO extends ENPhotoFactAttachmentDAOGen {

    public ENPhotoFactAttachmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPhotoFactAttachmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENPhotoFactAttachmentDAO
