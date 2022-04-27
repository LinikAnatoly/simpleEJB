
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENInvestProgram2PlanDAOGen;
import com.ksoe.energynet.valueobject.ENInvestProgram2Plan;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENInvestProgram2Plan;
 *
 */

public class ENInvestProgram2PlanDAO extends ENInvestProgram2PlanDAOGen {

    public ENInvestProgram2PlanDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInvestProgram2PlanDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENInvestProgram2Plan anObject) throws PersistenceException
    {
    	anObject.userAdd = getUserProfile().userName;
    	anObject.dateAdd = new Date();    	
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
        
    	return super.add(anObject);
    }    
    
    public void save(ENInvestProgram2Plan anObject) throws PersistenceException
    {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	
    	super.save(anObject);
    }
    
} // end of ENInvestProgram2PlanDAO
