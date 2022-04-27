
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.List;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDepartment2OrgDAOGen;
import com.ksoe.energynet.valueobject.ENDepartment2Org;
import com.ksoe.energynet.valueobject.filter.ENDepartment2OrgFilter;

/**
 * DAO Object for ENDepartment2Org;
 *
 */

public class ENDepartment2OrgDAO extends ENDepartment2OrgDAOGen {

    public ENDepartment2OrgDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENDepartment2OrgDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Получить ID организации по коду подразделения
     * 
     * @param departmentCode код подразделения
     * @return {@code Integer} ID организации или {@code null} если подразделение с таким кодом не 
     * связано не с одной организацией
     * @throws PersistenceException
     */
    public Integer getOrgIdByDepartmentCode(int departmentCode) throws PersistenceException {
    	if(departmentCode == Integer.MIN_VALUE) throw new java.lang.NullPointerException();
        ENDepartment2OrgFilter dep2OrgFilter = new ENDepartment2OrgFilter();
        dep2OrgFilter.departmentRef.code = departmentCode;
        
        List<Double> res = this.getListOfPropertyValues(ENDepartment2Org.org_id_Field, dep2OrgFilter, 0, 1, null);
        Integer org_id = null;
        if(res.size() > 0) org_id = res.get(0).intValue();
        return org_id;
    }

} // end of ENDepartment2OrgDAO
