
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAttachment2ServicesKindDAOGen;

/**
 * DAO Object for ENAttachment2ServicesKind;
 *
 */

public class ENAttachment2ServicesKindDAO extends ENAttachment2ServicesKindDAOGen {

    public ENAttachment2ServicesKindDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAttachment2ServicesKindDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENAttachment2ServicesKindDAO
