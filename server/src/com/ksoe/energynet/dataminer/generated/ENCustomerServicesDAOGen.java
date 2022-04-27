
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENCustomerServices;
import com.ksoe.energynet.valueobject.brief.ENCustomerServicesShort;
import com.ksoe.energynet.valueobject.filter.ENCustomerServicesFilter;
import com.ksoe.energynet.valueobject.lists.ENCustomerServicesShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENCustomerServices;
 *
 */

public class ENCustomerServicesDAOGen extends GenericDataMiner {

	public ENCustomerServicesDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCustomerServicesDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}


	public int setParameters(ENCustomerServices filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
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
		return index;
	}

	public String buildCondition(ENCustomerServicesFilter filter) {
		String out = buildCondition((ENCustomerServices)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCustomerServices filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addStringToCondition(filter.customerName, ENCustomerServices.customerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.customerAddress, ENCustomerServices.customerAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectsAddress, ENCustomerServices.objectsAddress_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.docNum, ENCustomerServices.docNum_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateRegistration, ENCustomerServices.dateRegistration_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.typeName, ENCustomerServices.typeName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.serviceName, ENCustomerServices.serviceName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.docStatus, ENCustomerServices.docStatus_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.sourceInfo, ENCustomerServices.sourceInfo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.sourceTable, ENCustomerServices.sourceTable_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sourceTableCode, ENCustomerServices.sourceTableCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sourceType, ENCustomerServices.sourceType_QFielld, out);
		}
		return out;
	}

	public ENCustomerServicesShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCustomerServicesShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCustomerServicesShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCustomerServicesShortList getFilteredList(ENCustomerServices filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServices aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServices aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServicesFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServicesFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENCustomerServicesShortList getScrollableFilteredList(ENCustomerServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCustomerServicesShortList result = new ENCustomerServicesShortList();
		ENCustomerServicesShort anObject;
		result.list = new Vector<ENCustomerServicesShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCUSTOMERSERVICES.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCUSTOMERSERVICES.CUSTOMERNAME"+
			",ENCUSTOMERSERVICES.CUSTOMERADDRESS"+
			",ENCUSTOMERSERVICES.OBJECTSADDRESS"+
			",ENCUSTOMERSERVICES.DOCNUM"+
			",ENCUSTOMERSERVICES.DATEREGISTRATION"+
			",ENCUSTOMERSERVICES.TYPENAME"+
			",ENCUSTOMERSERVICES.SERVICENAME"+
			",ENCUSTOMERSERVICES.DOCSTATUS"+
			",ENCUSTOMERSERVICES.SOURCEINFO"+
			",ENCUSTOMERSERVICES.SOURCETABLE"+
			",ENCUSTOMERSERVICES.SOURCETABLECODE"+
			",ENCUSTOMERSERVICES.SOURCETYPE"+
		" FROM ENCUSTOMERSERVICES " +
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
				if ( set.wasNull() ) {
					anObject.sourceTableCode = Integer.MIN_VALUE;
				}
				anObject.sourceType = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.sourceType = Integer.MIN_VALUE;
				}


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

	public int[] getFilteredCodeArray(ENCustomerServicesFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCustomerServicesFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCustomerServices aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCUSTOMERSERVICES.CODE FROM ENCUSTOMERSERVICES";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCUSTOMERSERVICES.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		selectStr = selectStr + " ORDER BY " + orderBy;
		selectStr = selectStr + " OFFSET " + fromPosition;
		if (quantity > -1) selectStr = selectStr + " LIMIT " + quantity;

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(aFilterObject, statement);

			if(condition.length() > 0 && aBindObjects != null) {
				_bindObjectsToPreparedStatement(statement,aBindObjects,number);
			}

			set = statement.executeQuery();
			int i;
			for(i = 0;set.next();i++) {
				/*if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}*/
				result.add(set.getInt(1));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = result.get(j);
			}
			return array;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	} // end of getFilteredCodeArray






	public long count(ENCustomerServicesFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCustomerServicesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCustomerServicesFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCUSTOMERSERVICES", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}


		whereStr = BaseDAOUtils.addToCondition(buildCondition(filter), whereStr);

		if(whereStr.length() != 0) {
			selectStr = selectStr + " WHERE " + whereStr;
		}

		try {
			statement = connection.prepareStatement(selectStr);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
			}

			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return null;
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	@SuppressWarnings("unchecked")
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENCUSTOMERSERVICES WHERE code = ?", propertyName);
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			statement.setInt(1, code);
			set = statement.executeQuery();
			if(set.next()) {
				return (E)set.getObject(1);
			} else {
				return defaultValue;
			}

		} catch (SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - " + sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			try{if(connection != null && !connection.isClosed())connection.close();} catch(SQLException e){}
		}
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCustomerServicesFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCUSTOMERSERVICES");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		ArrayList<E> out = new ArrayList<E>();

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

		if(whereStr.length() != 0) {
			sql += " WHERE " + whereStr;
		}

		if(filter.getOrderBySQL() != null && filter.getOrderBySQL().trim().length() > 0) {
			sql += " ORDER BY " + filter.getOrderBySQL();
		}

		sql += " OFFSET " + fromPosition;

		if(quantity > -1) {
			sql += " LIMIT " + quantity;
		}

		try {
			statement = connection.prepareStatement(sql);
			int number = setParameters(filter, statement);

			if(bindObjects != null) {
				_bindObjectsToPreparedStatement(statement,new Vector<Object>(bindObjects),number);
			}

			set = statement.executeQuery();
			while(set.next()) {
				out.add((E)set.getObject(1));
			}
			return out;
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+sql);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (set != null) set.close();} catch (SQLException e) {}
			try {if (statement != null) statement.close();} catch (SQLException e) {}
		}
	}

	public boolean exists(int anObjectCode) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(anObjectCode == Integer.MIN_VALUE) {
			return false;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr =
			"SELECT  ENCUSTOMERSERVICES.CODE FROM  ENCUSTOMERSERVICES WHERE  ENCUSTOMERSERVICES.CODE = ?";
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObjectCode);
			set = statement.executeQuery();
			if(set.next()) {
				return true;
			}
			return false;
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

	public static String processCondition(String aCondition) {
		if(aCondition == null || aCondition.length() == 0) {
			return "";
		}

		StringBuffer condition = new StringBuffer(aCondition);
		_checkConditionToken(condition,";"," ");
		_checkConditionToken(condition,"--"," ");
		_checkConditionToken(condition,"\r"," ");
		_checkConditionToken(condition,"\n"," ");
		_checkConditionToken(condition,"||"," OR ");
		_checkConditionToken(condition,"&&"," AND ");
		_checkConditionToken(condition,"==","=");
		_checkConditionToken(condition,"!=","<>");
		/*
		_checkConditionToken(condition,"customername","ENCUSTOMERSERVICES.CUSTOMERNAME");
		_checkConditionToken(condition,"customeraddress","ENCUSTOMERSERVICES.CUSTOMERADDRESS");
		_checkConditionToken(condition,"objectsaddress","ENCUSTOMERSERVICES.OBJECTSADDRESS");
		_checkConditionToken(condition,"docnum","ENCUSTOMERSERVICES.DOCNUM");
		_checkConditionToken(condition,"dateregistration","ENCUSTOMERSERVICES.DATEREGISTRATION");
		_checkConditionToken(condition,"typename","ENCUSTOMERSERVICES.TYPENAME");
		_checkConditionToken(condition,"servicename","ENCUSTOMERSERVICES.SERVICENAME");
		_checkConditionToken(condition,"docstatus","ENCUSTOMERSERVICES.DOCSTATUS");
		_checkConditionToken(condition,"sourceinfo","ENCUSTOMERSERVICES.SOURCEINFO");
		_checkConditionToken(condition,"sourcetable","ENCUSTOMERSERVICES.SOURCETABLE");
		_checkConditionToken(condition,"sourcetablecode","ENCUSTOMERSERVICES.SOURCETABLECODE");
		_checkConditionToken(condition,"sourcetype","ENCUSTOMERSERVICES.SOURCETYPE");
		*/
		// relationship conditions
		return condition.toString();
	}

	@Override
	public Connection getConnection() {
		try {
			if(super.getConnection() != null && !super.getConnection().isClosed())
			return super.getConnection();

			InitialContext initialContext = new InitialContext();
			DataSource dataSource = (DataSource)initialContext.lookup(AuthorizationJNDINames.ENERGYNET_DATASOURCE);
			return dataSource.getConnection();
		}
		catch (NamingException e) {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
		catch (SQLException e)    {throw new SystemException("Can't get connection. JNDI = {%"+AuthorizationJNDINames.ENERGYNET_DATASOURCE+"%}",e);}
	}



} // end of ENCustomerServicesDAO
