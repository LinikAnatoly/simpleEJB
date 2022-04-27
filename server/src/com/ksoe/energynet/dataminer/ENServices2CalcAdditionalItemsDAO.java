
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENServices2CalcAdditionalItemsDAOGen;
import com.ksoe.energynet.valueobject.ENServices2CalcAdditionalItems;
import com.ksoe.energynet.valueobject.filter.ENServices2CalcAdditionalItemsFilter;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

/**
 * DAO Object for ENServices2CalcAdditionalItems;
 *
 */

public class ENServices2CalcAdditionalItemsDAO extends ENServices2CalcAdditionalItemsDAOGen {

    public ENServices2CalcAdditionalItemsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServices2CalcAdditionalItemsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public BigDecimal getSumOfItemsByENServicesObjectRef(ENServicesObjectRef servicesObjectRef) throws PersistenceException {
    	BigDecimal out = BigDecimal.ZERO.setScale(2, BigDecimal.ROUND_HALF_UP);
    	int[] codes = this.getCodesbyENServicesObjectRef(servicesObjectRef);
    	for(int code : codes) {
    		ENServices2CalcAdditionalItems item = this.getObject(code);
    		out = out.add(item.summa);
    	}
    	return out;
    }
    
    public int[] getCodesbyENServicesObjectRef(ENServicesObjectRef servicesObjectRef) throws PersistenceException {
    	if(servicesObjectRef == null || servicesObjectRef.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не заданий договір для вибору додаткових розрахунків!");
    	}
    	ENServices2CalcAdditionalItemsFilter filter = new ENServices2CalcAdditionalItemsFilter();
    	filter.servicesObjectRef = servicesObjectRef;
    	return this.getFilteredCodeArray(filter, 0, -1);
    }

} // end of ENServices2CalcAdditionalItemsDAO
