
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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
import com.ksoe.energynet.valueobject.ENAct2FinInfoProv;
import com.ksoe.energynet.valueobject.filter.ENAct2FinInfoProvFilter;
import com.ksoe.energynet.valueobject.brief.ENAct2FinInfoProvShort;
import com.ksoe.energynet.valueobject.lists.ENAct2FinInfoProvShortList;


/**
 * DAO Object for ENAct2FinInfoProv;
 *
 */

public class ENAct2FinInfoProvDAOGen extends GenericDataMiner {

	public ENAct2FinInfoProvDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAct2FinInfoProvDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct2FinInfoProv inObject) throws PersistenceException {
		ENAct2FinInfoProv obj = new ENAct2FinInfoProv();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.kau_card_object_id != obj.kau_card_object_id){
					return false;
				}

		if(inObject.kau_card_object_kod == null && obj.kau_card_object_kod == null){}
		else
			if(inObject.kau_card_object_kod == null || obj.kau_card_object_kod == null) return false;
			else
				if ( ! inObject.kau_card_object_kod.equals(obj.kau_card_object_kod)){
					return false;
				}

		if(inObject.kau_card_object_name == null && obj.kau_card_object_name == null){}
		else
			if(inObject.kau_card_object_name == null || obj.kau_card_object_name == null) return false;
			else
				if ( ! inObject.kau_card_object_name.equals(obj.kau_card_object_name)){
					return false;
				}

		if (inObject.kau_element_expenses_id != obj.kau_element_expenses_id){
					return false;
				}

		if(inObject.kau_element_expenses_kod == null && obj.kau_element_expenses_kod == null){}
		else
			if(inObject.kau_element_expenses_kod == null || obj.kau_element_expenses_kod == null) return false;
			else
				if ( ! inObject.kau_element_expenses_kod.equals(obj.kau_element_expenses_kod)){
					return false;
				}

		if(inObject.kau_element_expenses_name == null && obj.kau_element_expenses_name == null){}
		else
			if(inObject.kau_element_expenses_name == null || obj.kau_element_expenses_name == null) return false;
			else
				if ( ! inObject.kau_element_expenses_name.equals(obj.kau_element_expenses_name)){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct2FinInfoProv anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct2FinInfoProv anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACT2FININFOPROV (CODE,KAU_CARD_OBJECT_ID,KAU_CARD_OBJECT_KOD,KAU_CARD_OBJECT_NAME,KAU_ELEMENT_EXPENSES_D,KAU_ELEMENT_EXPENSS_KD,KAU_ELEMENT_EXPENSS_NM,ACTREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.kau_card_object_id != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.kau_card_object_id);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			statement.setString(3, anObject.kau_card_object_kod);
			statement.setString(4, anObject.kau_card_object_name);
			if (anObject.kau_element_expenses_id != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.kau_element_expenses_id);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.kau_element_expenses_kod);
			statement.setString(7, anObject.kau_element_expenses_name);
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct2FinInfoProv.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(8,anObject.actRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAct2FinInfoProvDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct2FinInfoProv anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct2FinInfoProv anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("KAU_CARD_OBJECT_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_CARD_OBJECT_KOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_CARD_OBJECT_NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_ELEMENT_EXPENSES_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_ELEMENT_EXPENSES_KOD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KAU_ELEMENT_EXPENSES_NAME") == 0) {
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
				selectStr = "UPDATE ENACT2FININFOPROV SET  KAU_CARD_OBJECT_ID = ? , KAU_CARD_OBJECT_KOD = ? , KAU_CARD_OBJECT_NAME = ? , KAU_ELEMENT_EXPENSES_D = ? , KAU_ELEMENT_EXPENSS_KD = ? , KAU_ELEMENT_EXPENSS_NM = ? , ACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT2FININFOPROV SET ";
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
					if (anObject.kau_card_object_id != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.kau_card_object_id);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					statement.setString(2, anObject.kau_card_object_kod);
					statement.setString(3, anObject.kau_card_object_name);
					if (anObject.kau_element_expenses_id != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.kau_element_expenses_id);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.kau_element_expenses_kod);
					statement.setString(6, anObject.kau_element_expenses_name);
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.actRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					statement.setInt(8, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("KAU_CARD_OBJECT_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.kau_card_object_id);
							continue;
						}
						if("KAU_CARD_OBJECT_KOD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_card_object_kod);
							continue;
						}
						if("KAU_CARD_OBJECT_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_card_object_name);
							continue;
						}
						if("KAU_ELEMENT_EXPENSES_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.kau_element_expenses_id);
							continue;
						}
						if("KAU_ELEMENT_EXPENSES_KOD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_element_expenses_kod);
							continue;
						}
						if("KAU_ELEMENT_EXPENSES_NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.kau_element_expenses_name);
							continue;
						}
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
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

	} // end of save(ENAct2FinInfoProv anObject,String[] anAttributes)


	public ENAct2FinInfoProvShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct2FinInfoProv filterObject = new ENAct2FinInfoProv();
		Vector<ENAct2FinInfoProvShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAct2FinInfoProvShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct2FinInfoProv filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kau_card_object_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_card_object_kod, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_card_object_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kau_element_expenses_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_element_expenses_kod, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.kau_element_expenses_name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAct2FinInfoProvFilter filter) {
		String out = buildCondition((ENAct2FinInfoProv)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct2FinInfoProv filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct2FinInfoProv.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kau_card_object_id, ENAct2FinInfoProv.kau_card_object_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_card_object_kod, ENAct2FinInfoProv.kau_card_object_kod_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_card_object_name, ENAct2FinInfoProv.kau_card_object_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kau_element_expenses_id, ENAct2FinInfoProv.kau_element_expenses_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_element_expenses_kod, ENAct2FinInfoProv.kau_element_expenses_kod_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.kau_element_expenses_name, ENAct2FinInfoProv.kau_element_expenses_name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENAct2FinInfoProv.actRef_QFielld, out);
		}
		return out;
	}

	public ENAct2FinInfoProvShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAct2FinInfoProvShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAct2FinInfoProvShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAct2FinInfoProvShortList getFilteredList(ENAct2FinInfoProv filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAct2FinInfoProvShortList getScrollableFilteredList(ENAct2FinInfoProv aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAct2FinInfoProvShortList getScrollableFilteredList(ENAct2FinInfoProv aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAct2FinInfoProvShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAct2FinInfoProvShortList getScrollableFilteredList(ENAct2FinInfoProvFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAct2FinInfoProvShortList getScrollableFilteredList(ENAct2FinInfoProvFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAct2FinInfoProvShortList getScrollableFilteredList(ENAct2FinInfoProv aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAct2FinInfoProvShortList result = new ENAct2FinInfoProvShortList();
		ENAct2FinInfoProvShort anObject;
		result.list = new Vector<ENAct2FinInfoProvShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2FININFOPROV.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2FININFOPROV.CODE"+
			",ENACT2FININFOPROV.KAU_CARD_OBJECT_ID"+
			",ENACT2FININFOPROV.KAU_CARD_OBJECT_KOD"+
			",ENACT2FININFOPROV.KAU_CARD_OBJECT_NAME"+
			",ENACT2FININFOPROV.KAU_ELEMENT_EXPENSES_D"+
			",ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_KD"+
			",ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_NM"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINMOLCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", ENACT.CHECKEDBYACCOUNTANT " +
		" FROM ENACT2FININFOPROV " +
			" LEFT JOIN ENACT on ENACT.CODE = ENACT2FININFOPROV.ACTREFCODE "+
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
				anObject = new ENAct2FinInfoProvShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.kau_card_object_id = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.kau_card_object_id = Integer.MIN_VALUE;
				}
				anObject.kau_card_object_kod = set.getString(3);
				anObject.kau_card_object_name = set.getString(4);
				anObject.kau_element_expenses_id = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.kau_element_expenses_id = Integer.MIN_VALUE;
				}
				anObject.kau_element_expenses_kod = set.getString(6);
				anObject.kau_element_expenses_name = set.getString(7);

				anObject.actRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(9);
				anObject.actRefDateGen = set.getDate(10);
				anObject.actRefFinMolCode = set.getString(11);
				anObject.actRefFinMolName = set.getString(12);
				anObject.actRefFinMechanicName = set.getString(13);
				anObject.actRefInvNumber = set.getString(14);
				anObject.actRefUserGen = set.getString(15);
				anObject.actRefDateEdit = set.getDate(16);
				anObject.actRefDateAct = set.getDate(17);
				anObject.actRefMolCodeObject = set.getString(18);
				anObject.actRefCheckedByAccountant = set.getBoolean(19);
				if(set.wasNull()) {
					anObject.actRefCheckedByAccountant = null;
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
	
	public int[] getFilteredCodeArray(ENAct2FinInfoProvFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAct2FinInfoProvFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct2FinInfoProv aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT2FININFOPROV.CODE FROM ENACT2FININFOPROV";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2FININFOPROV.CODE";
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


	public ENAct2FinInfoProv getObject(int uid) throws PersistenceException {
		ENAct2FinInfoProv result = new ENAct2FinInfoProv();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENAct2FinInfoProv anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACT2FININFOPROV.CODE, ENACT2FININFOPROV.KAU_CARD_OBJECT_ID, ENACT2FININFOPROV.KAU_CARD_OBJECT_KOD, ENACT2FININFOPROV.KAU_CARD_OBJECT_NAME, ENACT2FININFOPROV.KAU_ELEMENT_EXPENSES_D, ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_KD, ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_NM, ENACT2FININFOPROV.ACTREFCODE "
			+" FROM ENACT2FININFOPROV WHERE ENACT2FININFOPROV.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.kau_card_object_id = set.getInt(2);
				if (set.wasNull()) {
					anObject.kau_card_object_id = Integer.MIN_VALUE;
				}
				anObject.kau_card_object_kod = set.getString(3);
				anObject.kau_card_object_name = set.getString(4);
				anObject.kau_element_expenses_id = set.getInt(5);
				if (set.wasNull()) {
					anObject.kau_element_expenses_id = Integer.MIN_VALUE;
				}
				anObject.kau_element_expenses_kod = set.getString(6);
				anObject.kau_element_expenses_name = set.getString(7);
				anObject.actRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENAct2FinInfoProvRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAct2FinInfoProvRef ref = new com.ksoe.energynet.valueobject.references.ENAct2FinInfoProvRef();
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

		selectStr = "DELETE FROM  ENACT2FININFOPROV WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct2FinInfoProv object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct2FinInfoProv.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2FinInfoProv.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAct2FinInfoProv.remove%} access denied");
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
	
	public long count(ENAct2FinInfoProvFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAct2FinInfoProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAct2FinInfoProvFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT2FININFOPROV", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACT2FININFOPROV WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAct2FinInfoProvFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT2FININFOPROV");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct2FinInfoProv.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct2FinInfoProv.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACT2FININFOPROV.CODE FROM  ENACT2FININFOPROV WHERE  ENACT2FININFOPROV.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACT2FININFOPROV.CODE");
		_checkConditionToken(condition,"kau_card_object_id","ENACT2FININFOPROV.KAU_CARD_OBJECT_ID");
		_checkConditionToken(condition,"kau_card_object_kod","ENACT2FININFOPROV.KAU_CARD_OBJECT_KOD");
		_checkConditionToken(condition,"kau_card_object_name","ENACT2FININFOPROV.KAU_CARD_OBJECT_NAME");
		_checkConditionToken(condition,"kau_element_expenses_id","ENACT2FININFOPROV.KAU_ELEMENT_EXPENSES_D");
		_checkConditionToken(condition,"kau_element_expenses_kod","ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_KD");
		_checkConditionToken(condition,"kau_element_expenses_name","ENACT2FININFOPROV.KAU_ELEMENT_EXPENSS_NM");
		// relationship conditions
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
	
	private void _collectAutoIncrementFields(ENAct2FinInfoProv anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT2FININFOPROV", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT2FININFOPROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT2FININFOPROV", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT2FININFOPROV");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAct2FinInfoProvDAO
