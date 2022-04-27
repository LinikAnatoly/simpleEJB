
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENEstimateItemPlanPayDAOGen;
import com.ksoe.energynet.valueobject.ENEstimateItemPlanPay;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENEstimateItemPlanPay;
 *
 */

public class ENEstimateItemPlanPayDAO extends ENEstimateItemPlanPayDAOGen {

    public ENEstimateItemPlanPayDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENEstimateItemPlanPayDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENEstimateItemPlanPay anObject) throws PersistenceException
    {
    	anObject.userAdd = getUserProfile().userName;
    	anObject.dateAdd = new Date();    	
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        
    	return super.add(anObject);
    }    
    
    public void save(ENEstimateItemPlanPay anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	
    	super.save(anObject);
    }    
} // end of ENEstimateItemPlanPayDAO
