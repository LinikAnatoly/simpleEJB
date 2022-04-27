
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
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
import com.ksoe.energynet.valueobject.ENAverageCountPersonal;
import com.ksoe.energynet.valueobject.filter.ENAverageCountPersonalFilter;
import com.ksoe.energynet.valueobject.brief.ENAverageCountPersonalShort;
import com.ksoe.energynet.valueobject.lists.ENAverageCountPersonalShortList;


/**
 * DAO Object for ENAverageCountPersonal;
 *
 */

public class ENAverageCountPersonalDAOGen extends GenericDataMiner {

	public ENAverageCountPersonalDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAverageCountPersonalDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAverageCountPersonal inObject) throws PersistenceException {
		ENAverageCountPersonal obj = new ENAverageCountPersonal();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.codePodr == null && obj.codePodr == null){}
		else
			if(inObject.codePodr == null || obj.codePodr == null) return false;
			else
				if ( ! inObject.codePodr.equals(obj.codePodr)){
					return false;
				}

		if(inObject.namePodr == null && obj.namePodr == null){}
		else
			if(inObject.namePodr == null || obj.namePodr == null) return false;
			else
				if ( ! inObject.namePodr.equals(obj.namePodr)){
					return false;
				}

		if(inObject.codeCeh == null && obj.codeCeh == null){}
		else
			if(inObject.codeCeh == null || obj.codeCeh == null) return false;
			else
				if ( ! inObject.codeCeh.equals(obj.codeCeh)){
					return false;
				}

		if(inObject.nameCeh == null && obj.nameCeh == null){}
		else
			if(inObject.nameCeh == null || obj.nameCeh == null) return false;
			else
				if ( ! inObject.nameCeh.equals(obj.nameCeh)){
					return false;
				}

		if(inObject.calculateDate == null && obj.calculateDate == null){} else 
			if(inObject.calculateDate == null || obj.calculateDate == null) return false;
			else
				if (inObject.calculateDate.compareTo(obj.calculateDate) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.personalVidId == null && obj.personalVidId == null){}
		else
			if(inObject.personalVidId == null || obj.personalVidId == null) return false;
			else
				if ( ! inObject.personalVidId.equals(obj.personalVidId)){
					return false;
				}

		if(inObject.personalVidName == null && obj.personalVidName == null){}
		else
			if(inObject.personalVidName == null || obj.personalVidName == null) return false;
			else
				if ( ! inObject.personalVidName.equals(obj.personalVidName)){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		return true;
	}

	public int add(ENAverageCountPersonal anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAverageCountPersonal anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENAVERAGECOUNTPERSONAL (CODE,CODEPODR,NAMEPODR,CODECEH,NAMECEH,CALCULATEDATE,DATEEDIT,COUNTGEN,PERSONALVIDID,PERSONALVIDNAME,USERGEN,MODIFY_TIME) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.codePodr);
			statement.setString(3,anObject.namePodr);
			statement.setString(4,anObject.codeCeh);
			statement.setString(5,anObject.nameCeh);
			if (anObject.calculateDate == null) {
				statement.setDate(6,null);
			} else {
				statement.setDate(6,new java.sql.Date(anObject.calculateDate.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setDate(7,null);
			} else {
				statement.setDate(7,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8,anObject.countGen);
			statement.setString(9,anObject.personalVidId);
			statement.setString(10,anObject.personalVidName);
			statement.setString(11,anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(12,null);
			} else {
				statement.setBigDecimal(12,new java.math.BigDecimal(anObject.modify_time));
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAverageCountPersonalDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAverageCountPersonal anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAverageCountPersonal anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAverageCountPersonal oldObject = new ENAverageCountPersonal();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAverageCountPersonal.modify_time_Field+" FROM  ENAVERAGECOUNTPERSONAL WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CODEPODR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAMEPODR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CODECEH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAMECEH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCULATEDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALVIDID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONALVIDNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENAVERAGECOUNTPERSONAL SET  CODEPODR = ? , NAMEPODR = ? , CODECEH = ? , NAMECEH = ? , CALCULATEDATE = ? , DATEEDIT = ? , COUNTGEN = ? , PERSONALVIDID = ? , PERSONALVIDNAME = ? , USERGEN = ? , MODIFY_TIME = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENAVERAGECOUNTPERSONAL SET ";
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
					statement.setString(1,anObject.codePodr);
					statement.setString(2,anObject.namePodr);
					statement.setString(3,anObject.codeCeh);
					statement.setString(4,anObject.nameCeh);
					if (anObject.calculateDate == null) {
						statement.setDate(5,null);
					} else {
						statement.setDate(5,new java.sql.Date(anObject.calculateDate.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setDate(6,null);
					} else {
						statement.setDate(6,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7,anObject.countGen);
					statement.setString(8,anObject.personalVidId);
					statement.setString(9,anObject.personalVidName);
					statement.setString(10,anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(11,null);
					} else {
						statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CODEPODR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.codePodr);
							continue;
						}
						if("NAMEPODR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.namePodr);
							continue;
						}
						if("CODECEH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.codeCeh);
							continue;
						}
						if("NAMECEH".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.nameCeh);
							continue;
						}
						if("CALCULATEDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calculateDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.calculateDate.getTime()));
							}
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
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGen);
							continue;
						}
						if("PERSONALVIDID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.personalVidId);
							continue;
						}
						if("PERSONALVIDNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.personalVidName);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
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

	} // end of save(ENAverageCountPersonal anObject,String[] anAttributes)


	public ENAverageCountPersonalShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAverageCountPersonal filterObject = new ENAverageCountPersonal();
		Vector<ENAverageCountPersonalShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAverageCountPersonalShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAverageCountPersonal filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codePodr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.namePodr, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.codeCeh, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nameCeh, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.calculateDate, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalVidId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personalVidName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAverageCountPersonalFilter filter) {
		String out = buildCondition((ENAverageCountPersonal)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAverageCountPersonal filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAverageCountPersonal.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codePodr, ENAverageCountPersonal.codePodr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.namePodr, ENAverageCountPersonal.namePodr_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.codeCeh, ENAverageCountPersonal.codeCeh_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nameCeh, ENAverageCountPersonal.nameCeh_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.calculateDate, ENAverageCountPersonal.calculateDate_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENAverageCountPersonal.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENAverageCountPersonal.countGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalVidId, ENAverageCountPersonal.personalVidId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personalVidName, ENAverageCountPersonal.personalVidName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENAverageCountPersonal.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAverageCountPersonal.modify_time_QFielld, out);
		}
		return out;
	}

	public ENAverageCountPersonalShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAverageCountPersonalShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAverageCountPersonalShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAverageCountPersonalShortList getFilteredList(ENAverageCountPersonal filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonal aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonal aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAverageCountPersonalShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonalFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonalFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAverageCountPersonalShortList getScrollableFilteredList(ENAverageCountPersonal aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENAverageCountPersonalShortList result = new ENAverageCountPersonalShortList();
		ENAverageCountPersonalShort anObject;
		result.list = new Vector<ENAverageCountPersonalShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENAVERAGECOUNTPERSONAL.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENAVERAGECOUNTPERSONAL.CODE"+
			",ENAVERAGECOUNTPERSONAL.CODEPODR"+
			",ENAVERAGECOUNTPERSONAL.NAMEPODR"+
			",ENAVERAGECOUNTPERSONAL.CODECEH"+
			",ENAVERAGECOUNTPERSONAL.NAMECEH"+
			",ENAVERAGECOUNTPERSONAL.COUNTGEN"+
			",ENAVERAGECOUNTPERSONAL.PERSONALVIDID"+
			",ENAVERAGECOUNTPERSONAL.PERSONALVIDNAME"+
			",ENAVERAGECOUNTPERSONAL.USERGEN"+
		" FROM ENAVERAGECOUNTPERSONAL " +
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
				anObject = new ENAverageCountPersonalShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.codePodr = set.getString(2);
				anObject.namePodr = set.getString(3);
				anObject.codeCeh = set.getString(4);
				anObject.nameCeh = set.getString(5);
				anObject.countGen = set.getBigDecimal(6);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.personalVidId = set.getString(7);
				anObject.personalVidName = set.getString(8);
				anObject.userGen = set.getString(9);


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
	
	public int[] getFilteredCodeArray(ENAverageCountPersonalFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENAverageCountPersonal aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENAVERAGECOUNTPERSONAL.CODE FROM ENAVERAGECOUNTPERSONAL";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENAVERAGECOUNTPERSONAL.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

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
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
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

	public ENAverageCountPersonal getObject(int uid) throws PersistenceException {
		ENAverageCountPersonal result = new ENAverageCountPersonal();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENAverageCountPersonal anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENAVERAGECOUNTPERSONAL.CODE, ENAVERAGECOUNTPERSONAL.CODEPODR, ENAVERAGECOUNTPERSONAL.NAMEPODR, ENAVERAGECOUNTPERSONAL.CODECEH, ENAVERAGECOUNTPERSONAL.NAMECEH, ENAVERAGECOUNTPERSONAL.CALCULATEDATE, ENAVERAGECOUNTPERSONAL.DATEEDIT, ENAVERAGECOUNTPERSONAL.COUNTGEN, ENAVERAGECOUNTPERSONAL.PERSONALVIDID, ENAVERAGECOUNTPERSONAL.PERSONALVIDNAME, ENAVERAGECOUNTPERSONAL.USERGEN, ENAVERAGECOUNTPERSONAL.MODIFY_TIME "
			+" FROM ENAVERAGECOUNTPERSONAL WHERE ENAVERAGECOUNTPERSONAL.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.codePodr = set.getString(2);
			anObject.namePodr = set.getString(3);
			anObject.codeCeh = set.getString(4);
			anObject.nameCeh = set.getString(5);
			anObject.calculateDate = set.getDate(6);
			anObject.dateEdit = set.getDate(7);
			anObject.countGen = set.getBigDecimal(8);
			if(anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			anObject.personalVidId = set.getString(9);
			anObject.personalVidName = set.getString(10);
			anObject.userGen = set.getString(11);
			anObject.modify_time = set.getLong(12);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENAverageCountPersonalRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAverageCountPersonalRef ref = new com.ksoe.energynet.valueobject.references.ENAverageCountPersonalRef();
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

		selectStr = "DELETE FROM  ENAVERAGECOUNTPERSONAL WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAverageCountPersonal object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAverageCountPersonal.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAverageCountPersonal.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAverageCountPersonal.remove%} access denied");
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
	
	public long count(ENAverageCountPersonalFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAverageCountPersonalFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAverageCountPersonalFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENAVERAGECOUNTPERSONAL", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAverageCountPersonalFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENAVERAGECOUNTPERSONAL");
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
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAverageCountPersonal.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAverageCountPersonal.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENAVERAGECOUNTPERSONAL.CODE FROM  ENAVERAGECOUNTPERSONAL WHERE  ENAVERAGECOUNTPERSONAL.CODE = ?";
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
		_checkConditionToken(condition,"code","ENAVERAGECOUNTPERSONAL.CODE");
		_checkConditionToken(condition,"codepodr","ENAVERAGECOUNTPERSONAL.CODEPODR");
		_checkConditionToken(condition,"namepodr","ENAVERAGECOUNTPERSONAL.NAMEPODR");
		_checkConditionToken(condition,"codeceh","ENAVERAGECOUNTPERSONAL.CODECEH");
		_checkConditionToken(condition,"nameceh","ENAVERAGECOUNTPERSONAL.NAMECEH");
		_checkConditionToken(condition,"calculatedate","ENAVERAGECOUNTPERSONAL.CALCULATEDATE");
		_checkConditionToken(condition,"dateedit","ENAVERAGECOUNTPERSONAL.DATEEDIT");
		_checkConditionToken(condition,"countgen","ENAVERAGECOUNTPERSONAL.COUNTGEN");
		_checkConditionToken(condition,"personalvidid","ENAVERAGECOUNTPERSONAL.PERSONALVIDID");
		_checkConditionToken(condition,"personalvidname","ENAVERAGECOUNTPERSONAL.PERSONALVIDNAME");
		_checkConditionToken(condition,"usergen","ENAVERAGECOUNTPERSONAL.USERGEN");
		_checkConditionToken(condition,"modify_time","ENAVERAGECOUNTPERSONAL.MODIFY_TIME");
		// relationship conditions
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
	
	private void _collectAutoIncrementFields(ENAverageCountPersonal anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENAVERAGECOUNTPERSONAL", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENAVERAGECOUNTPERSONAL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENAVERAGECOUNTPERSONAL", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENAVERAGECOUNTPERSONAL");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAverageCountPersonalDAO
