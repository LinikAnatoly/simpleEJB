
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
import com.ksoe.energynet.dataminer.generated.ENSORItems2Post04DAOGen;
import com.ksoe.energynet.valueobject.ENSORItems2Post04;
import com.ksoe.energynet.valueobject.brief.ENSORItems2Post04Short;
import com.ksoe.energynet.valueobject.lists.ENSORItems2Post04ShortList;

/**
 * DAO Object for ENSORItems2Post04;
 *
 */

public class ENSORItems2Post04DAO extends ENSORItems2Post04DAOGen {

    public ENSORItems2Post04DAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSORItems2Post04DAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public ENSORItems2Post04ShortList getScrollableFilteredList(ENSORItems2Post04 aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSORItems2Post04ShortList result = new ENSORItems2Post04ShortList();
		ENSORItems2Post04Short anObject;
		result.list = new Vector<ENSORItems2Post04Short>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSORITEMS2POST04.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSORITEMS2POST04.CODE"+
			", ENPOST04OKSN.CODE " +
			", ENSORENTITEMS.CODE " +
			", ENSORENTITEMS.LOCALITYNAME " +
			", ENSORENTITEMS.ADDRESS " +
			", ENSORENTITEMS.PYLONNUMBERS " +
			", ENSORENTITEMS.JOINTLINELENGHT " +
			", ENSORENTITEMS.LINEPURPOSE " +
			", ENSORENTITEMS.JOINTLINECABLEMARK " +
			", ENSORENTITEMS.USERGEN " +
			", ENSORENTITEMS.DATEEDIT " +
			", ENPOST04OKSN.postnumber || ' (' || (select enposttype.name from enposttype where code = enpost04oksn.postttypecode) || ')' as postName " +
			", (select enline04.buhname || ' (' || enline04.invnumber || ')' from enline04 where code = enpost04oksn.line04refcode) as lineName " + 
		" FROM ENSORITEMS2POST04 " +
			", ENPOST04OKSN " +
			", ENSORENTITEMS " +
		"";
		whereStr = " ENPOST04OKSN.CODE = ENSORITEMS2POST04.POST04REFCODE" ; //+
		whereStr += " AND ENSORENTITEMS.CODE = ENSORITEMS2POST04.SORITEMREFCODE" ; //+

	
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
				anObject = new ENSORItems2Post04Short();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.post04RefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.post04RefCode = Integer.MIN_VALUE;
				}
				anObject.sorItemRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.sorItemRefCode = Integer.MIN_VALUE;
				}
				anObject.sorItemRefLocalityName = set.getString(4);
				anObject.sorItemRefAddress = set.getString(5);
				anObject.sorItemRefPylonNumbers = set.getString(6);
				anObject.sorItemRefJointLineLenght = set.getBigDecimal(7);
				if(anObject.sorItemRefJointLineLenght != null) {
					anObject.sorItemRefJointLineLenght = anObject.sorItemRefJointLineLenght.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sorItemRefLinePurpose = set.getString(8);
				anObject.sorItemRefJointLineCableMark = set.getString(9);
				anObject.sorItemRefUserGen = set.getString(10);
				anObject.sorItemRefDateEdit = set.getTimestamp(11);
				
				anObject.post04Name = set.getString(12);
				anObject.line04Name = set.getString(13);

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
	

} // end of ENSORItems2Post04DAO
