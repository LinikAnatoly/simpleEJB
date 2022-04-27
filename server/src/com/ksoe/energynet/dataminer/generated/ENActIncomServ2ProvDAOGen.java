
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
import com.ksoe.energynet.valueobject.ENActIncomServ2Prov;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ProvFilter;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ProvShort;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ProvShortList;


/**
 * DAO Object for ENActIncomServ2Prov;
 *
 */

public class ENActIncomServ2ProvDAOGen extends GenericDataMiner {

	public ENActIncomServ2ProvDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActIncomServ2ProvDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActIncomServ2Prov inObject) throws PersistenceException {
		ENActIncomServ2Prov obj = new ENActIncomServ2Prov();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.partId != obj.partId){
					return false;
				}

		if(inObject.datePosting == null && obj.datePosting == null){} else 
			if(inObject.datePosting == null || obj.datePosting == null) return false;
			else
				if (inObject.datePosting.compareTo(obj.datePosting) != 0){
					return false;
				}

		if(inObject.voucher == null && obj.voucher == null){}
		else
			if(inObject.voucher == null || obj.voucher == null) return false;
			else
				if ( ! inObject.voucher.equals(obj.voucher)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.actIncomeRef.code != obj.actIncomeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENActIncomServ2Prov anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActIncomServ2Prov anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTINCOMSERV2PROV (CODE,PARTID,DATEPOSTING,VOUCHER,DATEEDIT,USERGEN,ACTINCOMEREFCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.partId != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.partId);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			if (anObject.datePosting == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.datePosting.getTime()));
			}
			statement.setString(4,anObject.voucher);
			if (anObject.dateEdit == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			statement.setString(6,anObject.userGen);
			if (anObject.actIncomeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).exists(anObject.actIncomeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomServ2Prov.actIncomeRef.code%} = {%"+anObject.actIncomeRef.code+"%}");
				}
				statement.setInt(7,anObject.actIncomeRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActIncomServ2ProvDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActIncomServ2Prov anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActIncomServ2Prov anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("PARTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPOSTING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOUCHER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTINCOMEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTINCOMSERV2PROV SET  PARTID = ? , DATEPOSTING = ? , VOUCHER = ? , DATEEDIT = ? , USERGEN = ? , ACTINCOMEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTINCOMSERV2PROV SET ";
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
					if (anObject.partId != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.partId);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					if (anObject.datePosting == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.datePosting.getTime()));
					}
					statement.setString(3,anObject.voucher);
					if (anObject.dateEdit == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					statement.setString(5,anObject.userGen);
					if (anObject.actIncomeRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.actIncomeRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					statement.setInt(7,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PARTID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.partId);
							continue;
						}
						if("DATEPOSTING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datePosting == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.datePosting.getTime()));
							}
							continue;
						}
						if("VOUCHER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.voucher);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("ACTINCOMEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actIncomeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actIncomeRef.code);
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

	} // end of save(ENActIncomServ2Prov anObject,String[] anAttributes)


	public ENActIncomServ2ProvShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActIncomServ2Prov filterObject = new ENActIncomServ2Prov();
		Vector<ENActIncomServ2ProvShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActIncomServ2ProvShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActIncomServ2Prov filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partId, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePosting, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.voucher, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actIncomeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActIncomServ2ProvFilter filter) {
		String out = buildCondition((ENActIncomServ2Prov)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActIncomServ2Prov filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActIncomServ2Prov.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partId, ENActIncomServ2Prov.partId_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePosting, ENActIncomServ2Prov.datePosting_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.voucher, ENActIncomServ2Prov.voucher_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENActIncomServ2Prov.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENActIncomServ2Prov.userGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actIncomeRef.code, ENActIncomServ2Prov.actIncomeRef_QFielld, out);
		}
		return out;
	}

	public ENActIncomServ2ProvShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActIncomServ2ProvShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActIncomServ2ProvShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActIncomServ2ProvShortList getFilteredList(ENActIncomServ2Prov filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActIncomServ2ProvShortList getScrollableFilteredList(ENActIncomServ2Prov aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActIncomServ2ProvShortList getScrollableFilteredList(ENActIncomServ2Prov aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActIncomServ2ProvShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActIncomServ2ProvShortList getScrollableFilteredList(ENActIncomServ2ProvFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActIncomServ2ProvShortList getScrollableFilteredList(ENActIncomServ2ProvFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActIncomServ2ProvShortList getScrollableFilteredList(ENActIncomServ2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActIncomServ2ProvShortList result = new ENActIncomServ2ProvShortList();
		ENActIncomServ2ProvShort anObject;
		result.list = new Vector<ENActIncomServ2ProvShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMSERV2PROV.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINCOMSERV2PROV.CODE"+
			",ENACTINCOMSERV2PROV.PARTID"+
			",ENACTINCOMSERV2PROV.DATEPOSTING"+
			",ENACTINCOMSERV2PROV.VOUCHER"+
			",ENACTINCOMSERV2PROV.DATEEDIT"+
			",ENACTINCOMSERV2PROV.USERGEN"+
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
		" FROM ENACTINCOMSERV2PROV " +
			", ENACTINCOMESERVICES " +
		"";
		whereStr = " ENACTINCOMESERVICES.CODE = ENACTINCOMSERV2PROV.ACTINCOMEREFCODE" ; //+

	
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
				anObject = new ENActIncomServ2ProvShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.partId = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.datePosting = set.getDate(3);
				anObject.voucher = set.getString(4);
				anObject.dateEdit = set.getDate(5);
				anObject.userGen = set.getString(6);

				anObject.actIncomeRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.actIncomeRefCode = Integer.MIN_VALUE;
				}
				anObject.actIncomeRefNumberGen = set.getString(8);
				anObject.actIncomeRefDateGen = set.getDate(9);
				anObject.actIncomeRefActDateStart = set.getDate(10);
				anObject.actIncomeRefActDateEnd = set.getDate(11);
				anObject.actIncomeRefSummaGen = set.getBigDecimal(12);
				if(anObject.actIncomeRefSummaGen != null) {
					anObject.actIncomeRefSummaGen = anObject.actIncomeRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefSummaVat = set.getBigDecimal(13);
				if(anObject.actIncomeRefSummaVat != null) {
					anObject.actIncomeRefSummaVat = anObject.actIncomeRefSummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefDateAdd = set.getTimestamp(14);
				anObject.actIncomeRefDateEdit = set.getTimestamp(15);
				anObject.actIncomeRefUserGen = set.getString(16);

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
	
	public int[] getFilteredCodeArray(ENActIncomServ2ProvFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActIncomServ2ProvFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActIncomServ2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTINCOMSERV2PROV.CODE FROM ENACTINCOMSERV2PROV";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMSERV2PROV.CODE";
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


	public ENActIncomServ2Prov getObject(int uid) throws PersistenceException {
		ENActIncomServ2Prov result = new ENActIncomServ2Prov();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENActIncomServ2Prov anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACTINCOMSERV2PROV.CODE, ENACTINCOMSERV2PROV.PARTID, ENACTINCOMSERV2PROV.DATEPOSTING, ENACTINCOMSERV2PROV.VOUCHER, ENACTINCOMSERV2PROV.DATEEDIT, ENACTINCOMSERV2PROV.USERGEN, ENACTINCOMSERV2PROV.ACTINCOMEREFCODE "
			+" FROM ENACTINCOMSERV2PROV WHERE ENACTINCOMSERV2PROV.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.partId = set.getInt(2);
				if (set.wasNull()) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.datePosting = set.getDate(3);
				anObject.voucher = set.getString(4);
				anObject.dateEdit = set.getDate(5);
				anObject.userGen = set.getString(6);
				anObject.actIncomeRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.actIncomeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.actIncomeRef.code != Integer.MIN_VALUE) {
					anObject.setActIncomeRef(
						new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).getRef(anObject.actIncomeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENActIncomServ2ProvRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActIncomServ2ProvRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomServ2ProvRef();
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

		selectStr = "DELETE FROM  ENACTINCOMSERV2PROV WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActIncomServ2Prov object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActIncomServ2Prov.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomServ2Prov.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomServ2Prov.remove%} access denied");
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
	
	public long count(ENActIncomServ2ProvFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActIncomServ2ProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActIncomServ2ProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTINCOMSERV2PROV", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActIncomServ2ProvFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTINCOMSERV2PROV");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomServ2Prov.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomServ2Prov.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACTINCOMSERV2PROV.CODE FROM  ENACTINCOMSERV2PROV WHERE  ENACTINCOMSERV2PROV.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTINCOMSERV2PROV.CODE");
		_checkConditionToken(condition,"partid","ENACTINCOMSERV2PROV.PARTID");
		_checkConditionToken(condition,"dateposting","ENACTINCOMSERV2PROV.DATEPOSTING");
		_checkConditionToken(condition,"voucher","ENACTINCOMSERV2PROV.VOUCHER");
		_checkConditionToken(condition,"dateedit","ENACTINCOMSERV2PROV.DATEEDIT");
		_checkConditionToken(condition,"usergen","ENACTINCOMSERV2PROV.USERGEN");
		// relationship conditions
		_checkConditionToken(condition,"actincomeref","ACTINCOMEREFCODE");
		_checkConditionToken(condition,"actincomeref.code","ACTINCOMEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENActIncomServ2Prov anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTINCOMSERV2PROV", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTINCOMSERV2PROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTINCOMSERV2PROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTINCOMSERV2PROV");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActIncomServ2ProvDAO
