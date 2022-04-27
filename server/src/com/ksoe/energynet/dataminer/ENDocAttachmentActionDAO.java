
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachmentActionDAOGen;

/**
 * DAO Object for ENDocAttachmentAction;
 *
 */

public class ENDocAttachmentActionDAO extends ENDocAttachmentActionDAOGen {

    public ENDocAttachmentActionDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachmentActionDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttachmentActionDAO
