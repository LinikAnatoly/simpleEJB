
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENSizMaterials2TKMaterialsDAOGen;
import com.ksoe.energynet.valueobject.ENSizMaterials2TKMaterials;
import com.ksoe.energynet.valueobject.brief.ENSizMaterials2TKMaterialsShort;
import com.ksoe.energynet.valueobject.lists.ENSizMaterials2TKMaterialsShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENSizMaterials2TKMaterials;
 *
 */

public class ENSizMaterials2TKMaterialsDAO extends ENSizMaterials2TKMaterialsDAOGen {

	public ENSizMaterials2TKMaterialsDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENSizMaterials2TKMaterialsDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	public int getRealMaterialBySiz(int elementCode, int materialCode) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		String sql = "select distinct s2m.tkmaterialsrefcode "
				+ " from ensizmaterials2tkmtrls s2m "
				+ " where s2m.elementrefcode = " + elementCode
				+ " and s2m.sizmaterialsrefcode = " + materialCode
		        + " and s2m.code not in ( select distinct ensizmaterials2tkmtrls.parentrefcode from ensizmaterials2tkmtrls where parentrefcode is not null )";

		int rmtCode = Integer.MIN_VALUE;

		try {
			statement = connection.prepareStatement(sql);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				rmtCode = set.getInt(1);
				if (set.wasNull())
					rmtCode = Integer.MIN_VALUE;
			}

			return rmtCode;

		} catch (SQLException e) {
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



	@Override
	public ENSizMaterials2TKMaterialsShortList getScrollableFilteredList(ENSizMaterials2TKMaterials aFilterObject,
			String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENSizMaterials2TKMaterialsShortList result = new ENSizMaterials2TKMaterialsShortList();
		ENSizMaterials2TKMaterialsShort anObject;
		result.list = new Vector<ENSizMaterials2TKMaterialsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if (orderBy.length() == 0) {
			orderBy = " ENSIZMATERIALS2TKMTRLS.DATEEDIT desc ";
		}

		if (quantity < 0) {
			quantity = Integer.MAX_VALUE / 2;
		}

		if (getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSIZMATERIALS2TKMTRLS.CODE"+
			",ENSIZMATERIALS2TKMTRLS.USEREDIT"+
			",ENSIZMATERIALS2TKMTRLS.DATEEDIT"+
			", ENELEMENT.CODE " +

			", szmat.CODE " +
			", szmat.NAME " +
			", szmat.COST " +
			", szmat.DELIVERYDATE " +
			", szmat.NUMKATALOG " +
			", szmat.IDENTID " +

			", mat.CODE " +
			", mat.NAME " +
			", mat.COST " +
			", mat.DELIVERYDATE " +
			", mat.NUMKATALOG " +
			", mat.IDENTID " +

			", parentmat.CODE " +
			", parentmat.USEREDIT " +
			", parentmat.DATEEDIT " +

		" FROM ENSIZMATERIALS2TKMTRLS " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSIZMATERIALS2TKMTRLS.ELEMENTREFCODE "+
			" LEFT JOIN TKMATERIALS szmat on szmat.CODE = ENSIZMATERIALS2TKMTRLS.SIZMATERIALSREFCODE "+
			" LEFT JOIN TKMATERIALS mat on mat.CODE = ENSIZMATERIALS2TKMTRLS.TKMATERIALSREFCODE "+
			" LEFT JOIN ENSIZMATERIALS2TKMTRLS parentmat on parentmat.CODE = ENSIZMATERIALS2TKMTRLS.PARENTREFCODE "+
		"";


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
				anObject = new ENSizMaterials2TKMaterialsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userEdit = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.elementRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.sizMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefName = set.getString(6);
				anObject.sizMaterialsRefCost = set.getBigDecimal(7);
				if(anObject.sizMaterialsRefCost != null) {
					anObject.sizMaterialsRefCost = anObject.sizMaterialsRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizMaterialsRefDeliveryDate = set.getInt(8);
				if(set.wasNull()) {
					anObject.sizMaterialsRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.sizMaterialsRefNumkatalog = set.getString(9);
				anObject.sizMaterialsRefIdentid = set.getString(10);
				anObject.tkMaterialsRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.tkMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.tkMaterialsRefName = set.getString(12);
				anObject.tkMaterialsRefCost = set.getBigDecimal(13);
				if(anObject.tkMaterialsRefCost != null) {
					anObject.tkMaterialsRefCost = anObject.tkMaterialsRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.tkMaterialsRefDeliveryDate = set.getInt(14);
				if(set.wasNull()) {
					anObject.tkMaterialsRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.tkMaterialsRefNumkatalog = set.getString(15);
				anObject.tkMaterialsRefIdentid = set.getString(16);
				anObject.parentRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefUserEdit = set.getString(18);
				anObject.parentRefDateEdit = set.getTimestamp(19);

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



} // end of ENSizMaterials2TKMaterialsDAO
