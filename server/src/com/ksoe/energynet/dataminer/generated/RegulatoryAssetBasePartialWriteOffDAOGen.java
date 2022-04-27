
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBasePartialWriteOffFilter;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBasePartialWriteOffShort;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBasePartialWriteOffShortList;


/**
 * DAO Object for RegulatoryAssetBasePartialWriteOff;
 *
 */

public class RegulatoryAssetBasePartialWriteOffDAOGen extends GenericDataMiner {

	public RegulatoryAssetBasePartialWriteOffDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public RegulatoryAssetBasePartialWriteOffDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(RegulatoryAssetBasePartialWriteOff inObject) throws PersistenceException {
		RegulatoryAssetBasePartialWriteOff obj = new RegulatoryAssetBasePartialWriteOff();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.writeOffNumber == null && obj.writeOffNumber == null){}
		else
			if(inObject.writeOffNumber == null || obj.writeOffNumber == null) return false;
			else
				if ( ! inObject.writeOffNumber.equals(obj.writeOffNumber)){
					return false;
				}

		if(inObject.writeOffDate == null && obj.writeOffDate == null){} else 
			if(inObject.writeOffDate == null || obj.writeOffDate == null) return false;
			else
				if (inObject.writeOffDate.compareTo(obj.writeOffDate) != 0){
					return false;
				}

		if(inObject.value == null && obj.value == null){}
		else
			if(inObject.value == null || obj.value == null) return false;
			else
				if ( ! inObject.value.equals(obj.value)){
					return false;
				}

