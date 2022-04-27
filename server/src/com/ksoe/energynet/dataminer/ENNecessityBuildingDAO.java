
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENNecessityBuildingDAOGen;
import com.ksoe.energynet.valueobject.ENNecessityBuilding;
import com.ksoe.energynet.valueobject.brief.ENNecessityBuildingShort;
import com.ksoe.energynet.valueobject.lists.ENNecessityBuildingShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENNecessityBuilding;
 *
 */

public class ENNecessityBuildingDAO extends ENNecessityBuildingDAOGen {

	public ENNecessityBuildingDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENNecessityBuildingDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public ENNecessityBuildingShortList getScrollableFilteredList(ENNecessityBuilding aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENNecessityBuildingShortList result = new ENNecessityBuildingShortList();
		ENNecessityBuildingShort anObject;
		result.list = new Vector<ENNecessityBuildingShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENNECESSITYBUILDING.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENNECESSITYBUILDING.CODE"+
			", ENNECESSITYBUILDING.COUNTGEN"+
			", ENNECESSITYBUILDING.DESCRIPTION"+
			", ENNECESSITYBUILDING.DATEEDIT"+
			", ENNECESSITYBUILDING.USERGEN"+
			", ENELEMENTTYPE.CODE " +
			", ENELEMENTTYPE.NAME " +
			", EPVOLTAGENOMINAL.CODE " +
			", EPVOLTAGENOMINAL.VALUE " +
			", ENSERVICESOBJECT.CODE " +
			", ENNECESSITYBUILDING.SUMMAGEN " +

		" FROM  "
		+ " ENELEMENTTYPE "
		+ ", ENSERVICESOBJECT "
		+ ", ENNECESSITYBUILDING left join EPVOLTAGENOMINAL on EPVOLTAGENOMINAL.CODE = ENNECESSITYBUILDING.VOLTAGENOMINALCODE ";

		whereStr = " ENELEMENTTYPE.CODE = ENNECESSITYBUILDING.ELEMENTTYPEREFCODE" ; //+
		// whereStr += " AND EPVOLTAGENOMINAL.CODE = ENNECESSITYBUILDING.VOLTAGENOMINALCODE" ; //+
		whereStr += " AND ENSERVICESOBJECT.CODE = ENNECESSITYBUILDING.SERVICESOBJECTREFCODE" ; //+


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
				anObject = new ENNecessityBuildingShort();

				anObject.code = set.getInt(1);
				if (set.wasNull()) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.countGen = set.getBigDecimal(2);
				if (anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.description = set.getString(3);
				anObject.dateEdit = set.getTimestamp(4);
				anObject.userGen = set.getString(5);

				anObject.elementTypeRefCode = set.getInt(6);
				if (set.wasNull()) {
					anObject.elementTypeRefCode = Integer.MIN_VALUE;
				}

				anObject.elementTypeRefName = set.getString(7);

				anObject.voltageNominalCode = set.getInt(8);
				if (set.wasNull()) {
					anObject.voltageNominalCode = Integer.MIN_VALUE;
				}

				anObject.voltageNominalValue = set.getString(9);

				anObject.servicesObjectRefCode = set.getInt(10);
				if (set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}

				anObject.summaGen = set.getBigDecimal(11);
				if (anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
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


} // end of ENNecessityBuildingDAO
