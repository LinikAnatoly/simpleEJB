
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransportDep2UserDAOGen;

/**
 * DAO Object for ENTransportDep2User;
 *
 */

public class ENTransportDep2UserDAO extends ENTransportDep2UserDAOGen {

    public ENTransportDep2UserDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTransportDep2UserDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENTransportDep2UserDAO
