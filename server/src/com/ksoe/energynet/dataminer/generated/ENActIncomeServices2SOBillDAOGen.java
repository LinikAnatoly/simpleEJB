
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENActIncomeServices2SOBill;
import com.ksoe.energynet.valueobject.filter.ENActIncomeServices2SOBillFilter;
import com.ksoe.energynet.valueobject.brief.ENActIncomeServices2SOBillShort;
import com.ksoe.energynet.valueobject.lists.ENActIncomeServices2SOBillShortList;


/**
 * DAO Object for ENActIncomeServices2SOBill;
 *
 */

public class ENActIncomeServices2SOBillDAOGen extends GenericDataMiner {

	public ENActIncomeServices2SOBillDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActIncomeServices2SOBillDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActIncomeServices2SOBill inObject) throws PersistenceException {
		ENActIncomeServices2SOBill obj = new ENActIncomeServices2SOBill();
		obj.code = inObject.code;
		loadObject(obj);
		if (inObject.actIncomeRef.code != obj.actIncomeRef.code){
			return false;
		}
		if (inObject.soBillRef.code != obj.soBillRef.code){
			return false;
		}
		return true;
	}

	public int add(ENActIncomeServices2SOBill anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActIncomeServices2SOBill anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTINCOMESERVCS2SBLL (CODE,ACTINCOMEREFCODE,SOBILLREFCODE) VALUES (?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.actIncomeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).exists(anObject.actIncomeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices2SOBill.actIncomeRef.code%} = {%"+anObject.actIncomeRef.code+"%}");
				}
				statement.setInt(2,anObject.actIncomeRef.code);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.soBillRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).exists(anObject.soBillRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomeServices2SOBill.soBillRef.code%} = {%"+anObject.soBillRef.code+"%}");
				}
				statement.setInt(3,anObject.soBillRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActIncomeServices2SOBillDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActIncomeServices2SOBill anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActIncomeServices2SOBill anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;


			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTINCOMEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SOBILLREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTINCOMESERVCS2SBLL SET ACTINCOMEREFCODE = ? , SOBILLREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTINCOMESERVICES2SOBILL SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					selectStr+=(String)fields.get(fldIndex);
					if(fldIndex > 0) {
						selectStr+=",";
					}
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					if (anObject.actIncomeRef.code != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.actIncomeRef.code);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.soBillRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.soBillRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					statement.setInt(3,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("ACTINCOMEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actIncomeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actIncomeRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SOBILLREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.soBillRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.soBillRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(),anObject.code);
				}
				statement.execute();
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+selectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (statement != null) statement.close();} catch (SQLException e) {}
			}
		} finally {
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}

	} // end of save(ENActIncomeServices2SOBill anObject,String[] anAttributes)


	public ENActIncomeServices2SOBillShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActIncomeServices2SOBill filterObject = new ENActIncomeServices2SOBill();
		Vector<ENActIncomeServices2SOBillShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActIncomeServices2SOBillShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActIncomeServices2SOBill filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actIncomeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.soBillRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActIncomeServices2SOBillFilter filter) {
		String out = buildCondition((ENActIncomeServices2SOBill)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActIncomeServices2SOBill filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActIncomeServices2SOBill.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actIncomeRef.code, ENActIncomeServices2SOBill.actIncomeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.soBillRef.code, ENActIncomeServices2SOBill.soBillRef_QFielld, out);
		}
		return out;
	}

	public ENActIncomeServices2SOBillShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActIncomeServices2SOBillShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActIncomeServices2SOBillShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActIncomeServices2SOBillShortList getFilteredList(ENActIncomeServices2SOBill filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(ENActIncomeServices2SOBill aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(ENActIncomeServices2SOBill aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(ENActIncomeServices2SOBillFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(ENActIncomeServices2SOBillFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActIncomeServices2SOBillShortList getScrollableFilteredList(ENActIncomeServices2SOBill aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActIncomeServices2SOBillShortList result = new ENActIncomeServices2SOBillShortList();
		ENActIncomeServices2SOBillShort anObject;
		result.list = new Vector<ENActIncomeServices2SOBillShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMESERVCS2SBLL.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINCOMESERVCS2SBLL.CODE"+
			", ENACTINCOMESERVICES.CODE " +
			", ENACTINCOMESERVICES.NUMBERGEN " +
			", ENACTINCOMESERVICES.DATEGEN " +
			", ENACTINCOMESERVICES.ACTDATESTART " +
			", ENACTINCOMESERVICES.ACTDATEEND " +
			", ENACTINCOMESERVICES.SUMMAGEN " +
			", ENACTINCOMESERVICES.SUMMAVAT " +
			", ENACTINCOMESERVICES.DATEADD " +
			", ENACTINCOMESERVICES.DATEEDIT " +
			", ENACTINCOMESERVICES.USERGEN " +
			", ENSOBILL.CODE " +
			", ENSOBILL.DATEGEN " +
			", ENSOBILL.SUMTOTAL " +
			", ENSOBILL.SUMGEN " +
			", ENSOBILL.SUMVAT " +
			", ENSOBILL.USERGEN " +
			", ENSOBILL.DATEEDIT " +
		" FROM ENACTINCOMESERVCS2SBLL " +
			", ENACTINCOMESERVICES " +
			", ENSOBILL " +
		"";
		whereStr = " ENACTINCOMESERVICES.CODE = ENACTINCOMESERVCS2SBLL.ACTINCOMEREFCODE" ; //+
		whereStr += " AND ENSOBILL.CODE = ENACTINCOMESERVCS2SBLL.SOBILLREFCODE" ; //+

	
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
				anObject = new ENActIncomeServices2SOBillShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.actIncomeRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.actIncomeRefCode = Integer.MIN_VALUE;
				}
				anObject.actIncomeRefNumberGen = set.getString(3);
				anObject.actIncomeRefDateGen = set.getDate(4);
				anObject.actIncomeRefActDateStart = set.getDate(5);
				anObject.actIncomeRefActDateEnd = set.getDate(6);
				anObject.actIncomeRefSummaGen = set.getBigDecimal(7);
				if(anObject.actIncomeRefSummaGen != null) {
					anObject.actIncomeRefSummaGen = anObject.actIncomeRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefSummaVat = set.getBigDecimal(8);
				if(anObject.actIncomeRefSummaVat != null) {
					anObject.actIncomeRefSummaVat = anObject.actIncomeRefSummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefDateAdd = set.getTimestamp(9);
				anObject.actIncomeRefDateEdit = set.getTimestamp(10);
				anObject.actIncomeRefUserGen = set.getString(11);
				anObject.soBillRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.soBillRefCode = Integer.MIN_VALUE;
				}
				anObject.soBillRefDateGen = set.getDate(13);
				anObject.soBillRefSumTotal = set.getBigDecimal(14);
				if(anObject.soBillRefSumTotal != null) {
					anObject.soBillRefSumTotal = anObject.soBillRefSumTotal.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.soBillRefSumGen = set.getBigDecimal(15);
				if(anObject.soBillRefSumGen != null) {
					anObject.soBillRefSumGen = anObject.soBillRefSumGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.soBillRefSumVat = set.getBigDecimal(16);
				if(anObject.soBillRefSumVat != null) {
					anObject.soBillRefSumVat = anObject.soBillRefSumVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.soBillRefUserGen = set.getString(17);
				anObject.soBillRefDateEdit = set.getTimestamp(18);

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
	
	public int[] getFilteredCodeArray(ENActIncomeServices2SOBillFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActIncomeServices2SOBillFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActIncomeServices2SOBill aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTINCOMESERVCS2SBLL.CODE FROM ENACTINCOMESERVCS2SBLL";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMESERVCS2SBLL.CODE";
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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

	public ENActIncomeServices2SOBill getObject(int uid) throws PersistenceException {
		ENActIncomeServices2SOBill result = new ENActIncomeServices2SOBill();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENActIncomeServices2SOBill anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENACTINCOMESERVCS2SBLL.CODE, ENACTINCOMESERVCS2SBLL.ACTINCOMEREFCODE, ENACTINCOMESERVCS2SBLL.SOBILLREFCODE "
			+" FROM ENACTINCOMESERVCS2SBLL WHERE ENACTINCOMESERVCS2SBLL.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.actIncomeRef.code = set.getInt(2);
				if (set.wasNull()) {
					anObject.actIncomeRef.code = Integer.MIN_VALUE;
				}
				anObject.soBillRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.soBillRef.code = Integer.MIN_VALUE;
				}
				if(anObject.actIncomeRef.code != Integer.MIN_VALUE) {
					anObject.setActIncomeRef(
						new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).getRef(anObject.actIncomeRef.code));
				}
				if(anObject.soBillRef.code != Integer.MIN_VALUE) {
					anObject.setSoBillRef(
						new com.ksoe.energynet.dataminer.generated.ENSOBillDAOGen(connection,getUserProfile()).getRef(anObject.soBillRef.code));
				}
			}
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if(set != null) set.close(); if (statement != null) statement.close();}
			catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}


	public com.ksoe.energynet.valueobject.references.ENActIncomeServices2SOBillRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActIncomeServices2SOBillRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomeServices2SOBillRef();
		if(exists(anObjectCode)) {
			ref.code = anObjectCode;
		} else {
			ref.code = Integer.MIN_VALUE;
		}
		return ref;
	}

	public void remove(int uid) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();

		selectStr = "DELETE FROM  ENACTINCOMESERVCS2SBLL WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActIncomeServices2SOBill object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActIncomeServices2SOBill.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeServices2SOBill.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomeServices2SOBill.remove%} access denied");
		}

		PreparedStatement statement = null;
		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,uid);
			statement.execute();
		} catch(SQLException e) {
			System.out.println(e.getMessage()+"\nstatement - "+selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}
	
	public long count(ENActIncomeServices2SOBillFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActIncomeServices2SOBillFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActIncomeServices2SOBillFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTINCOMESERVCS2SBLL", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActIncomeServices2SOBillFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTINCOMESERVCS2SBLL");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomeServices2SOBill.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomeServices2SOBill.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACTINCOMESERVCS2SBLL.CODE FROM  ENACTINCOMESERVCS2SBLL WHERE  ENACTINCOMESERVCS2SBLL.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTINCOMESERVCS2SBLL.CODE");
		// relationship conditions
		_checkConditionToken(condition,"actincomeref","ACTINCOMEREFCODE");
		_checkConditionToken(condition,"actincomeref.code","ACTINCOMEREFCODE");
		_checkConditionToken(condition,"sobillref","SOBILLREFCODE");
		_checkConditionToken(condition,"sobillref.code","SOBILLREFCODE");
		return condition.toString();
	}

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

	///////////// PRIVATE SECTION ///////////////
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();
	
	private void _collectAutoIncrementFields(ENActIncomeServices2SOBill anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTINCOMESERVCS2SBLL", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTINCOMESERVCS2SBLL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTINCOMESERVCS2SBLL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTINCOMESERVCS2SBLL");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActIncomeServices2SOBillDAO
