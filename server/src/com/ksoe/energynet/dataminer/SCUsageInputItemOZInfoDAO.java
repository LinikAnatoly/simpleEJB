//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.SCUsageInputItemOZInfoDAOGen;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCUsageInputItemOZInfo;
 *
 */

public class SCUsageInputItemOZInfoDAO extends SCUsageInputItemOZInfoDAOGen {

    public SCUsageInputItemOZInfoDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInputItemOZInfoDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Удаление дополнительной информации по ОЗ {@link SCUsageInputItemOZInfo} по коду ОЗ {@link SCUsageInputItemOZ}
     * 
     * @param ozCode  код ОЗ
     * @throws PersistenceException
     */
    public void removeByOZCode(int ozCode) throws PersistenceException {
    	SCUsageInputItemOZInfoFilter filter = new SCUsageInputItemOZInfoFilter();
    	filter.usageInputItemOZRef.code = ozCode;
    	int[] codes = this.getFilteredCodeArray(filter, 0, -1);
    	for(int code : codes) {
    		this.remove(code);
    	}
    }

} // end of SCUsageInputItemOZInfoDAO

