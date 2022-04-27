
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
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.energynet.valueobject.ENAct2RQFKOrder;
import com.ksoe.energynet.valueobject.filter.ENAct2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENAct2RQFKOrderShortList;
import com.ksoe.energynet.dataminer.generated.ENAct2RQFKOrderDAOGen;

/**
 * DAO Object for ENAct2RQFKOrder;
 *
 */

public class ENAct2RQFKOrderDAO extends ENAct2RQFKOrderDAOGen {

    public ENAct2RQFKOrderDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAct2RQFKOrderDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENAct2RQFKOrder object) throws PersistenceException {
    	Date date = new Date();
    	object.dateAdd = date;
    	object.dateEdit = date;
    	object.userGen = getUserProfile().userName;
    	object.userAdd = getUserProfile().userName;
    	
    	return super.add(object);
    }
    
    public void save(ENAct2RQFKOrder object) throws PersistenceException {
    	Date date = new Date();
    	object.dateEdit = date;
    	object.userGen = getUserProfile().userName;
    	
    	super.save(object);
    }
    
    /**
     * 
     * Получить лист по ордеру и типу
     * 
     * @param fkOrder ордер
     * @param type необязательный, если задан то список отфильтруется только по заданному типу
     * @return лист {@link ENAct2RQFKOrderShortList}
     * @throws PersistenceException
     */
    public ENAct2RQFKOrderShortList getListByFKOrderAndType(RQFKOrder fkOrder, int typeCode) throws PersistenceException {
    	if(fkOrder.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException();
    	}
    	ENAct2RQFKOrderFilter filter = new ENAct2RQFKOrderFilter();
    	filter.fkOrderRef.code = fkOrder.code;
    	if(typeCode != Integer.MIN_VALUE) {
        	filter.typeRef.code = typeCode;
    	}
    	return this.getScrollableFilteredList(filter, 0, -1);
    }

} // end of ENAct2RQFKOrderDAO
