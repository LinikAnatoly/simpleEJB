
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENCustomerServicesDAOGen;
import com.ksoe.energynet.util.LoggableStatement;
import com.ksoe.energynet.valueobject.ENCustomerServices;
import com.ksoe.energynet.valueobject.brief.ENCustomerServicesShort;
import com.ksoe.energynet.valueobject.lists.ENCustomerServicesShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENCustomerServices;
 *
 */

public class ENCustomerServicesDAO extends ENCustomerServicesDAOGen {

	public ENCustomerServicesDAO(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENCustomerServicesDAO(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}


	@Override
	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServices aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENCustomerServicesShortList result = new ENCustomerServicesShortList();
		ENCustomerServicesShort anObject;
		result.list = new Vector<ENCustomerServicesShort>();

		String selectStr = "";
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		orderBy = " customername, dateregistration desc ";

		if (quantity < 0) {
			quantity = Integer.MAX_VALUE / 2;
		}

		if (getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if (whereStr.length() != 0) {

			selectStr = "select customername, customeraddress, objectsaddress, docnum, dateregistration, typename, servicename, docstatus, "
					+ "    source, sourcetable, sourcetablecode, sourcetype, servicecode "
					+ " from fn_net_services (&" + whereStr + "&) "
					+ " union all "
					+ " select customername, customeraddress, objectsaddress, docnum, dateregistration, typename, servicename, docstatus, "
					+ "   source, sourcetable, sourcetablecode, sourcetype, servicecode "
					+ " from fn_doc_services(&" + whereStr + "&) "
					+ " union all "
					+ " select customername, customeraddress, objectsaddress, docnum, dateregistration, typename, servicename, docstatus, "
					+ "   source, sourcetable, sourcetablecode, sourcetype, servicecode "
					+ " from fn_cc_services(&" + whereStr + "&) ";

		} else {

			return result;
		}


		selectStr = selectStr + " ORDER BY " + orderBy;

		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1)
			selectStr = selectStr + " LIMIT " + quantity;

		int number = 0;
		try {

			statement = new LoggableStatement(connection, selectStr);

			number = setParameters(aFilterObject, statement);

			if (condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement, aBindObjects, number);
			}


			String queryText = ((LoggableStatement)statement).getQueryString();
			queryText = queryText.replace("'", "''");
			queryText = queryText.replace("&", "'");

			statement = connection.prepareStatement(queryText);

			set = statement.executeQuery();
			int i;
			for (i = 0; set.next(); i++) {
				anObject = new ENCustomerServicesShort();

				anObject.customerName = set.getString(1);
				anObject.customerAddress = set.getString(2);
				anObject.objectsAddress = set.getString(3);
				anObject.docNum = set.getString(4);
				anObject.dateRegistration = set.getDate(5);
				anObject.typeName = set.getString(6);
				anObject.serviceName = set.getString(7);
				anObject.docStatus = set.getString(8);
				anObject.sourceInfo = set.getString(9);
				anObject.sourceTable = set.getString(10);
				anObject.sourceTableCode = set.getInt(11);
				anObject.sourceType = set.getInt(12);
				anObject.serviceCode = set.getInt(13);

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


	@Override
	public int setParameters(ENCustomerServices filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {

			for (int x = 0; x < 3; x++) {
				index++;
				index = BaseDAOUtils.setStringParameter(filter.customerName, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.customerAddress, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.objectsAddress, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.docNum, index, statement);
				index = BaseDAOUtils.setDateParameter(filter.dateRegistration, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.typeName, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.serviceName, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.docStatus, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.sourceInfo, index, statement);
				index = BaseDAOUtils.setStringParameter(filter.sourceTable, index, statement);
				index = BaseDAOUtils.setIntParameter(filter.sourceTableCode, index, statement);
				index = BaseDAOUtils.setIntParameter(filter.sourceType, index, statement);
				index--;
			}
		}

		return index;
	}



	public static String processCondition(String aCondition) {
		if (aCondition == null || aCondition.length() == 0) {
			return "";
		}

		StringBuffer condition = new StringBuffer(aCondition);
		_checkConditionToken(condition, ";", " ");
		_checkConditionToken(condition, "--", " ");
		_checkConditionToken(condition, "\r", " ");
		_checkConditionToken(condition, "\n", " ");
		_checkConditionToken(condition, "||", " OR ");
		_checkConditionToken(condition, "&&", " AND ");
		_checkConditionToken(condition, "==", "=");
		_checkConditionToken(condition, "!=", "<>");

		return condition.toString();
	}

} // end of ENCustomerServicesDAO
