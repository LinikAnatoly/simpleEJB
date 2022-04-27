
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
import com.ksoe.energynet.dataminer.generated.ENWarrant4DepartmentDAOGen;
import com.ksoe.energynet.valueobject.ENWarrant4Department;
import com.ksoe.energynet.valueobject.brief.ENWarrant4DepartmentShort;
import com.ksoe.energynet.valueobject.lists.ENWarrant4DepartmentShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENWarrant4Department;
 *
 */

public class ENWarrant4DepartmentDAO extends ENWarrant4DepartmentDAOGen {

    public ENWarrant4DepartmentDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWarrant4DepartmentDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }



	@Override
	public ENWarrant4DepartmentShortList getScrollableFilteredList(ENWarrant4Department aFilterObject,
			String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENWarrant4DepartmentShortList result = new ENWarrant4DepartmentShortList();
		ENWarrant4DepartmentShort anObject;
		result.list = new Vector<ENWarrant4DepartmentShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENWARRANT4DEPARTMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENWARRANT4DEPARTMENT.CODE"+
			",ENWARRANT4DEPARTMENT.USERGEN"+
			", ENAGREEMENTKIND.CODE " +
			", ENAGREEMENTKIND.NAME " +
			", ENAGREEMENTKIND.USERGEN " +
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
			", ENWARRANT.DEPARTMENTNAME " +
			", ENWARRANT.DEPARTMENTNAMEGENITIVE " +
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
			", to_timestamp(enwarrant4department.modify_time / 1000) " +

		" FROM ENWARRANT4DEPARTMENT " +
			" LEFT JOIN ENAGREEMENTKIND on ENAGREEMENTKIND.CODE = ENWARRANT4DEPARTMENT.AGREEMENTKINDREFCODE "+
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENWARRANT4DEPARTMENT.WARRANTREFCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENWARRANT4DEPARTMENT.DEPARTMENTREFCODE "+
		"";


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if (whereStr.length() != 0) {
			selectStr += " WHERE " + whereStr;
		}
		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;

		if (quantity > -1)
			selectStr = selectStr + " LIMIT " + quantity;
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
				anObject = new ENWarrant4DepartmentShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);

				anObject.agreementKindRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.agreementKindRefCode = Integer.MIN_VALUE;
				}
				anObject.agreementKindRefName = set.getString(4);
				anObject.agreementKindRefUserGen = set.getString(5);
				anObject.warrantRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(7);
				anObject.warrantRefName = set.getString(8);
				anObject.warrantRefWarrantFIO = set.getString(9);
				anObject.warrantRefWarrantShortFIO = set.getString(10);
				anObject.warrantRefWarrantPosition = set.getString(11);
				anObject.warrantRefGenitiveFIO = set.getString(12);
				anObject.warrantRefGenitivePosition = set.getString(13);
				anObject.warrantRefPassport = set.getString(14);
				anObject.warrantRefAddress = set.getString(15);
				anObject.warrantRefPower = set.getInt(16);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(17);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.warrantRefDepartmentName = set.getString(18);
				anObject.warrantRefDepartmentNameGenitive = set.getString(19);
				anObject.departmentRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(21);
				anObject.departmentRefDateStart = set.getDate(22);
				anObject.departmentRefDateFinal = set.getDate(23);
				anObject.departmentRefRenCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(25);
				anObject.departmentRefKau_table_id_1884 = set.getInt(26);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(27);
				anObject.departmentRefName_1884 = set.getString(28);
				anObject.departmentRefHrmorganizationid = set.getString(29);

				anObject.dateEdit = set.getTimestamp(30);


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


} // end of ENWarrant4DepartmentDAO
