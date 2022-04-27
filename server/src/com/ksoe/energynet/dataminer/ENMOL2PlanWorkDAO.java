//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENMOL2PlanWorkDAOGen;
import com.ksoe.energynet.valueobject.ENMOL2PlanWork;
import com.ksoe.energynet.valueobject.filter.ENMOL2PlanWorkFilter;
import com.ksoe.energynet.valueobject.lists.ENMOL2PlanWorkShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENMOL2PlanWork;
 *
 */

public class ENMOL2PlanWorkDAO extends ENMOL2PlanWorkDAOGen {

    public ENMOL2PlanWorkDAO(UserProfile anUserProfile, Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENMOL2PlanWorkDAO(Connection aConnection, UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public ENMOL2PlanWork getObjectByPlanCode(int code) throws PersistenceException {
    	if(code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий код плану!");
    	}
    	ENMOL2PlanWorkFilter filter = new ENMOL2PlanWorkFilter();
    	filter.planRef.code = code;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	if(codes.length == 0) {
    		return null;
    	} else {
    		return this.getObject(codes[0]);
    	}
    }



	@Override
	public ENMOL2PlanWorkShortList getScrollableFilteredList(ENMOL2PlanWork aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector aBindObjects) throws PersistenceException {

		quantity = 1;

		return super.getScrollableFilteredList(aFilterObject, anCondition,
				anOrderBy, fromPosition, quantity, aBindObjects);
	}


} // end of ENMOL2PlanWorkDAO

