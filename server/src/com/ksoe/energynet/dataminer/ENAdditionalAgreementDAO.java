
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENAdditionalAgreementDAOGen;
import com.ksoe.energynet.valueobject.ENAdditionalAgreement;
import com.ksoe.energynet.valueobject.filter.ENAdditionalAgreementFilter;
import com.ksoe.energynet.valueobject.lists.ENAdditionalAgreementShortList;
import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;

/**
 * DAO Object for ENAdditionalAgreement;
 *
 */

public class ENAdditionalAgreementDAO extends ENAdditionalAgreementDAOGen {

    public ENAdditionalAgreementDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENAdditionalAgreementDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    private ENAdditionalAgreementFilter getFilterForAdditionalAgreement(ENServicesObjectRef servicesObjectRef, Date dateFrom, Boolean isSigned) {
    	if(servicesObjectRef == null || servicesObjectRef.code == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("Не задан договір!");
    	}
    	ENAdditionalAgreementFilter filter = new ENAdditionalAgreementFilter();
    	filter.servicesobjectRef = servicesObjectRef;
    	if(dateFrom != null) {
    		filter.conditionSQL = String.format("%s >= ?", ENAdditionalAgreement.dateGen_QFielld);
    	}
    	if(isSigned != null) {
    		if(filter.conditionSQL != null && filter.conditionSQL != "") {
    			filter.conditionSQL += " and ";
    		} else {
    			filter.conditionSQL = "";
    		}
    		filter.conditionSQL += String.format("coalesce(%s, false) = ?", ENAdditionalAgreement.isSigned_QFielld);
    	}
    	return filter;
    }
    
    public long countFutureAgreements(ENAdditionalAgreement object) throws PersistenceException {
    	
    	Calendar c = Calendar.getInstance();
    	c.setTime(object.dateGen);
    	c.add(Calendar.DAY_OF_MONTH, 1);
    	Date tomorrow = c.getTime();
    	
    	ENAdditionalAgreementFilter filter = this.getFilterForAdditionalAgreement(object.servicesobjectRef, tomorrow, null);
    	
    	Vector<Date> parameters = new Vector<Date>();
    	parameters.add(tomorrow);
    	
    	return this.count(filter, parameters);
    	
    }
    
    public long count(ENServicesObjectRef servicesObjectRef, Date dateFrom, Boolean isSigned) throws PersistenceException {
    	ENAdditionalAgreementFilter filter = this.getFilterForAdditionalAgreement(servicesObjectRef, dateFrom, isSigned);
    	Vector<Object> parameters = new Vector<Object>();
    	if(dateFrom != null) {
    		parameters.add(dateFrom);
    	}
    	if(isSigned != null) {
    		parameters.add(isSigned);
    	}
    	
    	return this.count(filter, parameters);
    }
    
    public ENAdditionalAgreementShortList getList(int servicesObjectCode, Date dateFrom, Boolean isSigned) throws PersistenceException {
    	ENServicesObjectRef ref = new ENServicesObjectRef();
    	ref.code = servicesObjectCode;
    	return this.getList(ref, dateFrom, isSigned);
    }
    
    public ENAdditionalAgreementShortList getList(ENServicesObjectRef servicesObjectRef, Date dateFrom, Boolean isSigned) throws PersistenceException {
    	ENAdditionalAgreementFilter filter = this.getFilterForAdditionalAgreement(servicesObjectRef, dateFrom, isSigned);
    	Vector<Object> parameters = new Vector<Object>();
    	if(dateFrom != null) {
    		parameters.add(dateFrom);
    	}
    	if(isSigned != null) {
    		parameters.add(isSigned);
    	}
    	return this.getScrollableFilteredList(filter, 0, -1, parameters);
    }
    
    //public int[] getListOfAdditionalAgreements(ENServicesObjectRef servicesObjectRef, Date dateFrom, )


} // end of ENAdditionalAgreementDAO
