
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENFuelSheetVolumesStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENFuelSheetVolumesStatus;
 *
 */

public class ENFuelSheetVolumesStatusDAO extends ENFuelSheetVolumesStatusDAOGen {

    public ENFuelSheetVolumesStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelSheetVolumesStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENFuelSheetVolumesStatusDAO
