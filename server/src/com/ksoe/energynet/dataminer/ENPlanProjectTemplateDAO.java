
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlanProjectTemplateDAOGen;

/**
 * DAO Object for ENPlanProjectTemplate;
 *
 */

public class ENPlanProjectTemplateDAO extends ENPlanProjectTemplateDAOGen {

    public ENPlanProjectTemplateDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanProjectTemplateDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


} // end of ENPlanProjectTemplateDAO
