
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActInvestType2DFDocDAOGen;

/**
 * DAO Object for ENActInvestType2DFDoc;
 *
 */

public class ENActInvestType2DFDocDAO extends ENActInvestType2DFDocDAOGen {

    public ENActInvestType2DFDocDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActInvestType2DFDocDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActInvestType2DFDocDAO
