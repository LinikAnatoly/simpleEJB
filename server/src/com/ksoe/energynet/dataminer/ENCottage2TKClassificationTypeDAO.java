
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.energynet.dataminer.generated.ENCottage2TKClassificationTypeDAOGen;
import com.ksoe.energynet.valueobject.ENCottage2TKClassificationType;
import com.ksoe.energynet.valueobject.brief.ENCottage2TKClassificationTypeShort;
import com.ksoe.energynet.valueobject.lists.ENCottage2TKClassificationTypeShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENCottage2TKClassificationType;
 *
 */

public class ENCottage2TKClassificationTypeDAO extends ENCottage2TKClassificationTypeDAOGen {

    public ENCottage2TKClassificationTypeDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCottage2TKClassificationTypeDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


	@Override
	public ENCottage2TKClassificationTypeShortList getScrollableFilteredList(
			ENCottage2TKClassificationType aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity,
			Vector aBindObjects) throws PersistenceException {
		ENCottage2TKClassificationTypeShortList result = new ENCottage2TKClassificationTypeShortList();
		ENCottage2TKClassificationTypeShort anObject;
		result.list = new Vector();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0)
			orderBy = "ENCOTTAGE2TKCLSSFCTNTP.CODE";

		if (quantity < 0)
			quantity = Integer.MAX_VALUE / 2;

		if (getUserProfile() == null)
			throw new PersistenceException(
					"Internal Error (User Profile Is Undefined)");

		selectStr = "SELECT " +
				" ENCOTTAGE2TKCLSSFCTNTP.CODE"+
				", ENCOTTAGE2TKCLSSFCTNTP.USERGEN"+
				", ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT"+

       			", TKCLASSIFICATIONTYPE.CODE " +
       			", TKCLASSIFICATIONTYPE.NAME " +
       			", TKCLASSIFICATIONTYPE.KOD " +
       			", ENCOTTAGE.CODE " +
       			", ENCOTTAGE.NUMBERGEN " +
       			", ENCOTTAGE.NUMBERBEDS " +
       			", ENCOTTAGE.DESCRIPTION " +
       			", ENCOTTAGE.COMMENTGEN " +
       			", ENCOTTAGE.USERGEN " +
       			", ENCOTTAGE.DATEEDIT " +

       			" FROM ENCOTTAGE2TKCLSSFCTNTP " +
       			", TKCLASSIFICATIONTYPE " +
       			", ENCOTTAGE ";

       whereStr = " TKCLASSIFICATIONTYPE.CODE = ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD" ; //+
       whereStr = whereStr +" AND ENCOTTAGE.CODE = ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE" ; //+

       if(aFilterObject != null)
       {
			if (aFilterObject.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.CODE = ?";
			}
			if (aFilterObject.userGen != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				if (aFilterObject.userGen.indexOf('*', 0) < 0
						&& aFilterObject.userGen.indexOf('?', 0) < 0)
					whereStr = whereStr
							+ "  UPPER(ENCOTTAGE2TKCLSSFCTNTP.USERGEN) = UPPER(?)";
				else
					whereStr = whereStr
							+ " UPPER(ENCOTTAGE2TKCLSSFCTNTP.USERGEN) LIKE UPPER(?)";
			}
			if (aFilterObject.dateEdit != null) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr + "  ENCOTTAGE2TKCLSSFCTNTP.DATEEDIT = ?";
			}
			if (aFilterObject.modify_time != Long.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "  ENCOTTAGE2TKCLSSFCTNTP.MODIFY_TIME = ?";
			}
			if (aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "ENCOTTAGE2TKCLSSFCTNTP.CLASSIFICATIONTYPERFCD = ? ";
			}
			if (aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
				if (whereStr.length() != 0)
					whereStr = whereStr + " AND ";
				whereStr = whereStr
						+ "ENCOTTAGE2TKCLSSFCTNTP.COTTAGEREFCODE = ? ";
			}

		}

		if (condition.length() != 0) {
			if (whereStr.length() != 0)
				whereStr = whereStr + " AND ";

			whereStr = whereStr + " (" + condition + ")";
		}
		// + " WHERE" + сделано выше ????
		if (whereStr.length() != 0)
			selectStr = selectStr + " WHERE " + whereStr;

		// selectStr = selectStr + ") ";

		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1)
			selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = 0;
			if (aFilterObject != null) {
				if (aFilterObject.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.code);
				}

				if (aFilterObject.userGen != null) {
					number++;
					StringBuffer likeStr = new StringBuffer();
					likeStr.append(aFilterObject.userGen);
					for (int i = 0; i < likeStr.length(); i++) {
						if (likeStr.charAt(i) == '*')
							likeStr.setCharAt(i, '%');
						if (likeStr.charAt(i) == '?')
							likeStr.setCharAt(i, '_');
					}
					statement.setString(number, likeStr.toString());
				}
				if (aFilterObject.dateEdit != null) {
					number++;
					statement.setTimestamp(number, new java.sql.Timestamp(
							aFilterObject.dateEdit.getTime()));
				}
				if (aFilterObject.modify_time != Long.MIN_VALUE) {
					number++;
					if (aFilterObject.modify_time == Long.MIN_VALUE)
						statement.setBigDecimal(number, null);
					else
						statement.setBigDecimal(number,
								new java.math.BigDecimal(
										aFilterObject.modify_time));
				}
				if (aFilterObject.classificationTypeRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number,
							aFilterObject.classificationTypeRef.code);
				}
				if (aFilterObject.cottageRef.code != Integer.MIN_VALUE) {
					number++;
					statement.setInt(number, aFilterObject.cottageRef.code);
				}
			}

			if (condition.length() > 0 && aBindObjects != null)
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {

				anObject = new ENCottage2TKClassificationTypeShort();

				anObject.code = set.getInt(1);
				if (set.wasNull())
					anObject.code = Integer.MIN_VALUE;
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.classificationTypeRefCode = set.getInt(4);
				if (set.wasNull())
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				anObject.classificationTypeRefName = set.getString(5);
				anObject.classificationTypeRefKod = set.getString(6);
				anObject.cottageRefCode = set.getInt(7);
				if (set.wasNull())
					anObject.cottageRefCode = Integer.MIN_VALUE;
				anObject.cottageRefNumberGen = set.getString(8);
				anObject.cottageRefNumberBeds = set.getInt(9);
				if (set.wasNull())
					anObject.cottageRefNumberBeds = Integer.MIN_VALUE;
				anObject.cottageRefDescription = set.getString(10);
				anObject.cottageRefCommentgen = set.getString(11);
				anObject.cottageRefUserGen = set.getString(12);
				anObject.cottageRefDateEdit = set.getTimestamp(13);

				result.list.add(anObject);
			}

			result.setTotalCount(i);
			return result;
		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
			// return null;
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

} // end of ENCottage2TKClassificationTypeDAO
