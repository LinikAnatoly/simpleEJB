
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENReportAdditionZbytMetrologyDAOGen;

/**
 * DAO Object for ENReportAdditionZbytMetrology;
 *
 */

public class ENReportAdditionZbytMetrologyDAO extends ENReportAdditionZbytMetrologyDAOGen {

    public ENReportAdditionZbytMetrologyDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENReportAdditionZbytMetrologyDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENReportAdditionZbytMetrologyDAO
