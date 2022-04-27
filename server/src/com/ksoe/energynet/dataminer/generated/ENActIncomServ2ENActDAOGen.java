
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
import com.ksoe.energynet.valueobject.ENActIncomServ2ENAct;
import com.ksoe.energynet.valueobject.filter.ENActIncomServ2ENActFilter;
import com.ksoe.energynet.valueobject.brief.ENActIncomServ2ENActShort;
import com.ksoe.energynet.valueobject.lists.ENActIncomServ2ENActShortList;


/**
 * DAO Object for ENActIncomServ2ENAct;
 *
 */

public class ENActIncomServ2ENActDAOGen extends GenericDataMiner {

	public ENActIncomServ2ENActDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActIncomServ2ENActDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActIncomServ2ENAct inObject) throws PersistenceException {
		ENActIncomServ2ENAct obj = new ENActIncomServ2ENAct();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.summaGen == null && obj.summaGen == null){}
		else
			if(inObject.summaGen == null || obj.summaGen == null) return false;
			else
				if ( ! inObject.summaGen.equals(obj.summaGen)){
					return false;
				}
		if (inObject.actIncomeRef.code != obj.actIncomeRef.code){
			return false;
		}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		return true;
	}

	public int add(ENActIncomServ2ENAct anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActIncomServ2ENAct anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACTINCOMSERV2ENACT (CODE,SUMMAGEN,ACTINCOMEREFCODE,ACTREFCODE) VALUES (?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.summaGen != null) {
				anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.summaGen);
			if (anObject.actIncomeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).exists(anObject.actIncomeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomServ2ENAct.actIncomeRef.code%} = {%"+anObject.actIncomeRef.code+"%}");
				}
				statement.setInt(3,anObject.actIncomeRef.code);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncomServ2ENAct.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(4,anObject.actRef.code);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActIncomServ2ENActDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActIncomServ2ENAct anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActIncomServ2ENAct anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("SUMMAGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTINCOMEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACTINCOMSERV2ENACT SET  SUMMAGEN = ? , ACTINCOMEREFCODE = ? , ACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTINCOMSERV2ENACT SET ";
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
					if (anObject.summaGen != null) {
						anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.summaGen);
					if (anObject.actIncomeRef.code != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.actIncomeRef.code);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(3,anObject.actRef.code);
					} else {
						statement.setNull(3,java.sql.Types.INTEGER);
					}
					statement.setInt(4,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("SUMMAGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.summaGen != null) {
								anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.summaGen);
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
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actRef.code);
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

	} // end of save(ENActIncomServ2ENAct anObject,String[] anAttributes)


	public ENActIncomServ2ENActShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActIncomServ2ENAct filterObject = new ENActIncomServ2ENAct();
		Vector<ENActIncomServ2ENActShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActIncomServ2ENActShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENActIncomServ2ENAct filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.summaGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actIncomeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActIncomServ2ENActFilter filter) {
		String out = buildCondition((ENActIncomServ2ENAct)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActIncomServ2ENAct filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActIncomServ2ENAct.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.summaGen, ENActIncomServ2ENAct.summaGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actIncomeRef.code, ENActIncomServ2ENAct.actIncomeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENActIncomServ2ENAct.actRef_QFielld, out);
		}
		return out;
	}

	public ENActIncomServ2ENActShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActIncomServ2ENActShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActIncomServ2ENActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActIncomServ2ENActShortList getFilteredList(ENActIncomServ2ENAct filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActIncomServ2ENActShortList getScrollableFilteredList(ENActIncomServ2ENAct aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActIncomServ2ENActShortList getScrollableFilteredList(ENActIncomServ2ENAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActIncomServ2ENActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActIncomServ2ENActShortList getScrollableFilteredList(ENActIncomServ2ENActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActIncomServ2ENActShortList getScrollableFilteredList(ENActIncomServ2ENActFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActIncomServ2ENActShortList getScrollableFilteredList(ENActIncomServ2ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActIncomServ2ENActShortList result = new ENActIncomServ2ENActShortList();
		ENActIncomServ2ENActShort anObject;
		result.list = new Vector<ENActIncomServ2ENActShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMSERV2ENACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINCOMSERV2ENACT.CODE"+
			",ENACTINCOMSERV2ENACT.SUMMAGEN"+
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
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINDOCCODE " +
			", ENACT.FINDOCMECHANICCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
		" FROM ENACTINCOMSERV2ENACT " +
			", ENACTINCOMESERVICES " +
			", ENACT " +
		"";
		whereStr = " ENACTINCOMESERVICES.CODE = ENACTINCOMSERV2ENACT.ACTINCOMEREFCODE" ; //+
		whereStr += " AND ENACT.CODE = ENACTINCOMSERV2ENACT.ACTREFCODE" ; //+

	
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
				anObject = new ENActIncomServ2ENActShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.summaGen = set.getBigDecimal(2);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.actIncomeRefCode = set.getInt(3);
				if(set.wasNull()) {
					anObject.actIncomeRefCode = Integer.MIN_VALUE;
				}
				anObject.actIncomeRefNumberGen = set.getString(4);
				anObject.actIncomeRefDateGen = set.getDate(5);
				anObject.actIncomeRefActDateStart = set.getDate(6);
				anObject.actIncomeRefActDateEnd = set.getDate(7);
				anObject.actIncomeRefSummaGen = set.getBigDecimal(8);
				if(anObject.actIncomeRefSummaGen != null) {
					anObject.actIncomeRefSummaGen = anObject.actIncomeRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefSummaVat = set.getBigDecimal(9);
				if(anObject.actIncomeRefSummaVat != null) {
					anObject.actIncomeRefSummaVat = anObject.actIncomeRefSummaVat.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRefDateAdd = set.getTimestamp(10);
				anObject.actIncomeRefDateEdit = set.getTimestamp(11);
				anObject.actIncomeRefUserGen = set.getString(12);
				anObject.actRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(14);
				anObject.actRefDateGen = set.getDate(15);
				anObject.actRefFinDocCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(18);
				anObject.actRefFinMechanicName = set.getString(19);
				anObject.actRefInvNumber = set.getString(20);
				anObject.actRefUserGen = set.getString(21);
				anObject.actRefDateEdit = set.getDate(22);
				anObject.actRefDateAct = set.getDate(23);
				anObject.actRefMolCodeObject = set.getString(24);

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
	
	public int[] getFilteredCodeArray(ENActIncomServ2ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActIncomServ2ENActFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENActIncomServ2ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTINCOMSERV2ENACT.CODE FROM ENACTINCOMSERV2ENACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOMSERV2ENACT.CODE";
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


	public ENActIncomServ2ENAct getObject(int uid) throws PersistenceException {
		ENActIncomServ2ENAct result = new ENActIncomServ2ENAct();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENActIncomServ2ENAct anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACTINCOMSERV2ENACT.CODE, ENACTINCOMSERV2ENACT.SUMMAGEN, ENACTINCOMSERV2ENACT.ACTINCOMEREFCODE, ENACTINCOMSERV2ENACT.ACTREFCODE "
			+" FROM ENACTINCOMSERV2ENACT WHERE ENACTINCOMSERV2ENACT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.summaGen = set.getBigDecimal(2);
				if(anObject.summaGen != null) {
					anObject.summaGen = anObject.summaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.actIncomeRef.code = set.getInt(3);
				if (set.wasNull()) {
					anObject.actIncomeRef.code = Integer.MIN_VALUE;
				}
				anObject.actRef.code = set.getInt(4);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				if(anObject.actIncomeRef.code != Integer.MIN_VALUE) {
					anObject.setActIncomeRef(
						new com.ksoe.energynet.dataminer.generated.ENActIncomeServicesDAOGen(connection,getUserProfile()).getRef(anObject.actIncomeRef.code));
				}
				if(anObject.actRef.code != Integer.MIN_VALUE) {
					anObject.setActRef(
						new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENActIncomServ2ENActRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActIncomServ2ENActRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomServ2ENActRef();
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

		selectStr = "DELETE FROM  ENACTINCOMSERV2ENACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActIncomServ2ENAct object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActIncomServ2ENAct.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomServ2ENAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomServ2ENAct.remove%} access denied");
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
	
	public long count(ENActIncomServ2ENActFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActIncomServ2ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActIncomServ2ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTINCOMSERV2ENACT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActIncomServ2ENActFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTINCOMSERV2ENACT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncomServ2ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncomServ2ENAct.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACTINCOMSERV2ENACT.CODE FROM  ENACTINCOMSERV2ENACT WHERE  ENACTINCOMSERV2ENACT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACTINCOMSERV2ENACT.CODE");
		_checkConditionToken(condition,"summagen","ENACTINCOMSERV2ENACT.SUMMAGEN");
		// relationship conditions
		_checkConditionToken(condition,"actincomeref","ACTINCOMEREFCODE");
		_checkConditionToken(condition,"actincomeref.code","ACTINCOMEREFCODE");
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENActIncomServ2ENAct anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTINCOMSERV2ENACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTINCOMSERV2ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTINCOMSERV2ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTINCOMSERV2ENACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActIncomServ2ENActDAO
