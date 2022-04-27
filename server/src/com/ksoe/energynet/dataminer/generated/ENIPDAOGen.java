
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
import com.ksoe.energynet.valueobject.ENIP;
import com.ksoe.energynet.valueobject.filter.ENIPFilter;
import com.ksoe.energynet.valueobject.brief.ENIPShort;
import com.ksoe.energynet.valueobject.lists.ENIPShortList;


/**
 * DAO Object for ENIP;
 *
 */

public class ENIPDAOGen extends GenericDataMiner {

	public ENIPDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENIPDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENIP inObject) throws PersistenceException {
		ENIP obj = new ENIP();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if (inObject.yearGen != obj.yearGen){
					return false;
				}

		if (inObject.version != obj.version){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.userEdit == null && obj.userEdit == null){}
		else
			if(inObject.userEdit == null || obj.userEdit == null) return false;
			else
				if ( ! inObject.userEdit.equals(obj.userEdit)){
					return false;
				}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENIP anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENIP anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENIP (CODE,NAME,YEARGEN,VERSION,COMMENTGEN,DATEADD,DATEEDIT,USERADD,USEREDIT,MODIFY_TIME,STATUSREFCODE,PARENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.name);
			if (anObject.yearGen != Integer.MIN_VALUE ) {
				statement.setInt(3,anObject.yearGen);
			} else {
				statement.setNull(3,java.sql.Types.INTEGER);
			}
			if (anObject.version != Integer.MIN_VALUE ) {
				statement.setInt(4,anObject.version);
			} else {
				statement.setNull(4,java.sql.Types.INTEGER);
			}
			statement.setString(5,anObject.commentGen);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(6,null);
			} else {
				statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setTimestamp(7,null);
			} else {
				statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(8,anObject.userAdd);
			statement.setString(9,anObject.userEdit);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(10,null);
			} else {
				statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIP.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(11,anObject.statusRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPDAOGen(connection,getUserProfile()).exists(anObject.parentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIP.parentRef.code%} = {%"+anObject.parentRef.code+"%}");
				}
				statement.setInt(12,anObject.parentRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENIPDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENIP anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENIP anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENIP oldObject = new ENIP();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENIP.modify_time_Field+" FROM  ENIP WHERE CODE = ?";
			ResultSet set = null;
			try {
				statement = connection.prepareStatement(oldObjectSelectStr);
				statement.setInt(1,oldObject.code);
				set = statement.executeQuery();
				if(!set.next()) {
					throw new PersistenceException("Can't get old object.");
				}
				oldObject.modify_time = set.getLong(1);
				if(set.wasNull()) {
					oldObject.modify_time = Long.MIN_VALUE;
				}
			} catch(SQLException e) {
				System.out.println(e.getMessage()+"\nstatement - "+oldObjectSelectStr);
				throw new SystemException(e.getMessage(), e);
			} finally {
				try {if (set != null) set.close();} catch (SQLException e) {}
				try {if (statement != null) statement.close();} catch (SQLException e) {}
				statement = null;
			}
			if(oldObject.modify_time != anObject.modify_time) {
				throw new PersistenceException("Can't update object (optimistic locking).");
			}
			anObject.modify_time = System.currentTimeMillis();

			String selectStr;

			Vector<String> fields = null;
			if(anAttributes != null) {
				String fieldNameStr;
				fields = new Vector<String>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("YEARGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VERSION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEREDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENIP SET  NAME = ? , YEARGEN = ? , VERSION = ? , COMMENTGEN = ? , DATEADD = ? , DATEEDIT = ? , USERADD = ? , USEREDIT = ? , MODIFY_TIME = ? , STATUSREFCODE = ? , PARENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENIP SET ";
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
					statement.setString(1,anObject.name);
					if (anObject.yearGen != Integer.MIN_VALUE) {
						statement.setInt(2,anObject.yearGen);
					} else {
						statement.setNull(2,java.sql.Types.INTEGER);
					}
					if (anObject.version != Integer.MIN_VALUE) {
						statement.setInt(3,anObject.version);
					} else {
						statement.setNull(3,java.sql.Types.INTEGER);
					}
					statement.setString(4,anObject.commentGen);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(5,null);
					} else {
						statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setTimestamp(6,null);
					} else {
						statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(7,anObject.userAdd);
					statement.setString(8,anObject.userEdit);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(9,null);
					} else {
						statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.statusRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.parentRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("YEARGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.yearGen);
							continue;
						}
						if("VERSION".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.version);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
							continue;
						}
						if("USEREDIT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userEdit);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.statusRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PARENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.parentRef.code);
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

	} // end of save(ENIP anObject,String[] anAttributes)


	public ENIPShort getShortObject(int anObjectCode) throws PersistenceException {
		ENIP filterObject = new ENIP();
		Vector<ENIPShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENIPShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENIP filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.yearGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.version, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENIPFilter filter) {
		String out = buildCondition((ENIP)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENIP filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENIP.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENIP.name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.yearGen, ENIP.yearGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.version, ENIP.version_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENIP.commentGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENIP.dateAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENIP.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENIP.userAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userEdit, ENIP.userEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENIP.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENIP.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, ENIP.parentRef_QFielld, out);
		}
		return out;
	}

	public ENIPShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENIPShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENIPShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENIPShortList getFilteredList(ENIP filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENIPShortList getScrollableFilteredList(ENIP aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENIPShortList getScrollableFilteredList(ENIP aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENIPShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENIPShortList getScrollableFilteredList(ENIPFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENIPShortList getScrollableFilteredList(ENIPFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENIPShortList getScrollableFilteredList(ENIP aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENIPShortList result = new ENIPShortList();
		ENIPShort anObject;
		result.list = new Vector<ENIPShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIP.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENIP.CODE"+
			",ENIP.NAME"+
			",ENIP.YEARGEN"+
			",ENIP.VERSION"+
			",ENIP.COMMENTGEN"+
			",ENIP.DATEADD"+
			",ENIP.DATEEDIT"+
			",ENIP.USERADD"+
			",ENIP.USEREDIT"+
			", ENIPSTATUS.CODE " +
			", ENIPSTATUS.NAME " +
			", ENIP.CODE " +
			", ENIP.NAME " +
			", ENIP.YEARGEN " +
			", ENIP.VERSION " +
			", ENIP.COMMENTGEN " +
			", ENIP.DATEADD " +
			", ENIP.DATEEDIT " +
			", ENIP.USERADD " +
			", ENIP.USEREDIT " +
		" FROM ENIP " +
			", ENIPSTATUS " +
			", ENIP " +
		"";
		whereStr = " ENIPSTATUS.CODE = ENIP.STATUSREFCODE" ; //+
		whereStr += " AND ENIP.CODE = ENIP.PARENTREFCODE" ; //+

	
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
				anObject = new ENIPShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.yearGen = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.version = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.version = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(5);
				anObject.dateAdd = set.getTimestamp(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.userAdd = set.getString(8);
				anObject.userEdit = set.getString(9);

				anObject.statusRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(11);
				anObject.parentRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefName = set.getString(13);
				anObject.parentRefYearGen = set.getInt(14);
				if(set.wasNull()) {
					anObject.parentRefYearGen = Integer.MIN_VALUE;
				}
				anObject.parentRefVersion = set.getInt(15);
				if(set.wasNull()) {
					anObject.parentRefVersion = Integer.MIN_VALUE;
				}
				anObject.parentRefCommentGen = set.getString(16);
				anObject.parentRefDateAdd = set.getTimestamp(17);
				anObject.parentRefDateEdit = set.getTimestamp(18);
				anObject.parentRefUserAdd = set.getString(19);
				anObject.parentRefUserEdit = set.getString(20);

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
	
	public int[] getFilteredCodeArray(ENIPFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENIPFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENIP aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENIP.CODE FROM ENIP";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIP.CODE";
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

	public ENIP getObject(int uid) throws PersistenceException {
		ENIP result = new ENIP();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENIP anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENIP.CODE, ENIP.NAME, ENIP.YEARGEN, ENIP.VERSION, ENIP.COMMENTGEN, ENIP.DATEADD, ENIP.DATEEDIT, ENIP.USERADD, ENIP.USEREDIT, ENIP.MODIFY_TIME, ENIP.STATUSREFCODE, ENIP.PARENTREFCODE "
			+" FROM ENIP WHERE ENIP.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.yearGen = set.getInt(3);
				if (set.wasNull()) {
					anObject.yearGen = Integer.MIN_VALUE;
				}
				anObject.version = set.getInt(4);
				if (set.wasNull()) {
					anObject.version = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(5);
				anObject.dateAdd = set.getTimestamp(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.userAdd = set.getString(8);
				anObject.userEdit = set.getString(9);
				anObject.modify_time = set.getLong(10);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
				}
				if(anObject.statusRef.code != Integer.MIN_VALUE) {
					anObject.setStatusRef(
						new com.ksoe.energynet.dataminer.generated.ENIPStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
				}
				if(anObject.parentRef.code != Integer.MIN_VALUE) {
					anObject.setParentRef(
						new com.ksoe.energynet.dataminer.generated.ENIPDAOGen(connection,getUserProfile()).getRef(anObject.parentRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENIPRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENIPRef ref = new com.ksoe.energynet.valueobject.references.ENIPRef();
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

		selectStr = "DELETE FROM  ENIP WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENIP object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENIP.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENIP.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENIP.remove%} access denied");
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
	
	public long count(ENIPFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENIPFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENIPFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENIP", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENIPFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENIP");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENIP.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENIP.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENIP.CODE FROM  ENIP WHERE  ENIP.CODE = ?";
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
		_checkConditionToken(condition,"code","ENIP.CODE");
		_checkConditionToken(condition,"name","ENIP.NAME");
		_checkConditionToken(condition,"yeargen","ENIP.YEARGEN");
		_checkConditionToken(condition,"version","ENIP.VERSION");
		_checkConditionToken(condition,"commentgen","ENIP.COMMENTGEN");
		_checkConditionToken(condition,"dateadd","ENIP.DATEADD");
		_checkConditionToken(condition,"dateedit","ENIP.DATEEDIT");
		_checkConditionToken(condition,"useradd","ENIP.USERADD");
		_checkConditionToken(condition,"useredit","ENIP.USEREDIT");
		_checkConditionToken(condition,"modify_time","ENIP.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENIP anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENIP", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENIP", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENIP", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENIP");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENIPDAO
