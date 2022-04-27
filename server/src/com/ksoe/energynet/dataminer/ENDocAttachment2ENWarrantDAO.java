
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachment2ENWarrantDAOGen;

/**
 * DAO Object for ENDocAttachment2ENWarrant;
 *
 */

public class ENDocAttachment2ENWarrantDAO extends ENDocAttachment2ENWarrantDAOGen {

    public ENDocAttachment2ENWarrantDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachment2ENWarrantDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENDocAttachment2ENWarrantDAO
