

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENOperativeObjectHistory;
import com.ksoe.energynet.valueobject.brief.ENOperativeObjectHistoryShort;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectHistoryShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENOperativeObjectHistory;
 *
 */

public class ENOperativeObjectHistoryDAOGen extends GenericDataMiner {

	public ENOperativeObjectHistoryDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENOperativeObjectHistoryDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENOperativeObjectHistory inObject) throws PersistenceException {
		ENOperativeObjectHistory obj = new ENOperativeObjectHistory();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contractNumber == null && obj.contractNumber == null){}
		else
			if(inObject.contractNumber == null || obj.contractNumber == null) return false;
			else
				if ( ! inObject.contractNumber.equals(obj.contractNumber)){
					return false;
				}

		if(inObject.contractDate == null && obj.contractDate == null){} else
			if(inObject.contractDate == null || obj.contractDate == null) return false;
			else
				if (inObject.contractDate.compareTo(obj.contractDate) != 0){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.partnerCode == null && obj.partnerCode == null){}
		else
			if(inObject.partnerCode == null || obj.partnerCode == null) return false;
			else
				if ( ! inObject.partnerCode.equals(obj.partnerCode)){
					return false;
				}

		if(inObject.finDocCode == null && obj.finDocCode == null){}
		else
			if(inObject.finDocCode == null || obj.finDocCode == null) return false;
			else
				if ( ! inObject.finDocCode.equals(obj.finDocCode)){
					return false;
				}

		if (inObject.finDocID != obj.finDocID){
					return false;
				}
		if (inObject.objectRef.code != obj.objectRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENOperativeObjectHistory anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENOperativeObjectHistory anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENOPERATIVEOBJECTHISTR (CODE,CONTRACTNUMBER,CONTRACTDATE,NAME,PARTNERCODE,FINDOCCODE,FINDOCID,MODIFY_TIME,OBJECTREFCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4,anObject.name);
			statement.setString(5,anObject.partnerCode);
			statement.setString(6,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(7,anObject.finDocID);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(8,null);
			} else {
				statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.objectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENOperativeObjectDAOGen(connection,getUserProfile()).exists(anObject.objectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENOperativeObjectHistory.objectRef.code%} = {%"+anObject.objectRef.code+"%}");
				}
				statement.setInt(9,anObject.objectRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENOperativeObjectHistory.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(10,anObject.generalContractRef.code);
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
			throw new PersistenceException("Error in method {%ENOperativeObjectHistoryDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENOperativeObjectHistory anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENOperativeObjectHistory anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENOperativeObjectHistory oldObject = new ENOperativeObjectHistory();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENOperativeObjectHistory.modify_time_Field+" FROM  ENOPERATIVEOBJECTHISTR WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENERALCONTRACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENOPERATIVEOBJECTHISTR SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , NAME = ? , PARTNERCODE = ? , FINDOCCODE = ? , FINDOCID = ? , MODIFY_TIME = ? , OBJECTREFCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENOPERATIVEOBJECTHISTORY SET ";
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
					statement.setString(1,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3,anObject.name);
					statement.setString(4,anObject.partnerCode);
					statement.setString(5,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.finDocID);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(7,null);
					} else {
						statement.setBigDecimal(7,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.objectRef.code != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.objectRef.code);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.generalContractRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					statement.setInt(10,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocID);
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
						if("OBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.objectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.objectRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GENERALCONTRACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.generalContractRef.code);
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

	} // end of save(ENOperativeObjectHistory anObject,String[] anAttributes)


	public ENOperativeObjectHistoryShort getShortObject(int anObjectCode) throws PersistenceException {
		ENOperativeObjectHistory filterObject = new ENOperativeObjectHistory();
		Vector<ENOperativeObjectHistoryShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENOperativeObjectHistoryShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENOperativeObjectHistory filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.objectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENOperativeObjectHistoryFilter filter) {
		String out = buildCondition((ENOperativeObjectHistory)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENOperativeObjectHistory filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENOperativeObjectHistory.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENOperativeObjectHistory.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENOperativeObjectHistory.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENOperativeObjectHistory.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENOperativeObjectHistory.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENOperativeObjectHistory.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENOperativeObjectHistory.finDocID_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENOperativeObjectHistory.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.objectRef.code, ENOperativeObjectHistory.objectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENOperativeObjectHistory.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENOperativeObjectHistoryShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENOperativeObjectHistoryShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENOperativeObjectHistoryShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENOperativeObjectHistoryShortList getFilteredList(ENOperativeObjectHistory filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistory aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistory aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistoryFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistoryFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENOperativeObjectHistoryShortList getScrollableFilteredList(ENOperativeObjectHistory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENOperativeObjectHistoryShortList result = new ENOperativeObjectHistoryShortList();
		ENOperativeObjectHistoryShort anObject;
		result.list = new Vector<ENOperativeObjectHistoryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECTHISTR.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENOPERATIVEOBJECTHISTR.CODE"+
			",ENOPERATIVEOBJECTHISTR.CONTRACTNUMBER"+
			",ENOPERATIVEOBJECTHISTR.CONTRACTDATE"+
			",ENOPERATIVEOBJECTHISTR.NAME"+
			",ENOPERATIVEOBJECTHISTR.PARTNERCODE"+
			",ENOPERATIVEOBJECTHISTR.FINDOCCODE"+
			",ENOPERATIVEOBJECTHISTR.FINDOCID"+
			", ENOPERATIVEOBJECT.CODE " +
			", ENOPERATIVEOBJECT.NAME " +
			", ENOPERATIVEOBJECT.CONTRACTNUMBER " +
			", ENOPERATIVEOBJECT.CONTRACTDATE " +
			", ENOPERATIVEOBJECT.PARTNERCODE " +
			", ENOPERATIVEOBJECT.PARTNERNAME " +
			", ENOPERATIVEOBJECT.FINDOCCODE " +
			", ENOPERATIVEOBJECT.FINDOCID " +
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +
		" FROM ENOPERATIVEOBJECTHISTR " +
			", ENOPERATIVEOBJECT " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENOPERATIVEOBJECT.CODE = ENOPERATIVEOBJECTHISTR.OBJECTREFCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECTHISTR.GENERALCONTRACTREFCODE" ; //+


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
				anObject = new ENOperativeObjectHistoryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.name = set.getString(4);
				anObject.partnerCode = set.getString(5);
				anObject.finDocCode = set.getString(6);
				anObject.finDocID = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}

				anObject.objectRefCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.objectRefCode = Integer.MIN_VALUE;
				}
				anObject.objectRefName = set.getString(9);
				anObject.objectRefContractNumber = set.getString(10);
				anObject.objectRefContractDate = set.getDate(11);
				anObject.objectRefPartnerCode = set.getString(12);
				anObject.objectRefPartnerName = set.getString(13);
				anObject.objectRefFinDocCode = set.getString(14);
				anObject.objectRefFinDocID = set.getInt(15);
				if(set.wasNull()) {
					anObject.objectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(17);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(18);
				anObject.generalContractRefContractNumber = set.getString(19);
				anObject.generalContractRefContractDate = set.getDate(20);
				anObject.generalContractRefCommentGen = set.getString(21);
				anObject.generalContractRefPartnerId = set.getInt(22);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(23);
				anObject.generalContractRefPartnerName = set.getString(24);
				anObject.generalContractRefContractRegDate = set.getDate(25);
				anObject.generalContractRefContractStartDate = set.getDate(26);
				anObject.generalContractRefContractEndDate = set.getDate(27);
				anObject.generalContractRefAxContractId = set.getString(28);
				anObject.generalContractRefAxContractCode = set.getString(29);
				anObject.generalContractRefAxContractNumber = set.getString(30);
				anObject.generalContractRefAxContractAccount = set.getString(31);
				anObject.generalContractRefAxContractDate = set.getDate(32);
				anObject.generalContractRefAxContractCommentGen = set.getString(33);
				anObject.generalContractRefAxContractGroupCode = set.getString(34);
				anObject.generalContractRefAxPartnerCode = set.getString(35);
				anObject.generalContractRefAxPartnerName = set.getString(36);
				anObject.generalContractRefUserGen = set.getString(37);

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

	public int[] getFilteredCodeArray(ENOperativeObjectHistoryFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENOperativeObjectHistory aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENOPERATIVEOBJECTHISTR.CODE FROM ENOPERATIVEOBJECTHISTR";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECTHISTR.CODE";
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

	public ENOperativeObjectHistory getObject(int uid) throws PersistenceException {
		ENOperativeObjectHistory result = new ENOperativeObjectHistory();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENOperativeObjectHistory anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENOPERATIVEOBJECTHISTR.CODE, ENOPERATIVEOBJECTHISTR.CONTRACTNUMBER, ENOPERATIVEOBJECTHISTR.CONTRACTDATE, ENOPERATIVEOBJECTHISTR.NAME, ENOPERATIVEOBJECTHISTR.PARTNERCODE, ENOPERATIVEOBJECTHISTR.FINDOCCODE, ENOPERATIVEOBJECTHISTR.FINDOCID, ENOPERATIVEOBJECTHISTR.MODIFY_TIME, ENOPERATIVEOBJECTHISTR.OBJECTREFCODE, ENOPERATIVEOBJECTHISTR.GENERALCONTRACTREFCODE "
			+" FROM ENOPERATIVEOBJECTHISTR WHERE ENOPERATIVEOBJECTHISTR.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.contractNumber = set.getString(2);
			anObject.contractDate = set.getDate(3);
			anObject.name = set.getString(4);
			anObject.partnerCode = set.getString(5);
			anObject.finDocCode = set.getString(6);
			anObject.finDocID = set.getInt(7);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.modify_time = set.getLong(8);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.objectRef.code = set.getInt(9);
			if (set.wasNull()) {
				anObject.objectRef.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(10);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.objectRef.code != Integer.MIN_VALUE) {
				anObject.setObjectRef(
					new com.ksoe.energynet.dataminer.generated.ENOperativeObjectDAOGen(connection,getUserProfile()).getRef(anObject.objectRef.code));
			}
			if(anObject.generalContractRef.code != Integer.MIN_VALUE) {
				anObject.setGeneralContractRef(
					new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).getRef(anObject.generalContractRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENOperativeObjectHistoryRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENOperativeObjectHistoryRef ref = new com.ksoe.energynet.valueobject.references.ENOperativeObjectHistoryRef();
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

		selectStr = "DELETE FROM  ENOPERATIVEOBJECTHISTR WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENOperativeObjectHistory object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENOperativeObjectHistory.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObjectHistory.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObjectHistory.remove%} access denied");
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

	public long count(ENOperativeObjectHistoryFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENOperativeObjectHistoryFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENOperativeObjectHistoryFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENOPERATIVEOBJECTHISTR", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENOperativeObjectHistoryFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENOPERATIVEOBJECTHISTR");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObjectHistory.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObjectHistory.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENOPERATIVEOBJECTHISTR.CODE FROM  ENOPERATIVEOBJECTHISTR WHERE  ENOPERATIVEOBJECTHISTR.CODE = ?";
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
		_checkConditionToken(condition,"code","ENOPERATIVEOBJECTHISTR.CODE");
		_checkConditionToken(condition,"contractnumber","ENOPERATIVEOBJECTHISTR.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENOPERATIVEOBJECTHISTR.CONTRACTDATE");
		_checkConditionToken(condition,"name","ENOPERATIVEOBJECTHISTR.NAME");
		_checkConditionToken(condition,"partnercode","ENOPERATIVEOBJECTHISTR.PARTNERCODE");
		_checkConditionToken(condition,"findoccode","ENOPERATIVEOBJECTHISTR.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENOPERATIVEOBJECTHISTR.FINDOCID");
		_checkConditionToken(condition,"modify_time","ENOPERATIVEOBJECTHISTR.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"objectref","OBJECTREFCODE");
		_checkConditionToken(condition,"objectref.code","OBJECTREFCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
		return condition.toString();
	}

	@Override
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

	private void _collectAutoIncrementFields(ENOperativeObjectHistory anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENOPERATIVEOBJECTHISTR", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENOPERATIVEOBJECTHISTR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENOPERATIVEOBJECTHISTR", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENOPERATIVEOBJECTHISTR");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENOperativeObjectHistoryDAO
