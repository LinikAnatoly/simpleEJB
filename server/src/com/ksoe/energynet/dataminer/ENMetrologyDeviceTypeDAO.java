//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMetrologyDeviceTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENMetrologyDeviceType;
 *
 */

public class ENMetrologyDeviceTypeDAO extends ENMetrologyDeviceTypeDAOGen {

    public ENMetrologyDeviceTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMetrologyDeviceTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENMetrologyDeviceTypeDAO

