
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENInspectionSheetStatusDAOGen;

/**
 * DAO Object for ENInspectionSheetStatus;
 *
 */

public class ENInspectionSheetStatusDAO extends ENInspectionSheetStatusDAOGen {

    public ENInspectionSheetStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInspectionSheetStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENInspectionSheetStatusDAO
