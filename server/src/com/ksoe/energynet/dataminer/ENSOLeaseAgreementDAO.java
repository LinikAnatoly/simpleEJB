
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSOLeaseAgreementDAOGen;

/**
 * DAO Object for ENSOLeaseAgreement;
 *
 */

public class ENSOLeaseAgreementDAO extends ENSOLeaseAgreementDAOGen {

    public ENSOLeaseAgreementDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOLeaseAgreementDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENSOLeaseAgreementDAO
