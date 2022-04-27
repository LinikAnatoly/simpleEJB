
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENEstimateItem2PlanDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItem2Plan;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItem2Plan;
 *
 */

public class ENEstimateItem2PlanDAO extends ENEstimateItem2PlanDAOGen {

    public ENEstimateItem2PlanDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItem2PlanDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENEstimateItem2Plan anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENEstimateItem2Plan anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    

} // end of ENEstimateItem2PlanDAO
