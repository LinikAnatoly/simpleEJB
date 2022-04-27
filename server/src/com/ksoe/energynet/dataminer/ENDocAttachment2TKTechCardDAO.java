
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDocAttachment2TKTechCardDAOGen;

/**
 * DAO Object for ENDocAttachment2TKTechCard;
 *
 */

public class ENDocAttachment2TKTechCardDAO extends ENDocAttachment2TKTechCardDAOGen {

    public ENDocAttachment2TKTechCardDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDocAttachment2TKTechCardDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENDocAttachment2TKTechCardDAO
