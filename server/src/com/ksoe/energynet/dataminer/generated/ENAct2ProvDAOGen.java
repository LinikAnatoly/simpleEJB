
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
import com.ksoe.energynet.valueobject.ENAct2Prov;
import com.ksoe.energynet.valueobject.filter.ENAct2ProvFilter;
import com.ksoe.energynet.valueobject.brief.ENAct2ProvShort;
import com.ksoe.energynet.valueobject.lists.ENAct2ProvShortList;


/**
 * DAO Object for ENAct2Prov;
 *
 */

public class ENAct2ProvDAOGen extends GenericDataMiner {

	public ENAct2ProvDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAct2ProvDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct2Prov inObject) throws PersistenceException {
		ENAct2Prov obj = new ENAct2Prov();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.partId != obj.partId){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.datePosting == null && obj.datePosting == null){} else 
			if(inObject.datePosting == null || obj.datePosting == null) return false;
			else
				if (inObject.datePosting.compareTo(obj.datePosting) != 0){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.voucher == null && obj.voucher == null){}
		else
			if(inObject.voucher == null || obj.voucher == null) return false;
			else
				if ( ! inObject.voucher.equals(obj.voucher)){
					return false;
				}

		if (inObject.isIncomeAct != obj.isIncomeAct){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.actPostingKindRef.code != obj.actPostingKindRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct2Prov anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct2Prov anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACT2PROV (CODE,PARTID,USERGEN,DATEPOSTING,DATEEDIT,MODIFY_TIME,VOUCHER,ISINCOMEACT,ACTREFCODE,ACTPOSTINGKINDREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

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
			statement.setString(3,anObject.userGen);
			if (anObject.datePosting == null) {
				statement.setDate(4,null);
			} else {
				statement.setDate(4,new java.sql.Date(anObject.datePosting.getTime()));
			}
			if (anObject.dateEdit == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(6,null);
			} else {
				statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(7,anObject.voucher);
			if (anObject.isIncomeAct != Integer.MIN_VALUE ) {
				statement.setInt(8,anObject.isIncomeAct);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Prov.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(9,anObject.actRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.actPostingKindRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActPostingKindDAOGen(connection,getUserProfile()).exists(anObject.actPostingKindRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2Prov.actPostingKindRef.code%} = {%"+anObject.actPostingKindRef.code+"%}");
				}
				statement.setInt(10,anObject.actPostingKindRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAct2ProvDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct2Prov anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct2Prov anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAct2Prov oldObject = new ENAct2Prov();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAct2Prov.modify_time_Field+" FROM  ENACT2PROV WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("PARTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPOSTING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOUCHER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISINCOMEACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTPOSTINGKINDREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACT2PROV SET  PARTID = ? , USERGEN = ? , DATEPOSTING = ? , DATEEDIT = ? , MODIFY_TIME = ? , VOUCHER = ? , ISINCOMEACT = ? , ACTREFCODE = ? , ACTPOSTINGKINDREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT2PROV SET ";
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
					statement.setString(2,anObject.userGen);
					if (anObject.datePosting == null) {
						statement.setDate(3,null);
					} else {
						statement.setDate(3,new java.sql.Date(anObject.datePosting.getTime()));
					}
					if (anObject.dateEdit == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(5,null);
					} else {
						statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(6,anObject.voucher);
					if (anObject.isIncomeAct != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.isIncomeAct);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.actRef.code);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					if (anObject.actPostingKindRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.actPostingKindRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					statement.setInt(10,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("PARTID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.partId);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
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
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
							}
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
						if("VOUCHER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.voucher);
							continue;
						}
						if("ISINCOMEACT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isIncomeAct);
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
						if("ACTPOSTINGKINDREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actPostingKindRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actPostingKindRef.code);
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

	} // end of save(ENAct2Prov anObject,String[] anAttributes)


	public ENAct2ProvShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct2Prov filterObject = new ENAct2Prov();
		Vector<ENAct2ProvShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAct2ProvShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct2Prov filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePosting, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.voucher, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isIncomeAct, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actPostingKindRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAct2ProvFilter filter) {
		String out = buildCondition((ENAct2Prov)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct2Prov filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct2Prov.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partId, ENAct2Prov.partId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENAct2Prov.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePosting, ENAct2Prov.datePosting_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENAct2Prov.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAct2Prov.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.voucher, ENAct2Prov.voucher_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isIncomeAct, ENAct2Prov.isIncomeAct_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENAct2Prov.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actPostingKindRef.code, ENAct2Prov.actPostingKindRef_QFielld, out);
		}
		return out;
	}

	public ENAct2ProvShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAct2ProvShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAct2ProvShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAct2ProvShortList getFilteredList(ENAct2Prov filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAct2ProvShortList getScrollableFilteredList(ENAct2Prov aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAct2ProvShortList getScrollableFilteredList(ENAct2Prov aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAct2ProvShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAct2ProvShortList getScrollableFilteredList(ENAct2ProvFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAct2ProvShortList getScrollableFilteredList(ENAct2ProvFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAct2ProvShortList getScrollableFilteredList(ENAct2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAct2ProvShortList result = new ENAct2ProvShortList();
		ENAct2ProvShort anObject;
		result.list = new Vector<ENAct2ProvShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2PROV.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2PROV.CODE"+
			",ENACT2PROV.PARTID"+
			",ENACT2PROV.USERGEN"+
			",ENACT2PROV.DATEPOSTING"+
			",ENACT2PROV.DATEEDIT"+
			",ENACT2PROV.VOUCHER"+
			",ENACT2PROV.ISINCOMEACT"+
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
			", ENACTPOSTINGKIND.CODE " +
			", ENACTPOSTINGKIND.NAME " +
		" FROM ENACT2PROV " +
			", ENACT " +
			", ENACTPOSTINGKIND " +
		"";
		whereStr = " ENACT.CODE = ENACT2PROV.ACTREFCODE" ; //+
		whereStr += " AND ENACTPOSTINGKIND.CODE = ENACT2PROV.ACTPOSTINGKINDREFCODE" ; //+

	
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
				anObject = new ENAct2ProvShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.partId = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.partId = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(3);
				anObject.datePosting = set.getDate(4);
				anObject.dateEdit = set.getDate(5);
				anObject.voucher = set.getString(6);
				anObject.isIncomeAct = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.isIncomeAct = Integer.MIN_VALUE;
				}

				anObject.actRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(9);
				anObject.actRefDateGen = set.getDate(10);
				anObject.actRefFinDocCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(13);
				anObject.actRefFinMechanicName = set.getString(14);
				anObject.actRefInvNumber = set.getString(15);
				anObject.actRefUserGen = set.getString(16);
				anObject.actRefDateEdit = set.getDate(17);
				anObject.actRefDateAct = set.getDate(18);
				anObject.actRefMolCodeObject = set.getString(19);
				anObject.actPostingKindRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.actPostingKindRefCode = Integer.MIN_VALUE;
				}
				anObject.actPostingKindRefName = set.getString(21);

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
	
	public int[] getFilteredCodeArray(ENAct2ProvFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAct2ProvFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct2Prov aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT2PROV.CODE FROM ENACT2PROV";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2PROV.CODE";
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

	public ENAct2Prov getObject(int uid) throws PersistenceException {
		ENAct2Prov result = new ENAct2Prov();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENAct2Prov anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENACT2PROV.CODE, ENACT2PROV.PARTID, ENACT2PROV.USERGEN, ENACT2PROV.DATEPOSTING, ENACT2PROV.DATEEDIT, ENACT2PROV.MODIFY_TIME, ENACT2PROV.VOUCHER, ENACT2PROV.ISINCOMEACT, ENACT2PROV.ACTREFCODE, ENACT2PROV.ACTPOSTINGKINDREFCODE "
			+" FROM ENACT2PROV WHERE ENACT2PROV.CODE = ?";

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
				anObject.userGen = set.getString(3);
				anObject.datePosting = set.getDate(4);
				anObject.dateEdit = set.getDate(5);
				anObject.modify_time = set.getLong(6);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.voucher = set.getString(7);
				anObject.isIncomeAct = set.getInt(8);
				if (set.wasNull()) {
					anObject.isIncomeAct = Integer.MIN_VALUE;
				}
				anObject.actRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				anObject.actPostingKindRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.actPostingKindRef.code = Integer.MIN_VALUE;
				}
				if(anObject.actRef.code != Integer.MIN_VALUE) {
					anObject.setActRef(
						new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
				}
				if(anObject.actPostingKindRef.code != Integer.MIN_VALUE) {
					anObject.setActPostingKindRef(
						new com.ksoe.energynet.dataminer.generated.ENActPostingKindDAOGen(connection,getUserProfile()).getRef(anObject.actPostingKindRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENAct2ProvRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAct2ProvRef ref = new com.ksoe.energynet.valueobject.references.ENAct2ProvRef();
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

		selectStr = "DELETE FROM  ENACT2PROV WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct2Prov object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct2Prov.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2Prov.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAct2Prov.remove%} access denied");
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
	
	public long count(ENAct2ProvFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAct2ProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAct2ProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT2PROV", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAct2ProvFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT2PROV");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2Prov.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct2Prov.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACT2PROV.CODE FROM  ENACT2PROV WHERE  ENACT2PROV.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACT2PROV.CODE");
		_checkConditionToken(condition,"partid","ENACT2PROV.PARTID");
		_checkConditionToken(condition,"usergen","ENACT2PROV.USERGEN");
		_checkConditionToken(condition,"dateposting","ENACT2PROV.DATEPOSTING");
		_checkConditionToken(condition,"dateedit","ENACT2PROV.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENACT2PROV.MODIFY_TIME");
		_checkConditionToken(condition,"voucher","ENACT2PROV.VOUCHER");
		_checkConditionToken(condition,"isincomeact","ENACT2PROV.ISINCOMEACT");
		// relationship conditions
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"actpostingkindref","ACTPOSTINGKINDREFCODE");
		_checkConditionToken(condition,"actpostingkindref.code","ACTPOSTINGKINDREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAct2Prov anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT2PROV", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT2PROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT2PROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT2PROV");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAct2ProvDAO
