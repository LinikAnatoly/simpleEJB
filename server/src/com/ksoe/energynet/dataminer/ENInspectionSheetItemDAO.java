
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENInspectionSheetItemDAOGen;
import com.ksoe.energynet.valueobject.ENInspectionSheetItem;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetItemShort;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetItemShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENInspectionSheetItem;
 *
 */

public class ENInspectionSheetItemDAO extends ENInspectionSheetItemDAOGen {

    public ENInspectionSheetItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENInspectionSheetItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }




	@Override
	public ENInspectionSheetItemShortList getScrollableFilteredList(ENInspectionSheetItem aFilterObject,
			String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENInspectionSheetItemShortList result = new ENInspectionSheetItemShortList();
		ENInspectionSheetItemShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENINSPECTIONSHEETITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			" ENINSPECTIONSHEETITEM.CODE"+
			", ENINSPECTIONSHEETITEM.DEFECTCODE"+
			", ENINSPECTIONSHEETITEM.DEFECTNAME"+
			", ENINSPECTIONSHEETITEM.COMMENTGEN"+
			", ENINSPECTIONSHEETITEM.ISDETECTING"+
			", ENINSPECTIONSHEETITEM.USERGEN"+
			", ENINSPECTIONSHEET.CODE " +
			", ENINSPECTIONSHEET.NAME " +
			", ENINSPECTIONSHEET.USERGEN " +
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +

			// ", TKCLASSIFICATIONTYPE.PARENTREFCODE " +
			", ( select case when max(tk.parentrefcode) is not null then null else 1 end " +
			"     from tkclassificationtype tk where tk.parentrefcode = tkclassificationtype.code ) " +

			", ENINSPECTIONSHEETITEM.COUNTGEN " +

			", (select tt.techcardrefcode from tkdefects2techcard tt where tt.classificationtyperfcd = eninspectionsheetitem.classificationtyperfcd) " +

			", ENINSPECTIONSHEETITEM.COUNTDEFECTS " +
			", ENINSPECTIONSHEETITEM.DEFECTLENGTH " +
			", ENINSPECTIONSHEETITEM.COEFFICIENTKI " +
			", ENINSPECTIONSHEETITEM.POINTSPI " +
			", ENINSPECTIONSHEETITEM.WEIGHTXI " +
			", ENELEMENT.CODE " +

			" FROM ENINSPECTIONSHEETITEM " +
			" LEFT JOIN ENINSPECTIONSHEET on ENINSPECTIONSHEET.CODE = ENINSPECTIONSHEETITEM.SHEETREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENINSPECTIONSHEETITEM.CLASSIFICATIONTYPERFCD "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENINSPECTIONSHEETITEM.ELEMENTREFCODE "+
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
				anObject = new ENInspectionSheetItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.defectCode = set.getString(2);
				anObject.defectName = set.getString(3);
				anObject.commentGen = set.getString(4);
				anObject.isDetecting = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.isDetecting = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(6);

				anObject.sheetRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.sheetRefCode = Integer.MIN_VALUE;
				}

				anObject.sheetRefName = set.getString(8);
				anObject.sheetRefUserGen = set.getString(9);

				anObject.classificationTypeRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}

				anObject.classificationTypeRefName = set.getString(11);
				anObject.classificationTypeRefKod = set.getString(12);

				anObject.classificationTypeParentRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.classificationTypeParentRefCode = Integer.MIN_VALUE;
				}

				anObject.countGen = set.getBigDecimal(14);
				if (anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.techCardCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.techCardCode = Integer.MIN_VALUE;
				}

				anObject.countDefects = set.getBigDecimal(16);
				if (anObject.countDefects != null) {
					anObject.countDefects = anObject.countDefects.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.defectLength = set.getBigDecimal(17);
				if (anObject.defectLength != null) {
					anObject.defectLength = anObject.defectLength.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.coefficientKi = set.getBigDecimal(18);
				if (anObject.coefficientKi != null) {
					anObject.coefficientKi = anObject.coefficientKi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.pointsPi = set.getBigDecimal(19);
				if (anObject.pointsPi != null) {
					anObject.pointsPi = anObject.pointsPi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.weightXi = set.getBigDecimal(20);
				if (anObject.weightXi != null) {
					anObject.weightXi = anObject.weightXi.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.elementRefCode = set.getInt(21);
				if (set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}


				result.list.add(anObject);
			}

			result.setTotalCount(i);

			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
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




} // end of ENInspectionSheetItemDAO
