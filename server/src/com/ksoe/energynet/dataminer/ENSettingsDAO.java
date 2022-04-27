
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSettingsDAOGen;
import com.ksoe.energynet.valueobject.ENSettings;
import com.ksoe.energynet.valueobject.brief.ENSettingsShort;
import com.ksoe.energynet.valueobject.lists.ENSettingsShortList;

/**
 * DAO Object for ENSettings;
 *
 */

public class ENSettingsDAO extends ENSettingsDAOGen {

    public ENSettingsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSettingsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public ENSettingsShortList getScrollableFilteredList(ENSettings aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSettingsShortList result = new ENSettingsShortList();
		ENSettingsShort anObject;
		result.list = new Vector<ENSettingsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSETTINGS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSETTINGS.CODE"+
			",ENSETTINGS.KEY"+
			",ENSETTINGS.COMMENT"+
			",current_value.value" +
		" FROM ENSETTINGS " +
			" LEFT JOIN (SELECT val1.value AS value, val1.settingsrefcode FROM ensettingsvalues AS val1 "
			+ " WHERE now() BETWEEN val1.datestart AND coalesce(val1.datefinal, to_date('31.12.9999', 'dd.mm.yyyy')))"
			+ " AS current_value ON ENSETTINGS.CODE = current_value.settingsrefcode " +
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		if(aFilterObject.currentValue != null && aFilterObject.currentValue.trim().length() > 0) {
			whereStr = BaseDAOUtils.addStringToCondition(aFilterObject.currentValue, "current_value.value"
					, whereStr);
		}
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
		
		
		if(whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;
		int number = 0;
		try {
			statement = connection.prepareStatement(selectStr);
			number = setParameters(aFilterObject, statement);
			if(aFilterObject.currentValue != null && aFilterObject.currentValue.trim().length() > 0) {
				BaseDAOUtils.setStringParameter(aFilterObject.currentValue, ++number, statement);
			}
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENSettingsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.key = set.getString(2);
				anObject.comment = set.getString(3);
				anObject.currentValue = set.getString(4);


				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();}             catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	


} // end of ENSettingsDAO
