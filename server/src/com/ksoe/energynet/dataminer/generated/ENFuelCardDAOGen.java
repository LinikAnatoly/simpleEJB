
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
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
import com.ksoe.energynet.valueobject.ENFuelCard;
import com.ksoe.energynet.valueobject.filter.ENFuelCardFilter;
import com.ksoe.energynet.valueobject.brief.ENFuelCardShort;
import com.ksoe.energynet.valueobject.lists.ENFuelCardShortList;


/**
 * DAO Object for ENFuelCard;
 *
 */

public class ENFuelCardDAOGen extends GenericDataMiner {

	public ENFuelCardDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENFuelCardDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENFuelCard inObject) throws PersistenceException {
		ENFuelCard obj = new ENFuelCard();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.reg_id == null && obj.reg_id == null){}
		else
			if(inObject.reg_id == null || obj.reg_id == null) return false;
			else
				if ( ! inObject.reg_id.equals(obj.reg_id)){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if(inObject.dateApply == null && obj.dateApply == null){} else 
			if(inObject.dateApply == null || obj.dateApply == null) return false;
			else
				if (inObject.dateApply.compareTo(obj.dateApply) != 0){
					return false;
				}
		if (inObject.fuelType.code != obj.fuelType.code){
			return false;
		}
		if (inObject.finWorker.code != obj.finWorker.code){
			return false;
		}
		return true;
	}

	public int add(ENFuelCard anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENFuelCard anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENFUELCARD (CODE,REG_ID,USERGEN,DATEEDIT,DATEAPPLY,FUELTYPECODE,FINWORKERCODE) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.reg_id);
			statement.setString(3, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.dateApply == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.dateApply.getTime()));
			}
			if (anObject.fuelType.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.fuelType.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.finWorker.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.finWorker.code);
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
			throw new PersistenceException("Error in method {%ENFuelCardDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENFuelCard anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENFuelCard anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("REG_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEAPPLY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUELTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINWORKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENFUELCARD SET  REG_ID = ? , USERGEN = ? , DATEEDIT = ? , DATEAPPLY = ? , FUELTYPECODE = ? , FINWORKERCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENFUELCARD SET ";
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
					statement.setString(1, anObject.reg_id);
					statement.setString(2, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.dateApply == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateApply.getTime()));
					}
					if (anObject.fuelType.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.fuelType.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.finWorker.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.finWorker.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("REG_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reg_id);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("DATEAPPLY".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateApply == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateApply.getTime()));
							}
							continue;
						}
						if("FUELTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fuelType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.fuelType.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FINWORKER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finWorker.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.finWorker.code);
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

	} // end of save(ENFuelCard anObject,String[] anAttributes)


	public ENFuelCardShort getShortObject(int anObjectCode) throws PersistenceException {
		ENFuelCard filterObject = new ENFuelCard();
		Vector<ENFuelCardShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENFuelCardShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENFuelCard filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reg_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateApply, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fuelType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finWorker.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENFuelCardFilter filter) {
		String out = buildCondition((ENFuelCard)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENFuelCard filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENFuelCard.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reg_id, ENFuelCard.reg_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENFuelCard.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENFuelCard.dateEdit_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateApply, ENFuelCard.dateApply_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fuelType.code, ENFuelCard.fuelType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finWorker.code, ENFuelCard.finWorker_QFielld, out);
		}
		return out;
	}

	public ENFuelCardShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENFuelCardShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENFuelCardShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENFuelCardShortList getFilteredList(ENFuelCard filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENFuelCardShortList getScrollableFilteredList(ENFuelCard aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENFuelCardShortList getScrollableFilteredList(ENFuelCard aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENFuelCardShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENFuelCardShortList getScrollableFilteredList(ENFuelCardFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENFuelCardShortList getScrollableFilteredList(ENFuelCardFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENFuelCardShortList getScrollableFilteredList(ENFuelCard aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENFuelCardShortList result = new ENFuelCardShortList();
		ENFuelCardShort anObject;
		result.list = new Vector<ENFuelCardShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELCARD.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENFUELCARD.CODE"+
			",ENFUELCARD.REG_ID"+
			",ENFUELCARD.USERGEN"+
			",ENFUELCARD.DATEEDIT"+
			",ENFUELCARD.DATEAPPLY"+
			", TKFUELTYPE.CODE " +
			", TKFUELTYPE.NAME " +
			", FINWORKER.CODE " +
			", FINWORKER.NAME " +
			", FINWORKER.TABNUMBER " +
			", FINWORKER.POSITIONNAME " +
			", FINWORKER.POSITIONCODE " +
			", FINWORKER.DEPARTMENTNAME " +
			", FINWORKER.DEPARTMENTCODE " +
			", FINWORKER.PRICEGEN " +
			", FINWORKER.CATEGOR " +
			", FINWORKER.FINCODE " +
			", FINWORKER.ISSENTASSIGNMENT " +
			", FINWORKER.CHARGEPERCENT " +
			", FINWORKER.CATEGORID " +
			", FINWORKER.CATEGORNAME " +
			", FINWORKER.WORKTIMEID " +
			", FINWORKER.POSITIONID " +
		" FROM ENFUELCARD " +
			" LEFT JOIN TKFUELTYPE on TKFUELTYPE.CODE = ENFUELCARD.FUELTYPECODE "+
			" LEFT JOIN FINWORKER on FINWORKER.CODE = ENFUELCARD.FINWORKERCODE "+
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
				anObject = new ENFuelCardShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.reg_id = set.getString(2);
				anObject.userGen = set.getString(3);
				anObject.dateEdit = set.getTimestamp(4);
				anObject.dateApply = set.getDate(5);

				anObject.fuelTypeCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.fuelTypeCode = Integer.MIN_VALUE;
				}
				anObject.fuelTypeName = set.getString(7);
				anObject.finWorkerCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.finWorkerCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerName = set.getString(9);
				anObject.finWorkerTabNumber = set.getString(10);
				anObject.finWorkerPositionName = set.getString(11);
				anObject.finWorkerPositionCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.finWorkerPositionCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerDepartmentName = set.getString(13);
				anObject.finWorkerDepartmentCode = set.getString(14);
				anObject.finWorkerPriceGen = set.getBigDecimal(15);
				if(anObject.finWorkerPriceGen != null) {
					anObject.finWorkerPriceGen = anObject.finWorkerPriceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategor = set.getInt(16);
				if(set.wasNull()) {
					anObject.finWorkerCategor = Integer.MIN_VALUE;
				}
				anObject.finWorkerFinCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.finWorkerFinCode = Integer.MIN_VALUE;
				}
				anObject.finWorkerIsSentAssignment = set.getInt(18);
				if(set.wasNull()) {
					anObject.finWorkerIsSentAssignment = Integer.MIN_VALUE;
				}
				anObject.finWorkerChargePercent = set.getBigDecimal(19);
				if(anObject.finWorkerChargePercent != null) {
					anObject.finWorkerChargePercent = anObject.finWorkerChargePercent.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.finWorkerCategorId = set.getInt(20);
				if(set.wasNull()) {
					anObject.finWorkerCategorId = Integer.MIN_VALUE;
				}
				anObject.finWorkerCategorName = set.getString(21);
				anObject.finWorkerWorkTimeId = set.getString(22);
				anObject.finWorkerPositionId = set.getString(23);

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
	
	public int[] getFilteredCodeArray(ENFuelCardFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENFuelCardFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENFuelCard aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENFUELCARD.CODE FROM ENFUELCARD";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENFUELCARD.CODE";
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


	public ENFuelCard getObject(int uid) throws PersistenceException {
		ENFuelCard result = new ENFuelCard();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENFuelCard anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENFUELCARD.CODE, ENFUELCARD.REG_ID, ENFUELCARD.USERGEN, ENFUELCARD.DATEEDIT, ENFUELCARD.DATEAPPLY, ENFUELCARD.FUELTYPECODE, ENFUELCARD.FINWORKERCODE "
			+" FROM ENFUELCARD WHERE ENFUELCARD.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.reg_id = set.getString(2);
				anObject.userGen = set.getString(3);
				anObject.dateEdit = set.getTimestamp(4);
				anObject.dateApply = set.getDate(5);
				anObject.fuelType.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.fuelType.code = Integer.MIN_VALUE;
				}
				anObject.finWorker.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.finWorker.code = Integer.MIN_VALUE;
				}
				if(anObject.finWorker.code != Integer.MIN_VALUE) {
					anObject.setFinWorker(
						new com.ksoe.energynet.dataminer.generated.FINWorkerDAOGen(connection,getUserProfile()).getObject(anObject.finWorker.code));
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


	public com.ksoe.energynet.valueobject.references.ENFuelCardRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENFuelCardRef ref = new com.ksoe.energynet.valueobject.references.ENFuelCardRef();
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

		selectStr = "DELETE FROM  ENFUELCARD WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENFuelCard object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENFuelCard.getObject%} access denied");
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
	
	public long count(ENFuelCardFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENFuelCardFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENFuelCardFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENFUELCARD", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENFUELCARD WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelCardFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENFuelCardFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENFUELCARD");
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
			"SELECT  ENFUELCARD.CODE FROM  ENFUELCARD WHERE  ENFUELCARD.CODE = ?";
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
		_checkConditionToken(condition,"code","ENFUELCARD.CODE");
		_checkConditionToken(condition,"reg_id","ENFUELCARD.REG_ID");
		_checkConditionToken(condition,"usergen","ENFUELCARD.USERGEN");
		_checkConditionToken(condition,"dateedit","ENFUELCARD.DATEEDIT");
		_checkConditionToken(condition,"dateapply","ENFUELCARD.DATEAPPLY");
		// relationship conditions
		_checkConditionToken(condition,"fueltype","FUELTYPECODE");
		_checkConditionToken(condition,"fueltype.code","FUELTYPECODE");
		_checkConditionToken(condition,"finworker","FINWORKERCODE");
		_checkConditionToken(condition,"finworker.code","FINWORKERCODE");
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
	
	private void _collectAutoIncrementFields(ENFuelCard anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENFUELCARD", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENFUELCARD", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENFUELCARD", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENFUELCARD");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENFuelCardDAO
