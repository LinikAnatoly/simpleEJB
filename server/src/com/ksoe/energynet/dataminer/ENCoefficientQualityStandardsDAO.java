
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENCoefficientQualityStandardsDAOGen;

/**
 * DAO Object for ENCoefficientQualityStandards;
 *
 */

public class ENCoefficientQualityStandardsDAO extends ENCoefficientQualityStandardsDAOGen {

    public ENCoefficientQualityStandardsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCoefficientQualityStandardsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENCoefficientQualityStandardsDAO
