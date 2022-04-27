
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
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
import com.ksoe.energynet.dataminer.generated.ENBudgets2NomenclaturesDAOGen;
import com.ksoe.energynet.valueobject.ENBudgets2Nomenclatures;
import com.ksoe.energynet.valueobject.brief.ENBudgets2NomenclaturesShort;
import com.ksoe.energynet.valueobject.lists.ENBudgets2NomenclaturesShortList;

/**
 * DAO Object for ENBudgets2Nomenclatures;
 *
 */

public class ENBudgets2NomenclaturesDAO extends ENBudgets2NomenclaturesDAOGen {

    public ENBudgets2NomenclaturesDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENBudgets2NomenclaturesDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public ENBudgets2NomenclaturesShortList getScrollableFilteredList(ENBudgets2Nomenclatures aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENBudgets2NomenclaturesShortList result = new ENBudgets2NomenclaturesShortList();
		ENBudgets2NomenclaturesShort anObject;
		result.list = new Vector<ENBudgets2NomenclaturesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUDGETS2NOMENCLATURS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUDGETS2NOMENCLATURS.CODE"+
			",ENBUDGETS2NOMENCLATURS.NN"+
			",ENBUDGETS2NOMENCLATURS.MAT_NAME"+
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
		" FROM ENBUDGETS2NOMENCLATURS " +
			"LEFT JOIN  ENDEPARTMENT ON  ENBUDGETS2NOMENCLATURS.BUDGETREFCODE = ENDEPARTMENT.CODE " +
		"";
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

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
			
			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENBudgets2NomenclaturesShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.nn = set.getString(2);
				anObject.mat_name = set.getString(3);

				anObject.budgetRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.budgetRefCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShortName = set.getString(5);
				anObject.budgetRefDateStart = set.getDate(6);
				anObject.budgetRefDateFinal = set.getDate(7);
				anObject.budgetRefRenCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.budgetRefRenCode = Integer.MIN_VALUE;
				}
				anObject.budgetRefShpzBalans = set.getString(9);
				anObject.budgetRefKau_table_id_1884 = set.getInt(10);
				if(set.wasNull()) {
					anObject.budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.budgetRefKau_1884 = set.getString(11);
				anObject.budgetRefName_1884 = set.getString(12);
				anObject.budgetRefHrmorganizationid = set.getString(13);

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
	


} // end of ENBudgets2NomenclaturesDAO
