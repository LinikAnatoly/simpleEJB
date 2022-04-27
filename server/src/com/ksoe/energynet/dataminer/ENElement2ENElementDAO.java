
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
import java.text.SimpleDateFormat;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.brief.ENElement2ENElementShort;
import com.ksoe.energynet.valueobject.lists.ENElement2ENElementShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.rqorder.dataminer.RQFKOrderStatusDAO;
import com.ksoe.rqorder.valueobject.RQFKOrder;
import com.ksoe.rqorder.valueobject.RQFKOrderStatus;
import com.ksoe.energynet.dataminer.generated.ENElement2ENElementDAOGen;
import com.ksoe.energynet.valueobject.ENElement2ENElement;
import com.ksoe.energynet.valueobject.ENElement2ENElementType;

/**
 * DAO Object for ENElement2ENElement;
 *
 */

public class ENElement2ENElementDAO extends ENElement2ENElementDAOGen {

    public ENElement2ENElementDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENElement2ENElementDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public boolean checkType(ENElement2ENElement obj, int code, boolean isException) throws PersistenceException {
    	return this.checkType(obj, new int[] {code}, isException);
    }
    
	public boolean checkType(ENElement2ENElement obj, int[] codes, boolean isException) throws PersistenceException {
		if(obj == null || obj.typeRef == null || codes == null) throw new java.lang.NullPointerException();
		ENElement2ENElementTypeDAO typeDao = new ENElement2ENElementTypeDAO(this.getConnection(), this.getUserProfile());
		if(codes.length == 0) {
			throw new SystemException("Немає жодного коду типу для перевірки");
		}
		
		String concat = "";
		boolean result = false;
		for(int code : codes) {
			ENElement2ENElementType type = typeDao.getObject(code);
			if(type == null)throw new java.lang.NullPointerException(String.format("Невідомий код типу: %d", code));
			concat += (concat.length() > 0) ? "," : "" + type.name;
			result = obj.typeRef.code == code;
			if(result) break;
		}
		
		if(!result && isException) {
			// Проверка может у объект вообще неправильный статус
			ENElement2ENElementType type = typeDao.getObject(obj.typeRef.code);
			if(type == null)throw new java.lang.NullPointerException(String.format("Невідомий код типу у об'єкту: %d", obj.typeRef.code));
			if(codes.length == 1) {
				throw new SystemException(String.format("Неправильний тип для зв'язки. Повинен бути: %s"
						,concat));
			} else {
				throw new SystemException(String.format("Неправильний тип для зв'язки. Допустимі значення : %s"
						,concat));	
			}
		}
		return result;
	}

	public ENElement2ENElementShortList getScrollableFilteredList(ENElement2ENElement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENElement2ENElementShortList result = new ENElement2ENElementShortList();
		ENElement2ENElementShort anObject;
		result.list = new Vector<ENElement2ENElementShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT2ENELEMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
				"ENELEMENT2ENELEMENT.CODE"+
				", elementIn.CODE " +
				", elementOut.CODE " +
				", ENELEMENT2ENELEMENTTYP.CODE " +
				", ENELEMENT2ENELEMENTTYP.NAME " +
				" FROM ENELEMENT2ENELEMENT " +
				", ENELEMENT elementIn" +
				", ENELEMENT elementOut" +
				", ENELEMENT2ENELEMENTTYP " +
				"";
		whereStr = " elementIn.CODE = ENELEMENT2ENELEMENT.ELEMENTINREFCODE" ; //+
		whereStr += " AND elementOut.CODE = ENELEMENT2ENELEMENT.ELEMENTOUTREFCODE" ; //+
		whereStr += " AND ENELEMENT2ENELEMENTTYP.CODE = ENELEMENT2ENELEMENT.TYPEREFCODE" ; //+


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
				anObject = new ENElement2ENElementShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.elementInRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.elementInRefCode = Integer.MIN_VALUE;
				}
				anObject.elementOutRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.elementOutRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(5);

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

} // end of ENElement2ENElementDAO
