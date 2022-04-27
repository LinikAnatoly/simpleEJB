
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAct2FinKodIstDAOGen;
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.filter.ENAct2FinKodIstFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2FinKodIstShortList;

/**
 * DAO Object for ENAct2FinKodIst;
 *
 */

public class ENAct2FinKodIstDAO extends ENAct2FinKodIstDAOGen {

    public ENAct2FinKodIstDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2FinKodIstDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENAct2FinKodIstShortList getListByAct(ENAct act) throws PersistenceException {
    	if(act == null || act.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    	ENAct2FinKodIstFilter filter = new ENAct2FinKodIstFilter();
    	filter.actRef.code = act.code;
    	return this.getScrollableFilteredList(filter, 0, -1);
    }

} // end of ENAct2FinKodIstDAO
