
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
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
import com.ksoe.energynet.valueobject.ENTransportRealRepair;
import com.ksoe.energynet.valueobject.filter.ENTransportRealRepairFilter;
import com.ksoe.energynet.valueobject.brief.ENTransportRealRepairShort;
import com.ksoe.energynet.valueobject.lists.ENTransportRealRepairShortList;


/**
 * DAO Object for ENTransportRealRepair;
 *
 */

public class ENTransportRealRepairDAOGen extends GenericDataMiner {

	public ENTransportRealRepairDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENTransportRealRepairDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENTransportRealRepair inObject) throws PersistenceException {
		ENTransportRealRepair obj = new ENTransportRealRepair();
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

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}
		if (inObject.realTransport.code != obj.realTransport.code){
			return false;
		}
		return true;
	}

	public int add(ENTransportRealRepair anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENTransportRealRepair anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENTRANSPORTREALREPAIR (CODE,DATESTART,DATEFINAL,USERGEN,DATEEDIT,COMMENTGEN,REALTRANSPORTCODE) VALUES (?,?,?,?,?,?,?)";

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
			statement.setString(4, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(5, null);
			} else {
				statement.setTimestamp(5, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			statement.setString(6, anObject.commentGen);
			if (anObject.realTransport.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).exists(anObject.realTransport.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENTransportRealRepair.realTransport.code%} = {%"+anObject.realTransport.code+"%}");
				}
				statement.setInt(7,anObject.realTransport.code);
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
			throw new PersistenceException("Error in method {%ENTransportRealRepairDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENTransportRealRepair anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENTransportRealRepair anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REALTRANSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENTRANSPORTREALREPAIR SET  DATESTART = ? , DATEFINAL = ? , USERGEN = ? , DATEEDIT = ? , COMMENTGEN = ? , REALTRANSPORTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENTRANSPORTREALREPAIR SET ";
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
					statement.setString(3, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(4, null);
					} else {
						statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					statement.setString(5, anObject.commentGen);
					if (anObject.realTransport.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.realTransport.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
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
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
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

	} // end of save(ENTransportRealRepair anObject,String[] anAttributes)


	public ENTransportRealRepairShort getShortObject(int anObjectCode) throws PersistenceException {
		ENTransportRealRepair filterObject = new ENTransportRealRepair();
		Vector<ENTransportRealRepairShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENTransportRealRepairShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENTransportRealRepair filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.realTransport.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENTransportRealRepairFilter filter) {
		String out = buildCondition((ENTransportRealRepair)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENTransportRealRepair filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENTransportRealRepair.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, ENTransportRealRepair.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, ENTransportRealRepair.dateFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENTransportRealRepair.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENTransportRealRepair.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENTransportRealRepair.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.realTransport.code, ENTransportRealRepair.realTransport_QFielld, out);
		}
		return out;
	}

	public ENTransportRealRepairShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENTransportRealRepairShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENTransportRealRepairShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENTransportRealRepairShortList getFilteredList(ENTransportRealRepair filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENTransportRealRepairShortList getScrollableFilteredList(ENTransportRealRepair aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENTransportRealRepairShortList getScrollableFilteredList(ENTransportRealRepair aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENTransportRealRepairShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENTransportRealRepairShortList getScrollableFilteredList(ENTransportRealRepairFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENTransportRealRepairShortList getScrollableFilteredList(ENTransportRealRepairFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENTransportRealRepairShortList getScrollableFilteredList(ENTransportRealRepair aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENTransportRealRepairShortList result = new ENTransportRealRepairShortList();
		ENTransportRealRepairShort anObject;
		result.list = new Vector<ENTransportRealRepairShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRANSPORTREALREPAIR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENTRANSPORTREALREPAIR.CODE"+
			",ENTRANSPORTREALREPAIR.DATESTART"+
			",ENTRANSPORTREALREPAIR.DATEFINAL"+
			",ENTRANSPORTREALREPAIR.USERGEN"+
			",ENTRANSPORTREALREPAIR.DATEEDIT"+
			",ENTRANSPORTREALREPAIR.COMMENTGEN"+
			", TKTRANSPORTREAL.CODE " +
			", TKTRANSPORTREAL.NAME " +
			", TKTRANSPORTREAL.INVNUMBER " +
			", TKTRANSPORTREAL.GOSNUMBER " +
		" FROM ENTRANSPORTREALREPAIR " +
			" LEFT JOIN TKTRANSPORTREAL on TKTRANSPORTREAL.CODE = ENTRANSPORTREALREPAIR.REALTRANSPORTCODE "+
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
				anObject = new ENTransportRealRepairShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dateStart = set.getDate(2);
				anObject.dateFinal = set.getDate(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.commentGen = set.getString(6);

				anObject.realTransportCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.realTransportCode = Integer.MIN_VALUE;
				}
				anObject.realTransportName = set.getString(8);
				anObject.realTransportInvNumber = set.getString(9);
				anObject.realTransportGosNumber = set.getString(10);

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
	
	public int[] getFilteredCodeArray(ENTransportRealRepairFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENTransportRealRepairFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENTransportRealRepair aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENTRANSPORTREALREPAIR.CODE FROM ENTRANSPORTREALREPAIR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENTRANSPORTREALREPAIR.CODE";
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


	public ENTransportRealRepair getObject(int uid) throws PersistenceException {
		ENTransportRealRepair result = new ENTransportRealRepair();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENTransportRealRepair anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENTRANSPORTREALREPAIR.CODE, ENTRANSPORTREALREPAIR.DATESTART, ENTRANSPORTREALREPAIR.DATEFINAL, ENTRANSPORTREALREPAIR.USERGEN, ENTRANSPORTREALREPAIR.DATEEDIT, ENTRANSPORTREALREPAIR.COMMENTGEN, ENTRANSPORTREALREPAIR.REALTRANSPORTCODE "
			+" FROM ENTRANSPORTREALREPAIR WHERE ENTRANSPORTREALREPAIR.CODE = ?";


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
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.commentGen = set.getString(6);
				anObject.realTransport.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.realTransport.code = Integer.MIN_VALUE;
				}
				if(anObject.realTransport.code != Integer.MIN_VALUE) {
					anObject.setRealTransport(
						new com.ksoe.techcard.dataminer.generated.TKTransportRealDAOGen(connection,getUserProfile()).getObject(anObject.realTransport.code));
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


	public com.ksoe.energynet.valueobject.references.ENTransportRealRepairRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENTransportRealRepairRef ref = new com.ksoe.energynet.valueobject.references.ENTransportRealRepairRef();
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

		selectStr = "DELETE FROM  ENTRANSPORTREALREPAIR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENTransportRealRepair object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENTransportRealRepair.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRealRepair.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENTransportRealRepair.remove%} access denied");
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
	
	public long count(ENTransportRealRepairFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENTransportRealRepairFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENTransportRealRepairFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENTRANSPORTREALREPAIR", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENTRANSPORTREALREPAIR WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENTransportRealRepairFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENTRANSPORTREALREPAIR");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENTransportRealRepair.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENTransportRealRepair.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENTRANSPORTREALREPAIR.CODE FROM  ENTRANSPORTREALREPAIR WHERE  ENTRANSPORTREALREPAIR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENTRANSPORTREALREPAIR.CODE");
		_checkConditionToken(condition,"datestart","ENTRANSPORTREALREPAIR.DATESTART");
		_checkConditionToken(condition,"datefinal","ENTRANSPORTREALREPAIR.DATEFINAL");
		_checkConditionToken(condition,"usergen","ENTRANSPORTREALREPAIR.USERGEN");
		_checkConditionToken(condition,"dateedit","ENTRANSPORTREALREPAIR.DATEEDIT");
		_checkConditionToken(condition,"commentgen","ENTRANSPORTREALREPAIR.COMMENTGEN");
		// relationship conditions
		_checkConditionToken(condition,"realtransport","REALTRANSPORTCODE");
		_checkConditionToken(condition,"realtransport.code","REALTRANSPORTCODE");
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
	
	private void _collectAutoIncrementFields(ENTransportRealRepair anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENTRANSPORTREALREPAIR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTREALREPAIR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENTRANSPORTREALREPAIR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENTRANSPORTREALREPAIR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENTransportRealRepairDAO
