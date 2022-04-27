
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENFuelInventarizationStatusDAOGen;

/**
 * DAO Object for ENFuelInventarizationStatus;
 *
 */

public class ENFuelInventarizationStatusDAO extends ENFuelInventarizationStatusDAOGen {

    public ENFuelInventarizationStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENFuelInventarizationStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENFuelInventarizationStatusDAO
