
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.valueobject.ENSettings;
import com.ksoe.energynet.valueobject.ENSettingsValues;
import com.ksoe.energynet.dataminer.generated.ENSettingsValuesDAOGen;
import com.ksoe.energynet.util.Tools;
import com.ksoe.energynet.valueobject.filter.ENSettingsValuesFilter;
import com.ksoe.energynet.valueobject.lists.ENSettingsValuesShortList;

/**
 * DAO Object for ENSettingsValues;
 *
 */

public class ENSettingsValuesDAO extends ENSettingsValuesDAOGen {

    public ENSettingsValuesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSettingsValuesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public int add(ENSettingsValues object) throws PersistenceException {
		object.userAdd = getUserProfile().userName;
		return super.add(object);
	}

	public String getValue(String key, Date date) throws PersistenceException {
		return getValue(key, date, true);
	}

    public String getValue(String key, Date date, boolean isException) throws PersistenceException {
    	if(key == null || date == null) {
    		throw new java.lang.IllegalArgumentException("key and date can't be null");
    	}
    	ENSettingsValuesFilter filter = new ENSettingsValuesFilter();
    	filter.conditionSQL = String.format(" %s = ? and exists (select 1 from %s as sv1 where ? between sv1.%s and coalesce(sv1.%s, ?)"
    			+ " and sv1.%s = %s)"
    			, ENSettings.key_QFielld, ENSettingsValues.tableName, ENSettingsValues.dateStart_Field, ENSettingsValues.dateFinal_Field
    			, ENSettingsValues.code_Field, ENSettingsValues.code_QFielld);
    	Vector<Object> vec = new Vector<Object>();
    	vec.add(key);
    	vec.add(date);
    	
    	vec.add(Tools.getDateOf31129999());
    	
    	ENSettingsValuesShortList list = this.getScrollableFilteredList(filter, 0, -1, vec);
    	if(list.totalCount == 0) {
    		if (isException) {
	    		throw new SystemException(String.format("Не знайдено налаштування для %s на дату %s"
	    				, key, new SimpleDateFormat("dd.MM.yyyy").format(date)));
    		} else {
    			return null;
    		}
    	}

    	return list.get(0).value;
    }

} // end of ENSettingsValuesDAO