		if(inObject.percentage == null && obj.percentage == null){}
		else
			if(inObject.percentage == null || obj.percentage == null) return false;
			else
				if ( ! inObject.percentage.equals(obj.percentage)){
					return false;
				}
		if (inObject.assetRef.code != obj.assetRef.code){
			return false;
		}
		return true;
	}

	public int add(RegulatoryAssetBasePartialWriteOff anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(RegulatoryAssetBasePartialWriteOff anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO REGULATRSSTBSPRTLWRTFF (CODE,WRITEOFFNUMBER,WRITEOFFDATE,VALUE,PERCENTAGE,ASSETREFCODE) VALUES (?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.writeOffNumber);
			if (anObject.writeOffDate == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.writeOffDate.getTime()));
			}
			if (anObject.value != null) {
				anObject.value = anObject.value.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.value);
			if (anObject.percentage != null) {
				anObject.percentage = anObject.percentage.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.percentage);
			if (anObject.assetRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.assetRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%RegulatoryAssetBasePartialWriteOffDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(RegulatoryAssetBasePartialWriteOff anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(RegulatoryAssetBasePartialWriteOff anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("WRITEOFFNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WRITEOFFDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERCENTAGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ASSETREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE REGULATRSSTBSPRTLWRTFF SET  WRITEOFFNUMBER = ? , WRITEOFFDATE = ? , VALUE = ? , PERCENTAGE = ? , ASSETREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE REGULATORYASSETBASEPARTIALWRITEOFF SET ";
				for(int fldIndex = 0;fldIndex < fields.size();fldIndex++) {
					if(fldIndex > 0) {
						selectStr+=", ";
					}
					selectStr+=(String)fields.get(fldIndex);
					selectStr+=" = ?";
				}
				selectStr += " WHERE CODE = ?";
			}

			statement = null;
			try {
				statement = connection.prepareStatement(selectStr);
				if(fields == null) {
					statement.setString(1, anObject.writeOffNumber);
					if (anObject.writeOffDate == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.writeOffDate.getTime()));
					}
					if (anObject.value != null) {
						anObject.value = anObject.value.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.value);
					if (anObject.percentage != null) {
						anObject.percentage = anObject.percentage.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.percentage);
					if (anObject.assetRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.assetRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					statement.setInt(6, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("WRITEOFFNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.writeOffNumber);
							continue;
						}
						if("WRITEOFFDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.writeOffDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.writeOffDate.getTime()));
							}
							continue;
						}
						if("VALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.value != null) {
								anObject.value = anObject.value.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.value);
							continue;
						}
						if("PERCENTAGE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.percentage != null) {
								anObject.percentage = anObject.percentage.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.percentage);
							continue;
						}
						if("ASSETREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.assetRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.assetRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size()+1, anObject.code);
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

	} // end of save(RegulatoryAssetBasePartialWriteOff anObject,String[] anAttributes)


	public RegulatoryAssetBasePartialWriteOffShort getShortObject(int anObjectCode) throws PersistenceException {
		RegulatoryAssetBasePartialWriteOff filterObject = new RegulatoryAssetBasePartialWriteOff();
		Vector<RegulatoryAssetBasePartialWriteOffShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (RegulatoryAssetBasePartialWriteOffShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(RegulatoryAssetBasePartialWriteOff filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.writeOffNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.writeOffDate, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.value, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.percentage, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.assetRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(RegulatoryAssetBasePartialWriteOffFilter filter) {
		String out = buildCondition((RegulatoryAssetBasePartialWriteOff)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(RegulatoryAssetBasePartialWriteOff filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, RegulatoryAssetBasePartialWriteOff.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.writeOffNumber, RegulatoryAssetBasePartialWriteOff.writeOffNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.writeOffDate, RegulatoryAssetBasePartialWriteOff.writeOffDate_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.value, RegulatoryAssetBasePartialWriteOff.value_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.percentage, RegulatoryAssetBasePartialWriteOff.percentage_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.assetRef.code, RegulatoryAssetBasePartialWriteOff.assetRef_QFielld, out);
		}
		return out;
	}

	public RegulatoryAssetBasePartialWriteOffShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getFilteredList(RegulatoryAssetBasePartialWriteOff filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(RegulatoryAssetBasePartialWriteOff aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(RegulatoryAssetBasePartialWriteOff aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(RegulatoryAssetBasePartialWriteOffFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(RegulatoryAssetBasePartialWriteOffFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public RegulatoryAssetBasePartialWriteOffShortList getScrollableFilteredList(RegulatoryAssetBasePartialWriteOff aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBasePartialWriteOffShortList result = new RegulatoryAssetBasePartialWriteOffShortList();
		RegulatoryAssetBasePartialWriteOffShort anObject;
		result.list = new Vector<RegulatoryAssetBasePartialWriteOffShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATRSSTBSPRTLWRTFF.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATRSSTBSPRTLWRTFF.CODE"+
			",REGULATRSSTBSPRTLWRTFF.WRITEOFFNUMBER"+
			",REGULATRSSTBSPRTLWRTFF.WRITEOFFDATE"+
			",REGULATRSSTBSPRTLWRTFF.VALUE"+
			",REGULATRSSTBSPRTLWRTFF.PERCENTAGE"+
			", REGULATORYASSETBASE.CODE " +
			", REGULATORYASSETBASE.INVENTORYNUMBER " +
			", REGULATORYASSETBASE.NAME " +
			", REGULATORYASSETBASE.INCOMEDATE " +
			", REGULATORYASSETBASE.ORIGINALVALUE " +
			", REGULATORYASSETBASE.INITIAL " +
			", REGULATORYASSETBASE.WRITEOFFNUMBER " +
			", REGULATORYASSETBASE.WRITEOFFDATE " +
		" FROM REGULATRSSTBSPRTLWRTFF " +
			" LEFT JOIN REGULATORYASSETBASE on REGULATORYASSETBASE.CODE = REGULATRSSTBSPRTLWRTFF.ASSETREFCODE "+
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
				anObject = new RegulatoryAssetBasePartialWriteOffShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.writeOffNumber = set.getString(2);
				anObject.writeOffDate = set.getDate(3);
				anObject.value = set.getBigDecimal(4);
				if(anObject.value != null) {
					anObject.value = anObject.value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentage = set.getBigDecimal(5);
				if(anObject.percentage != null) {
					anObject.percentage = anObject.percentage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.assetRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.assetRefCode = Integer.MIN_VALUE;
				}
				anObject.assetRefInventoryNumber = set.getString(7);
				anObject.assetRefName = set.getString(8);
				anObject.assetRefIncomeDate = set.getDate(9);
				anObject.assetRefOriginalValue = set.getBigDecimal(10);
				if(anObject.assetRefOriginalValue != null) {
					anObject.assetRefOriginalValue = anObject.assetRefOriginalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.assetRefInitial = set.getBoolean(11);
				if(set.wasNull()) {
					anObject.assetRefInitial = null;
				}
				anObject.assetRefWriteOffNumber = set.getString(12);
				anObject.assetRefWriteOffDate = set.getDate(13);

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
	
	public int[] getFilteredCodeArray(RegulatoryAssetBasePartialWriteOffFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(RegulatoryAssetBasePartialWriteOffFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(RegulatoryAssetBasePartialWriteOff aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT REGULATRSSTBSPRTLWRTFF.CODE FROM REGULATRSSTBSPRTLWRTFF";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATRSSTBSPRTLWRTFF.CODE";
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


	public RegulatoryAssetBasePartialWriteOff getObject(int uid) throws PersistenceException {
		RegulatoryAssetBasePartialWriteOff result = new RegulatoryAssetBasePartialWriteOff();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(RegulatoryAssetBasePartialWriteOff anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  REGULATRSSTBSPRTLWRTFF.CODE, REGULATRSSTBSPRTLWRTFF.WRITEOFFNUMBER, REGULATRSSTBSPRTLWRTFF.WRITEOFFDATE, REGULATRSSTBSPRTLWRTFF.VALUE, REGULATRSSTBSPRTLWRTFF.PERCENTAGE, REGULATRSSTBSPRTLWRTFF.ASSETREFCODE "
			+" FROM REGULATRSSTBSPRTLWRTFF WHERE REGULATRSSTBSPRTLWRTFF.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.writeOffNumber = set.getString(2);
				anObject.writeOffDate = set.getDate(3);
				anObject.value = set.getBigDecimal(4);
				if(anObject.value != null) {
					anObject.value = anObject.value.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.percentage = set.getBigDecimal(5);
				if(anObject.percentage != null) {
					anObject.percentage = anObject.percentage.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.assetRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.assetRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.RegulatoryAssetBasePartialWriteOffRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.RegulatoryAssetBasePartialWriteOffRef ref = new com.ksoe.energynet.valueobject.references.RegulatoryAssetBasePartialWriteOffRef();
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

		selectStr = "DELETE FROM  REGULATRSSTBSPRTLWRTFF WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		RegulatoryAssetBasePartialWriteOff object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%RegulatoryAssetBasePartialWriteOff.getObject%} access denied");
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
	
	public long count(RegulatoryAssetBasePartialWriteOffFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(RegulatoryAssetBasePartialWriteOffFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, RegulatoryAssetBasePartialWriteOffFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM REGULATRSSTBSPRTLWRTFF", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM REGULATRSSTBSPRTLWRTFF WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBasePartialWriteOffFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBasePartialWriteOffFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "REGULATRSSTBSPRTLWRTFF");
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
			"SELECT  REGULATRSSTBSPRTLWRTFF.CODE FROM  REGULATRSSTBSPRTLWRTFF WHERE  REGULATRSSTBSPRTLWRTFF.CODE = ?";
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
		_checkConditionToken(condition,"code","REGULATRSSTBSPRTLWRTFF.CODE");
		_checkConditionToken(condition,"writeoffnumber","REGULATRSSTBSPRTLWRTFF.WRITEOFFNUMBER");
		_checkConditionToken(condition,"writeoffdate","REGULATRSSTBSPRTLWRTFF.WRITEOFFDATE");
		_checkConditionToken(condition,"value","REGULATRSSTBSPRTLWRTFF.VALUE");
		_checkConditionToken(condition,"percentage","REGULATRSSTBSPRTLWRTFF.PERCENTAGE");
		// relationship conditions
		_checkConditionToken(condition,"assetref","ASSETREFCODE");
		_checkConditionToken(condition,"assetref.code","ASSETREFCODE");
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
	
	private void _collectAutoIncrementFields(RegulatoryAssetBasePartialWriteOff anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("REGULATRSSTBSPRTLWRTFF", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("REGULATRSSTBSPRTLWRTFF", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("REGULATRSSTBSPRTLWRTFF", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: REGULATRSSTBSPRTLWRTFF");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of RegulatoryAssetBasePartialWriteOffDAO
