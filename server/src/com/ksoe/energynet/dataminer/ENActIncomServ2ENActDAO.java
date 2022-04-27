
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActIncomServ2ENActDAOGen;

/**
 * DAO Object for ENActIncomServ2ENAct;
 *
 */

public class ENActIncomServ2ENActDAO extends ENActIncomServ2ENActDAOGen {

    public ENActIncomServ2ENActDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncomServ2ENActDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActIncomServ2ENActDAO
