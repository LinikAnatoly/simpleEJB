
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSOValuesTypeDAOGen;
import com.ksoe.energynet.valueobject.ENSOValuesType;
import com.ksoe.energynet.valueobject.ENSOValuesTypeCategory;
import com.ksoe.energynet.valueobject.brief.ENSOValuesTypeShort;
import com.ksoe.energynet.valueobject.lists.ENSOValuesTypeShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENSOValuesType;
 *
 */

public class ENSOValuesTypeDAO extends ENSOValuesTypeDAOGen {

    public ENSOValuesTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSOValuesTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

	public ENSOValuesTypeShortList getScrollableFilteredList(ENSOValuesType aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSOValuesTypeShortList result = new ENSOValuesTypeShortList();
		ENSOValuesTypeShort anObject;
		result.list = new Vector<ENSOValuesTypeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOVALUESTYPE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSOVALUESTYPE.CODE"+
			",ENSOVALUESTYPE.NAME"+
			",ENSOVALUESTYPE.SORTFIELD"+
			",ENSOVALUESTYPE.USERGEN"+
			",ENSOVALUESTYPE.DATEEDIT"+
			", ENSOVALUESTYPECATEGORY.CODE " +
			", ENSOVALUESTYPECATEGORY.NAME " +
		" FROM ENSOVALUESTYPE " +
			" LEFT JOIN ENSOVALUESTYPECATEGORY on ENSOVALUESTYPECATEGORY.CODE = ENSOVALUESTYPE.CATEGORYREFCODE "+
		"";

		// Не будем отображать типы доп. реквизитов, которые относятся к категории "Скрытые" 
		whereStr = " coalesce(ENSOVALUESTYPECATEGORY.CODE, 0) <> " + ENSOValuesTypeCategory.HIDDEN;

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);
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
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENSOValuesTypeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.sortField = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.sortField = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);

				anObject.categoryRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.categoryRefCode = Integer.MIN_VALUE;
				}
				anObject.categoryRefName = set.getString(7);

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

} // end of ENSOValuesTypeDAO
