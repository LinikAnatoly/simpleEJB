
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAct2DFDocDecreeDAOGen;

/**
 * DAO Object for ENAct2DFDocDecree;
 *
 */

public class ENAct2DFDocDecreeDAO extends ENAct2DFDocDecreeDAOGen {

    public ENAct2DFDocDecreeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2DFDocDecreeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENAct2DFDocDecreeDAO
