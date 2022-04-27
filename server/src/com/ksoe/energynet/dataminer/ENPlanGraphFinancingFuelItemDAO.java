
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENPlanGraphFinancingFuelItemDAOGen;
import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuelItem;

/**
 * DAO Object for ENPlanGraphFinancingFuelItem;
 *
 */

public class ENPlanGraphFinancingFuelItemDAO extends ENPlanGraphFinancingFuelItemDAOGen {

    public ENPlanGraphFinancingFuelItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanGraphFinancingFuelItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENPlanGraphFinancingFuelItem anObject) throws PersistenceException {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	return super.add(anObject);
    }
    
    @Override
    public void save(ENPlanGraphFinancingFuelItem anObject) throws PersistenceException {
    	anObject.userGen = getUserProfile().userName;
    	anObject.dateEdit = new Date();
    	super.save(anObject);
    }

} // end of ENPlanGraphFinancingFuelItemDAO
