
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENDocAttachment2ENServicesObjectDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENDocAttachment2ENServicesObject;
 *
 */

public class ENDocAttachment2ENServicesObjectDAO extends ENDocAttachment2ENServicesObjectDAOGen {

    public ENDocAttachment2ENServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachment2ENServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDocAttachment2ENServicesObjectDAO
