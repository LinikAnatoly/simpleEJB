
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen;
import com.ksoe.energynet.valueobject.ENSOBill;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENSOBillFilter;
import com.ksoe.energynet.valueobject.lists.ENSOBillShortList;

/**
 * DAO Object for ENSOBill;
 *
 */

public class ENSOBillDAO extends ENSOBillDAOGen {

    public ENSOBillDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOBillDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENSOBillShortList getListByENServicesObject(ENServicesObject servicesObject) throws PersistenceException {
    	if(servicesObject == null || servicesObject.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий договір для виборки рахунків!");
    	}
    	ENSOBillFilter filter = new ENSOBillFilter();
    	filter.servicesObjectRef.code = servicesObject.code;
    	filter.orderBySQL = String.format("%s ASC", ENSOBill.dateGen_QFielld);
    	return this.getFilteredList(filter);
    }

} // end of ENSOBillDAO
