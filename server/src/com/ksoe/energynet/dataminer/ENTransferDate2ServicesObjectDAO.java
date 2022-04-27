
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTransferDate2ServicesObjectDAOGen;

/**
 * DAO Object for ENTransferDate2ServicesObject;
 *
 */

public class ENTransferDate2ServicesObjectDAO extends ENTransferDate2ServicesObjectDAOGen {

    public ENTransferDate2ServicesObjectDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTransferDate2ServicesObjectDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENTransferDate2ServicesObjectDAO
