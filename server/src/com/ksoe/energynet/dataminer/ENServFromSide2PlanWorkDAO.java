
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServFromSide2PlanWorkDAOGen;
import com.ksoe.energynet.valueobject.filter.ENServFromSide2PlanWorkFilter;

/**
 * DAO Object for ENServFromSide2PlanWork;
 *
 */

public class ENServFromSide2PlanWorkDAO extends ENServFromSide2PlanWorkDAOGen {

    public ENServFromSide2PlanWorkDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServFromSide2PlanWorkDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public boolean removePlanByCode(int planCode) throws PersistenceException {
    	if(planCode == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не задан код плана!");
    	}
    	ENServFromSide2PlanWorkFilter filter = new ENServFromSide2PlanWorkFilter();
    	filter.planRef.code = planCode;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	if(codes.length == 0) {
    		return false;
    	} else {
    		for(int code : codes) {
    			this.remove(code);
    		}
    		return true;
    	}
    }


} // end of ENServFromSide2PlanWorkDAO
