
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.energynet.valueobject.ENGPSTrackerHistory;
import com.ksoe.energynet.valueobject.filter.ENGPSTrackerHistoryFilter;
import com.ksoe.energynet.valueobject.brief.ENGPSTrackerHistoryShort;
import com.ksoe.energynet.valueobject.lists.ENGPSTrackerHistoryShortList;


/**
 * DAO Object for ENGPSTrackerHistory;
 *
 */

public class ENGPSTrackerHistoryDAOGen extends GenericDataMiner {

	public ENGPSTrackerHistoryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENGPSTrackerHistoryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENGPSTrackerHistory inObject) throws PersistenceException {
		ENGPSTrackerHistory obj = new ENGPSTrackerHistory();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.dateStart == null && obj.dateStart == null){} else 
			if(inObject.dateStart == null || obj.dateStart == null) return false;
			else
				if (inObject.dateStart.compareTo(obj.dateStart) != 0){
					return false;
				}

		if(inObject.dateFinal == null && obj.dateFinal == null){} else 
			if(inObject.dateFinal == null || obj.dateFinal == null) return false;
			else
				if (inObject.dateFinal.compareTo(obj.dateFinal) != 0){
					return false;
				}

		if(inObject.reg_id == null && obj.reg_id == null){}
		else
			if(inObject.reg_id == null || obj.reg_id == null) return false;
			else
				if ( ! inObject.reg_id.equals(obj.reg_id)){
					return false;
				}

		if(inObject.phoneNumber == null && obj.phoneNumber == null){}
		else
			if(inObject.phoneNumber == null || obj.phoneNumber == null) return false;
			else
				if ( ! inObject.phoneNumber.equals(obj.phoneNumber)){
					return false;
				}

		if(inObject.cardNumber == null && obj.cardNumber == null){}
		else
			if(inObject.cardNumber == null || obj.cardNumber == null) return false;
			else
				if ( ! inObject.cardNumber.equals(obj.cardNumber)){
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
		if (inObject.realTransport.code != obj.realTransport.code){
			return false;
		}
		if (inObject.gpsTracker.code != obj.gpsTracker.code){
			return false;
		}
		return true;
	}

	public int add(ENGPSTrackerHistory anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENGPSTrackerHistory anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENGPSTRACKERHISTORY (CODE,DATESTART,DATEFINAL,REG_ID,PHONENUMBER,CARDNUMBER,USERGEN,DATEEDIT,REALTRANSPORTCODE,GPSTRACKERCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dateStart == null) {
				statement.setDate(2, null);
			} else {
				statement.setDate(2, new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinal == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateFinal.getTime()));
			}
			statement.setString(4, anObject.reg_id);
			statement.setString(5, anObject.phoneNumber);
			statement.setString(6, anObject.cardNumber);
			statement.setString(7, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(8, null);
			} else {
				statement.setTimestamp(8, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.realTransport.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.realTransport.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.gpsTracker.code != Integer.MIN_VALUE){
				statement.setInt(10,anObject.gpsTracker.code);
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
			throw new PersistenceException("Error in method {%ENGPSTrackerHistoryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENGPSTrackerHistory anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENGPSTrackerHistory anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REG_ID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHONENUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CARDNUMBER") == 0) {
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
					if(fieldNameStr.compareTo("REALTRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GPSTRACKER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENGPSTRACKERHISTORY SET  DATESTART = ? , DATEFINAL = ? , REG_ID = ? , PHONENUMBER = ? , CARDNUMBER = ? , USERGEN = ? , DATEEDIT = ? , REALTRANSPORTCODE = ? , GPSTRACKERCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENGPSTRACKERHISTORY SET ";
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
					if (anObject.dateStart == null) {
						statement.setDate(1, null);
					} else {
						statement.setDate(1, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateFinal.getTime()));
					}
					statement.setString(3, anObject.reg_id);
					statement.setString(4, anObject.phoneNumber);
					statement.setString(5, anObject.cardNumber);
					statement.setString(6, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(7, null);
					} else {
						statement.setTimestamp(7, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.realTransport.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.realTransport.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.gpsTracker.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.gpsTracker.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateStart.getTime()));
							}
							continue;
						}
						if("DATEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinal == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFinal.getTime()));
							}
							continue;
						}
						if("REG_ID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.reg_id);
							continue;
						}
						if("PHONENUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.phoneNumber);
							continue;
						}
						if("CARDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.cardNumber);
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
						if("REALTRANSPORT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.realTransport.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.realTransport.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GPSTRACKER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.gpsTracker.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.gpsTracker.code);
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

	} // end of save(ENGPSTrackerHistory anObject,String[] anAttributes)


	public ENGPSTrackerHistoryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENGPSTrackerHistory filterObject = new ENGPSTrackerHistory();
		Vector<ENGPSTrackerHistoryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENGPSTrackerHistoryShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENGPSTrackerHistory filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.reg_id, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.phoneNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.cardNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.realTransport.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.gpsTracker.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENGPSTrackerHistoryFilter filter) {
		String out = buildCondition((ENGPSTrackerHistory)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENGPSTrackerHistory filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENGPSTrackerHistory.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, ENGPSTrackerHistory.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, ENGPSTrackerHistory.dateFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.reg_id, ENGPSTrackerHistory.reg_id_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.phoneNumber, ENGPSTrackerHistory.phoneNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.cardNumber, ENGPSTrackerHistory.cardNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENGPSTrackerHistory.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENGPSTrackerHistory.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.realTransport.code, ENGPSTrackerHistory.realTransport_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.gpsTracker.code, ENGPSTrackerHistory.gpsTracker_QFielld, out);
		}
		return out;
	}

	public ENGPSTrackerHistoryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENGPSTrackerHistoryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENGPSTrackerHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENGPSTrackerHistoryShortList getFilteredList(ENGPSTrackerHistory filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENGPSTrackerHistoryShortList getScrollableFilteredList(ENGPSTrackerHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENGPSTrackerHistoryShortList getScrollableFilteredList(ENGPSTrackerHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENGPSTrackerHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENGPSTrackerHistoryShortList getScrollableFilteredList(ENGPSTrackerHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENGPSTrackerHistoryShortList getScrollableFilteredList(ENGPSTrackerHistoryFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENGPSTrackerHistoryShortList getScrollableFilteredList(ENGPSTrackerHistory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENGPSTrackerHistoryShortList result = new ENGPSTrackerHistoryShortList();
		ENGPSTrackerHistoryShort anObject;
		result.list = new Vector<ENGPSTrackerHistoryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGPSTRACKERHISTORY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENGPSTRACKERHISTORY.CODE"+
			",ENGPSTRACKERHISTORY.DATESTART"+
			",ENGPSTRACKERHISTORY.DATEFINAL"+
			",ENGPSTRACKERHISTORY.REG_ID"+
			",ENGPSTRACKERHISTORY.PHONENUMBER"+
			",ENGPSTRACKERHISTORY.CARDNUMBER"+
			",ENGPSTRACKERHISTORY.USERGEN"+
			",ENGPSTRACKERHISTORY.DATEEDIT"+
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
			", ENGPSTRACKER.CODE " +
			", ENGPSTRACKER.REG_ID " +
			", ENGPSTRACKER.PHONENUMBER " +
			", ENGPSTRACKER.CARDNUMBER " +
			", ENGPSTRACKER.USERGEN " +
			", ENGPSTRACKER.DATEEDIT " +
		" FROM ENGPSTRACKERHISTORY " +
			" LEFT JOIN TKTRANSPORTREAL on TKTRANSPORTREAL.CODE = ENGPSTRACKERHISTORY.REALTRANSPORTCODE "+
			" LEFT JOIN ENGPSTRACKER on ENGPSTRACKER.CODE = ENGPSTRACKERHISTORY.GPSTRACKERCODE "+
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
				anObject = new ENGPSTrackerHistoryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateStart = set.getDate(2);
				anObject.dateFinal = set.getDate(3);
				anObject.reg_id = set.getString(4);
				anObject.phoneNumber = set.getString(5);
				anObject.cardNumber = set.getString(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);

				anObject.realTransportCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.realTransportCode = Integer.MIN_VALUE;
				}
				anObject.realTransportName = set.getString(10);
				anObject.realTransportInvNumber = set.getString(11);
				anObject.realTransportGosNumber = set.getString(12);
				anObject.gpsTrackerCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.gpsTrackerCode = Integer.MIN_VALUE;
				}
				anObject.gpsTrackerReg_id = set.getString(14);
				anObject.gpsTrackerPhoneNumber = set.getString(15);
				anObject.gpsTrackerCardNumber = set.getString(16);
				anObject.gpsTrackerUserGen = set.getString(17);
				anObject.gpsTrackerDateEdit = set.getTimestamp(18);

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
	
	public int[] getFilteredCodeArray(ENGPSTrackerHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENGPSTrackerHistoryFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENGPSTrackerHistory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENGPSTRACKERHISTORY.CODE FROM ENGPSTRACKERHISTORY";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGPSTRACKERHISTORY.CODE";
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


	public ENGPSTrackerHistory getObject(int uid) throws PersistenceException {
		ENGPSTrackerHistory result = new ENGPSTrackerHistory();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENGPSTrackerHistory anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENGPSTRACKERHISTORY.CODE, ENGPSTRACKERHISTORY.DATESTART, ENGPSTRACKERHISTORY.DATEFINAL, ENGPSTRACKERHISTORY.REG_ID, ENGPSTRACKERHISTORY.PHONENUMBER, ENGPSTRACKERHISTORY.CARDNUMBER, ENGPSTRACKERHISTORY.USERGEN, ENGPSTRACKERHISTORY.DATEEDIT, ENGPSTRACKERHISTORY.REALTRANSPORTCODE, ENGPSTRACKERHISTORY.GPSTRACKERCODE "
			+" FROM ENGPSTRACKERHISTORY WHERE ENGPSTRACKERHISTORY.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dateStart = set.getDate(2);
				anObject.dateFinal = set.getDate(3);
				anObject.reg_id = set.getString(4);
				anObject.phoneNumber = set.getString(5);
				anObject.cardNumber = set.getString(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);
				anObject.realTransport.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.realTransport.code = Integer.MIN_VALUE;
				}
				anObject.gpsTracker.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.gpsTracker.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENGPSTrackerHistoryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENGPSTrackerHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENGPSTrackerHistoryRef();
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

		selectStr = "DELETE FROM  ENGPSTRACKERHISTORY WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENGPSTrackerHistory object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENGPSTrackerHistory.getObject%} access denied");
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
	
	public long count(ENGPSTrackerHistoryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENGPSTrackerHistoryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENGPSTrackerHistoryFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENGPSTRACKERHISTORY", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENGPSTRACKERHISTORY WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGPSTrackerHistoryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGPSTrackerHistoryFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENGPSTRACKERHISTORY");
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
			"SELECT  ENGPSTRACKERHISTORY.CODE FROM  ENGPSTRACKERHISTORY WHERE  ENGPSTRACKERHISTORY.CODE = ?";
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
		_checkConditionToken(condition,"code","ENGPSTRACKERHISTORY.CODE");
		_checkConditionToken(condition,"datestart","ENGPSTRACKERHISTORY.DATESTART");
		_checkConditionToken(condition,"datefinal","ENGPSTRACKERHISTORY.DATEFINAL");
		_checkConditionToken(condition,"reg_id","ENGPSTRACKERHISTORY.REG_ID");
		_checkConditionToken(condition,"phonenumber","ENGPSTRACKERHISTORY.PHONENUMBER");
		_checkConditionToken(condition,"cardnumber","ENGPSTRACKERHISTORY.CARDNUMBER");
		_checkConditionToken(condition,"usergen","ENGPSTRACKERHISTORY.USERGEN");
		_checkConditionToken(condition,"dateedit","ENGPSTRACKERHISTORY.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
		_checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
		_checkConditionToken(condition,"gpstracker","GPSTRACKERCODE");
		_checkConditionToken(condition,"gpstracker.code","GPSTRACKERCODE");
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
	
	private void _collectAutoIncrementFields(ENGPSTrackerHistory anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENGPSTRACKERHISTORY", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENGPSTRACKERHISTORY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENGPSTRACKERHISTORY", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENGPSTRACKERHISTORY");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENGPSTrackerHistoryDAO
