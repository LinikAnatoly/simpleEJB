
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSO2DistrAgreeDAOGen;

/**
 * DAO Object for ENSO2DistrAgree;
 *
 */

public class ENSO2DistrAgreeDAO extends ENSO2DistrAgreeDAOGen {

    public ENSO2DistrAgreeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSO2DistrAgreeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSO2DistrAgreeDAO
