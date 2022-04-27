
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENActPostingSpecCharactersDAOGen;

/**
 * DAO Object for ENActPostingSpecCharacters;
 *
 */

public class ENActPostingSpecCharactersDAO extends ENActPostingSpecCharactersDAOGen {

    public ENActPostingSpecCharactersDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActPostingSpecCharactersDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENActPostingSpecCharactersDAO
