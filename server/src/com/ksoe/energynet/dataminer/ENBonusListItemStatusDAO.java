
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENBonusListItemStatusDAOGen;

/**
 * DAO Object for ENBonusListItemStatus;
 *
 */

public class ENBonusListItemStatusDAO extends ENBonusListItemStatusDAOGen {

    public ENBonusListItemStatusDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBonusListItemStatusDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

} // end of ENBonusListItemStatusDAO
