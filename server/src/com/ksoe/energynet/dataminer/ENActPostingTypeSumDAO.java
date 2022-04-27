
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActPostingTypeSumDAOGen;

/**
 * DAO Object for ENActPostingTypeSum;
 *
 */

public class ENActPostingTypeSumDAO extends ENActPostingTypeSumDAOGen {

    public ENActPostingTypeSumDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActPostingTypeSumDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActPostingTypeSumDAO
