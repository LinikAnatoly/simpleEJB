
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENPlanWork2CCDamageLogDAOGen;
import com.ksoe.energynet.valueobject.ENPlanWork2CCDamageLog;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENPlanWork2CCDamageLog;
 *
 */

public class ENPlanWork2CCDamageLogDAO extends ENPlanWork2CCDamageLogDAOGen {

    public ENPlanWork2CCDamageLogDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanWork2CCDamageLogDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENPlanWork2CCDamageLog anObject) throws PersistenceException
    {
    	anObject.userAdd = getUserProfile().userName;
    	anObject.dateAdd = new Date();    	
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        
    	return super.add(anObject);
    }    
    
    public void save(ENPlanWork2CCDamageLog anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	
    	super.save(anObject);
    }    

} // end of ENPlanWork2CCDamageLogDAO
