
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.FINAccountTypeDAOGen;
import com.ksoe.energynet.valueobject.FINAccountType;
import com.ksoe.energynet.valueobject.filter.FINAccountTypeFilter;

/**
 * DAO Object for FINAccountType;
 *
 */

public class FINAccountTypeDAO extends FINAccountTypeDAOGen {

    public FINAccountTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public FINAccountTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Возвращает тип счета {@link FINAccountType} по наименованию
     * 
     * @param name наименование
     * @return Тип счета {@link FINAccountType}
     * @throws PersistenceException
     */
    public FINAccountType getAccountTypeByName(String name) throws PersistenceException {
    	if(name == null) throw new java.lang.NullPointerException();
    	FINAccountTypeFilter filter = new FINAccountTypeFilter();
    	filter.name = name;
    	
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	
    	if(codes.length == 0) {
    		return null;
    	} else {
    		return this.getObject(codes[0]);
    	}
    }

} // end of FINAccountTypeDAO
