
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
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
import com.ksoe.energynet.valueobject.ENAgreeData2ServicesObject;
import com.ksoe.energynet.valueobject.filter.ENAgreeData2ServicesObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENAgreeData2ServicesObjectShort;
import com.ksoe.energynet.valueobject.lists.ENAgreeData2ServicesObjectShortList;


/**
 * DAO Object for ENAgreeData2ServicesObject;
 *
 */

public class ENAgreeData2ServicesObjectDAOGen extends GenericDataMiner {

	public ENAgreeData2ServicesObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAgreeData2ServicesObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAgreeData2ServicesObject inObject) throws PersistenceException {
		ENAgreeData2ServicesObject obj = new ENAgreeData2ServicesObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberDoc == null && obj.numberDoc == null){}
		else
			if(inObject.numberDoc == null || obj.numberDoc == null) return false;
			else
				if ( ! inObject.numberDoc.equals(obj.numberDoc)){
					return false;
				}

		if(inObject.rights == null && obj.rights == null){}
		else
			if(inObject.rights == null || obj.rights == null) return false;
			else
				if ( ! inObject.rights.equals(obj.rights)){
					return false;
				}

		if(inObject.connectionObj == null && obj.connectionObj == null){}
		else
			if(inObject.connectionObj == null || obj.connectionObj == null) return false;
			else
				if ( ! inObject.connectionObj.equals(obj.connectionObj)){
					return false;
				}

		if (inObject.buildersArea != obj.buildersArea){
					return false;
				}

		if(inObject.voltage == null && obj.voltage == null){}
		else
			if(inObject.voltage == null || obj.voltage == null) return false;
			else
				if ( ! inObject.voltage.equals(obj.voltage)){
					return false;
				}

		if(inObject.amperage == null && obj.amperage == null){}
		else
			if(inObject.amperage == null || obj.amperage == null) return false;
			else
				if ( ! inObject.amperage.equals(obj.amperage)){
					return false;
				}

		if(inObject.add1_1 == null && obj.add1_1 == null){}
		else
			if(inObject.add1_1 == null || obj.add1_1 == null) return false;
			else
				if ( ! inObject.add1_1.equals(obj.add1_1)){
					return false;
				}

		if(inObject.add1_2 == null && obj.add1_2 == null){}
		else
			if(inObject.add1_2 == null || obj.add1_2 == null) return false;
			else
				if ( ! inObject.add1_2.equals(obj.add1_2)){
					return false;
				}

		if(inObject.add2 == null && obj.add2 == null){}
		else
			if(inObject.add2 == null || obj.add2 == null) return false;
			else
				if ( ! inObject.add2.equals(obj.add2)){
					return false;
				}

		if(inObject.add3 == null && obj.add3 == null){}
		else
			if(inObject.add3 == null || obj.add3 == null) return false;
			else
				if ( ! inObject.add3.equals(obj.add3)){
					return false;
				}

		if(inObject.add4 == null && obj.add4 == null){}
		else
			if(inObject.add4 == null || obj.add4 == null) return false;
			else
				if ( ! inObject.add4.equals(obj.add4)){
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

		if (inObject.printHolder != obj.printHolder){
					return false;
				}
		if (inObject.servicesObjectRef.code != obj.servicesObjectRef.code){
			return false;
		}
		if (inObject.warrantRef.code != obj.warrantRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAgreeData2ServicesObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAgreeData2ServicesObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENAGREEDATA2SERVCSBJCT (CODE,NUMBERDOC,RIGHTS,CONNECTIONOBJ,BUILDERSAREA,VOLTAGE,AMPERAGE,ADD1_1,ADD1_2,ADD2,ADD3,ADD4,USERGEN,DATEEDIT,PRINTHOLDER,SERVICESOBJECTREFCODE,WARRANTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.numberDoc);
			statement.setString(3,anObject.rights);
			statement.setString(4,anObject.connectionObj);
			if (anObject.buildersArea != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.buildersArea);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			statement.setString(6,anObject.voltage);
			statement.setString(7,anObject.amperage);
			statement.setString(8,anObject.add1_1);
			statement.setString(9,anObject.add1_2);
			statement.setString(10,anObject.add2);
			statement.setString(11,anObject.add3);
			statement.setString(12,anObject.add4);
			statement.setString(13,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(14,null);
			} else {
				statement.setTimestamp(14,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.printHolder != Integer.MIN_VALUE ) {
				statement.setInt(15,anObject.printHolder);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.servicesObjectRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).exists(anObject.servicesObjectRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAgreeData2ServicesObject.servicesObjectRef.code%} = {%"+anObject.servicesObjectRef.code+"%}");
				}
				statement.setInt(16,anObject.servicesObjectRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.warrantRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.warrantRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAgreeData2ServicesObject.warrantRef.code%} = {%"+anObject.warrantRef.code+"%}");
				}
				statement.setInt(17,anObject.warrantRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENAgreeData2ServicesObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAgreeData2ServicesObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAgreeData2ServicesObject anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NUMBERDOC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RIGHTS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONOBJ") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDERSAREA") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("VOLTAGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AMPERAGE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADD1_1") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADD1_2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADD2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADD3") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADD4") == 0) {
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
					if(fieldNameStr.compareTo("PRINTHOLDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENAGREEDATA2SERVCSBJCT SET  NUMBERDOC = ? , RIGHTS = ? , CONNECTIONOBJ = ? , BUILDERSAREA = ? , VOLTAGE = ? , AMPERAGE = ? , ADD1_1 = ? , ADD1_2 = ? , ADD2 = ? , ADD3 = ? , ADD4 = ? , USERGEN = ? , DATEEDIT = ? , PRINTHOLDER = ? , SERVICESOBJECTREFCODE = ? , WARRANTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENAGREEDATA2SERVICESOBJECT SET ";
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
					statement.setString(1,anObject.numberDoc);
					statement.setString(2,anObject.rights);
					statement.setString(3,anObject.connectionObj);
					if (anObject.buildersArea != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.buildersArea);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					statement.setString(5,anObject.voltage);
					statement.setString(6,anObject.amperage);
					statement.setString(7,anObject.add1_1);
					statement.setString(8,anObject.add1_2);
					statement.setString(9,anObject.add2);
					statement.setString(10,anObject.add3);
					statement.setString(11,anObject.add4);
					statement.setString(12,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(13,null);
					} else {
						statement.setTimestamp(13,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.printHolder != Integer.MIN_VALUE) {
						statement.setInt(14,anObject.printHolder);
					} else {
						statement.setNull(14,java.sql.Types.INTEGER);
					}
					if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
						statement.setInt(15,anObject.servicesObjectRef.code);
					} else {
						statement.setNull(15,java.sql.Types.INTEGER);
					}
					if (anObject.warrantRef.code != Integer.MIN_VALUE) {
						statement.setInt(16,anObject.warrantRef.code);
					} else {
						statement.setNull(16,java.sql.Types.INTEGER);
					}
					statement.setInt(17,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERDOC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.numberDoc);
							continue;
						}
						if("RIGHTS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.rights);
							continue;
						}
						if("CONNECTIONOBJ".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.connectionObj);
							continue;
						}
						if("BUILDERSAREA".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.buildersArea);
							continue;
						}
						if("VOLTAGE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.voltage);
							continue;
						}
						if("AMPERAGE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.amperage);
							continue;
						}
						if("ADD1_1".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.add1_1);
							continue;
						}
						if("ADD1_2".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.add1_2);
							continue;
						}
						if("ADD2".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.add2);
							continue;
						}
						if("ADD3".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.add3);
							continue;
						}
						if("ADD4".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.add4);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
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
						if("PRINTHOLDER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.printHolder);
							continue;
						}
						if("SERVICESOBJECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.servicesObjectRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.warrantRef.code);
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

	} // end of save(ENAgreeData2ServicesObject anObject,String[] anAttributes)


	public ENAgreeData2ServicesObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAgreeData2ServicesObject filterObject = new ENAgreeData2ServicesObject();
		Vector<ENAgreeData2ServicesObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAgreeData2ServicesObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAgreeData2ServicesObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberDoc, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.rights, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionObj, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.buildersArea, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.voltage, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.amperage, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.add1_1, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.add1_2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.add2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.add3, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.add4, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.printHolder, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesObjectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAgreeData2ServicesObjectFilter filter) {
		String out = buildCondition((ENAgreeData2ServicesObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAgreeData2ServicesObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAgreeData2ServicesObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberDoc, ENAgreeData2ServicesObject.numberDoc_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.rights, ENAgreeData2ServicesObject.rights_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionObj, ENAgreeData2ServicesObject.connectionObj_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.buildersArea, ENAgreeData2ServicesObject.buildersArea_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.voltage, ENAgreeData2ServicesObject.voltage_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.amperage, ENAgreeData2ServicesObject.amperage_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.add1_1, ENAgreeData2ServicesObject.add1_1_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.add1_2, ENAgreeData2ServicesObject.add1_2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.add2, ENAgreeData2ServicesObject.add2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.add3, ENAgreeData2ServicesObject.add3_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.add4, ENAgreeData2ServicesObject.add4_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENAgreeData2ServicesObject.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENAgreeData2ServicesObject.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.printHolder, ENAgreeData2ServicesObject.printHolder_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesObjectRef.code, ENAgreeData2ServicesObject.servicesObjectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantRef.code, ENAgreeData2ServicesObject.warrantRef_QFielld, out);
		}
		return out;
	}

	public ENAgreeData2ServicesObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAgreeData2ServicesObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAgreeData2ServicesObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAgreeData2ServicesObjectShortList getFilteredList(ENAgreeData2ServicesObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(ENAgreeData2ServicesObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(ENAgreeData2ServicesObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(ENAgreeData2ServicesObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(ENAgreeData2ServicesObjectFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAgreeData2ServicesObjectShortList getScrollableFilteredList(ENAgreeData2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENAgreeData2ServicesObjectShortList result = new ENAgreeData2ServicesObjectShortList();
		ENAgreeData2ServicesObjectShort anObject;
		result.list = new Vector<ENAgreeData2ServicesObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENAGREEDATA2SERVCSBJCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENAGREEDATA2SERVCSBJCT.CODE"+
			",ENAGREEDATA2SERVCSBJCT.NUMBERDOC"+
			",ENAGREEDATA2SERVCSBJCT.RIGHTS"+
			",ENAGREEDATA2SERVCSBJCT.CONNECTIONOBJ"+
			",ENAGREEDATA2SERVCSBJCT.BUILDERSAREA"+
			",ENAGREEDATA2SERVCSBJCT.VOLTAGE"+
			",ENAGREEDATA2SERVCSBJCT.AMPERAGE"+
			",ENAGREEDATA2SERVCSBJCT.ADD1_1"+
			",ENAGREEDATA2SERVCSBJCT.ADD1_2"+
			",ENAGREEDATA2SERVCSBJCT.ADD2"+
			",ENAGREEDATA2SERVCSBJCT.ADD3"+
			",ENAGREEDATA2SERVCSBJCT.ADD4"+
			",ENAGREEDATA2SERVCSBJCT.USERGEN"+
			",ENAGREEDATA2SERVCSBJCT.PRINTHOLDER"+
			", ENSERVICESOBJECT.CODE " +
			", ENSERVICESOBJECT.CONTRACTNUMBER " +
			", ENSERVICESOBJECT.CONTRACTDATE " +
			", ENSERVICESOBJECT.NAME " +
			", ENSERVICESOBJECT.PARTNERCODE " +
			", ENSERVICESOBJECT.FINDOCCODE " +
			", ENSERVICESOBJECT.FINDOCID " +
			", ENSERVICESOBJECT.COMMENTGEN " +
			", ENSERVICESOBJECT.CONTRACTNUMBERSERVICES " +
			", ENSERVICESOBJECT.CONTRACTDATESERVICES " +
			", ENSERVICESOBJECT.CONTRAGENTNAME " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESS " +
			", ENSERVICESOBJECT.CONTRAGENTADDRESSWORK " +
			", ENSERVICESOBJECT.CONTRAGENTOKPO " +
			", ENSERVICESOBJECT.CONTRAGENTBANKACCOUNT " +
			", ENSERVICESOBJECT.CONTRAGENTBANKNAME " +
			", ENSERVICESOBJECT.CONTRAGENTBANKMFO " +
			", ENSERVICESOBJECT.CONTRAGENTBOSSNAME " +
			", ENSERVICESOBJECT.CONTRAGENTPASSPORT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMA " +
			", ENSERVICESOBJECT.CONTRACTSERVICESSUMMVT " +
			", ENSERVICESOBJECT.CONTRACTSERVICESPOWER " +
			", ENSERVICESOBJECT.COMMENTSERVICESGEN " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDISTNC " +
			", ENSERVICESOBJECT.CONTRACTSERVICESDAY " +
			", ENSERVICESOBJECT.USERGEN " +
			", ENSERVICESOBJECT.DATEEDIT " +
			", ENSERVICESOBJECT.WARRANTDATE " +
			", ENSERVICESOBJECT.WARRANTNUMBER " +
			", ENSERVICESOBJECT.WARRANTFIO " +
			", ENSERVICESOBJECT.REGIONALTYPE " +
			", ENSERVICESOBJECT.BASISTYPE " +
			", ENSERVICESOBJECT.CONTRAGENTPOSITION " +
			", ENSERVICESOBJECT.EXECUTEWORKDATE " +
			", ENSERVICESOBJECT.TIMESTART " +
			", ENSERVICESOBJECT.TIMEFINAL " +
			", ENSERVICESOBJECT.CONTRAGENTPHONENUMBER " +
			", ENSERVICESOBJECT.EXECUTORPHONENUMBER " +
			", ENSERVICESOBJECT.CONTRAGENTOBJECTWORK " +
			", ENSERVICESOBJECT.ISNOPAY " +
			", ENSERVICESOBJECT.ISCUSTOMERMATERIALS " +
			", ENSERVICESOBJECT.PAYDATE " +
			", ENSERVICESOBJECT.FINPAYFORMCODE " +
			", ENSERVICESOBJECT.FINPAYFORMNAME " +
			", ENSERVICESOBJECT.PARTNERID " +
			", ENSERVICESOBJECT.PAYDETAIL " +
			", ENSERVICESOBJECT.ACTTRANSFERNUMBER " +
			", ENSERVICESOBJECT.ACTTRANSFERDATE " +
			", ENSERVICESOBJECT.RESPOSIBLE " +
			", ENSERVICESOBJECT.RESPOSIBLEPOSITION " +
			", ENSERVICESOBJECT.RESPOSIBLETABNUMBER " +
			", ENSERVICESOBJECT.PREVCONTRACTSTATUS " +
			", ENSERVICESOBJECT.RECONNECTIONTU " +
			", ENSERVICESOBJECT.PERSONALACCOUNTCODE " +
			", ENSERVICESOBJECT.PERSONALACCOUNTNUMBER " +
			", ENSERVICESOBJECT.TABNUMBER " +
			", ENSERVICESOBJECT.CITIESLIST " +
			", ENSERVICESOBJECT.LINELENGTH " +
			", ENSERVICESOBJECT.PROJECTCODE " +
			", ENSERVICESOBJECT.CNPACKCODE " +
			", ENSERVICESOBJECT.DFPACKCODE " +
			", ENSERVICESOBJECT.COUNTERSZONETYPE " +
			", ENSERVICESOBJECT.AXPARTNERCODE " +
			", ENSERVICESOBJECT.AXPARTNERNAME " +
			", ENSERVICESOBJECT.AXCONTRACTNUMBER " +
			", ENSERVICESOBJECT.AXCONTRACTDATE " +
			", ENSERVICESOBJECT.AXCONTRACTCODE " +
			", ENSERVICESOBJECT.AXCONTRACTID " +
			", ENSERVICESOBJECT.AXCONTRACTCOMMENTGEN " +
			", ENSERVICESOBJECT.PROJAGREESUMMA " +
			", ENSERVICESOBJECT.TOPOGRAPHYSUMMA " +
			", ENSERVICESOBJECT.CREATEDFROMSITE " +
			", ENWARRANT.CODE " +
			", ENWARRANT.NUMBERGEN " +
			", ENWARRANT.NAME " +
			", ENWARRANT.WARRANTFIO " +
			", ENWARRANT.WARRANTSHORTFIO " +
			", ENWARRANT.WARRANTPOSITION " +
			", ENWARRANT.GENITIVEFIO " +
			", ENWARRANT.GENITIVEPOSITION " +
			", ENWARRANT.PASSPORT " +
			", ENWARRANT.ADDRESS " +
			", ENWARRANT.POWER " +
			", ENWARRANT.MAXSUM " +
		" FROM ENAGREEDATA2SERVCSBJCT " +
			", ENSERVICESOBJECT " +
			", ENWARRANT " +
		"";
		whereStr = " ENSERVICESOBJECT.CODE = ENAGREEDATA2SERVCSBJCT.SERVICESOBJECTREFCODE" ; //+
		whereStr += " AND ENWARRANT.CODE = ENAGREEDATA2SERVCSBJCT.WARRANTREFCODE" ; //+

	
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
				anObject = new ENAgreeData2ServicesObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberDoc = set.getString(2);
				anObject.rights = set.getString(3);
				anObject.connectionObj = set.getString(4);
				anObject.buildersArea = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.buildersArea = Integer.MIN_VALUE;
				}
				anObject.voltage = set.getString(6);
				anObject.amperage = set.getString(7);
				anObject.add1_1 = set.getString(8);
				anObject.add1_2 = set.getString(9);
				anObject.add2 = set.getString(10);
				anObject.add3 = set.getString(11);
				anObject.add4 = set.getString(12);
				anObject.userGen = set.getString(13);
				anObject.printHolder = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.printHolder = Integer.MIN_VALUE;
				}

				anObject.servicesObjectRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.servicesObjectRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefContractNumber = set.getString(16);
				anObject.servicesObjectRefContractDate = set.getDate(17);
				anObject.servicesObjectRefName = set.getString(18);
				anObject.servicesObjectRefPartnerCode = set.getString(19);
				anObject.servicesObjectRefFinDocCode = set.getString(20);
				anObject.servicesObjectRefFinDocID = set.getInt(21);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCommentGen = set.getString(22);
				anObject.servicesObjectRefContractNumberServices = set.getString(23);
				anObject.servicesObjectRefContractDateServices = set.getDate(24);
				anObject.servicesObjectRefContragentName = set.getString(25);
				anObject.servicesObjectRefContragentAddress = set.getString(26);
				anObject.servicesObjectRefContragentAddressWork = set.getString(27);
				anObject.servicesObjectRefContragentOkpo = set.getString(28);
				anObject.servicesObjectRefContragentBankAccount = set.getString(29);
				anObject.servicesObjectRefContragentBankName = set.getString(30);
				anObject.servicesObjectRefContragentBankMfo = set.getString(31);
				anObject.servicesObjectRefContragentBossName = set.getString(32);
				anObject.servicesObjectRefContragentPassport = set.getString(33);
				anObject.servicesObjectRefContractServicesSumma = set.getBigDecimal(34);
				if(anObject.servicesObjectRefContractServicesSumma != null) {
					anObject.servicesObjectRefContractServicesSumma = anObject.servicesObjectRefContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesSummaVAT = set.getBigDecimal(35);
				if(anObject.servicesObjectRefContractServicesSummaVAT != null) {
					anObject.servicesObjectRefContractServicesSummaVAT = anObject.servicesObjectRefContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesPower = set.getBigDecimal(36);
				if(anObject.servicesObjectRefContractServicesPower != null) {
					anObject.servicesObjectRefContractServicesPower = anObject.servicesObjectRefContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCommentServicesGen = set.getString(37);
				anObject.servicesObjectRefContractServicesDistance = set.getBigDecimal(38);
				if(anObject.servicesObjectRefContractServicesDistance != null) {
					anObject.servicesObjectRefContractServicesDistance = anObject.servicesObjectRefContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContractServicesDay = set.getBigDecimal(39);
				if(anObject.servicesObjectRefContractServicesDay != null) {
					anObject.servicesObjectRefContractServicesDay = anObject.servicesObjectRefContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefUserGen = set.getString(40);
				anObject.servicesObjectRefDateEdit = set.getDate(41);
				anObject.servicesObjectRefWarrantDate = set.getDate(42);
				anObject.servicesObjectRefWarrantNumber = set.getString(43);
				anObject.servicesObjectRefWarrantFIO = set.getString(44);
				anObject.servicesObjectRefRegionalType = set.getInt(45);
				if(set.wasNull()) {
					anObject.servicesObjectRefRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefBasisType = set.getBigDecimal(46);
				if(anObject.servicesObjectRefBasisType != null) {
					anObject.servicesObjectRefBasisType = anObject.servicesObjectRefBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefContragentPosition = set.getString(47);
				anObject.servicesObjectRefExecuteWorkDate = set.getDate(48);
				anObject.servicesObjectRefTimeStart = set.getTimestamp(49);
				anObject.servicesObjectRefTimeFinal = set.getTimestamp(50);
				anObject.servicesObjectRefContragentPhoneNumber = set.getString(51);
				anObject.servicesObjectRefExecutorPhoneNumber = set.getString(52);
				anObject.servicesObjectRefContragentObjectWork = set.getString(53);
				anObject.servicesObjectRefIsNoPay = set.getInt(54);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefIsCustomerMaterials = set.getInt(55);
				if(set.wasNull()) {
					anObject.servicesObjectRefIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDate = set.getDate(56);
				anObject.servicesObjectRefFinPayFormCode = set.getInt(57);
				if(set.wasNull()) {
					anObject.servicesObjectRefFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefFinPayFormName = set.getString(58);
				anObject.servicesObjectRefPartnerId = set.getInt(59);
				if(set.wasNull()) {
					anObject.servicesObjectRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPayDetail = set.getString(60);
				anObject.servicesObjectRefActTransferNumber = set.getString(61);
				anObject.servicesObjectRefActTransferDate = set.getDate(62);
				anObject.servicesObjectRefResposible = set.getString(63);
				anObject.servicesObjectRefResposiblePosition = set.getString(64);
				anObject.servicesObjectRefResposibleTabNumber = set.getString(65);
				anObject.servicesObjectRefPrevContractStatus = set.getInt(66);
				if(set.wasNull()) {
					anObject.servicesObjectRefPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefReconnectionTU = set.getInt(67);
				if(set.wasNull()) {
					anObject.servicesObjectRefReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountCode = set.getInt(68);
				if(set.wasNull()) {
					anObject.servicesObjectRefPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefPersonalAccountNumber = set.getString(69);
				anObject.servicesObjectRefTabNumber = set.getString(70);
				anObject.servicesObjectRefCitiesList = set.getString(71);
				anObject.servicesObjectRefLineLength = set.getBigDecimal(72);
				if(anObject.servicesObjectRefLineLength != null) {
					anObject.servicesObjectRefLineLength = anObject.servicesObjectRefLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefProjectCode = set.getString(73);
				anObject.servicesObjectRefCnPackCode = set.getInt(74);
				if(set.wasNull()) {
					anObject.servicesObjectRefCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefDfPackCode = set.getInt(75);
				if(set.wasNull()) {
					anObject.servicesObjectRefDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefCountersZoneType = set.getInt(76);
				if(set.wasNull()) {
					anObject.servicesObjectRefCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRefAxPartnerCode = set.getString(77);
				anObject.servicesObjectRefAxPartnerName = set.getString(78);
				anObject.servicesObjectRefAxContractNumber = set.getString(79);
				anObject.servicesObjectRefAxContractDate = set.getDate(80);
				anObject.servicesObjectRefAxContractCode = set.getString(81);
				anObject.servicesObjectRefAxContractId = set.getString(82);
				anObject.servicesObjectRefAxContractCommentGen = set.getString(83);
				anObject.servicesObjectRefProjAgreeSumma = set.getBigDecimal(84);
				if(anObject.servicesObjectRefProjAgreeSumma != null) {
					anObject.servicesObjectRefProjAgreeSumma = anObject.servicesObjectRefProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefTopographySumma = set.getBigDecimal(85);
				if(anObject.servicesObjectRefTopographySumma != null) {
					anObject.servicesObjectRefTopographySumma = anObject.servicesObjectRefTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesObjectRefCreatedFromSite = set.getInt(86);
				if(set.wasNull()) {
					anObject.servicesObjectRefCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.warrantRefCode = set.getInt(87);
				if(set.wasNull()) {
					anObject.warrantRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantRefNumbergen = set.getString(88);
				anObject.warrantRefName = set.getString(89);
				anObject.warrantRefWarrantFIO = set.getString(90);
				anObject.warrantRefWarrantShortFIO = set.getString(91);
				anObject.warrantRefWarrantPosition = set.getString(92);
				anObject.warrantRefGenitiveFIO = set.getString(93);
				anObject.warrantRefGenitivePosition = set.getString(94);
				anObject.warrantRefPassport = set.getString(95);
				anObject.warrantRefAddress = set.getString(96);
				anObject.warrantRefPower = set.getInt(97);
				if(set.wasNull()) {
					anObject.warrantRefPower = Integer.MIN_VALUE;
				}
				anObject.warrantRefMaxSum = set.getBigDecimal(98);
				if(anObject.warrantRefMaxSum != null) {
					anObject.warrantRefMaxSum = anObject.warrantRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
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
	
	public int[] getFilteredCodeArray(ENAgreeData2ServicesObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENAgreeData2ServicesObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENAGREEDATA2SERVCSBJCT.CODE FROM ENAGREEDATA2SERVCSBJCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENAGREEDATA2SERVCSBJCT.CODE";
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

	public ENAgreeData2ServicesObject getObject(int uid) throws PersistenceException {
		ENAgreeData2ServicesObject result = new ENAgreeData2ServicesObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENAgreeData2ServicesObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENAGREEDATA2SERVCSBJCT.CODE, ENAGREEDATA2SERVCSBJCT.NUMBERDOC, ENAGREEDATA2SERVCSBJCT.RIGHTS, ENAGREEDATA2SERVCSBJCT.CONNECTIONOBJ, ENAGREEDATA2SERVCSBJCT.BUILDERSAREA, ENAGREEDATA2SERVCSBJCT.VOLTAGE, ENAGREEDATA2SERVCSBJCT.AMPERAGE, ENAGREEDATA2SERVCSBJCT.ADD1_1, ENAGREEDATA2SERVCSBJCT.ADD1_2, ENAGREEDATA2SERVCSBJCT.ADD2, ENAGREEDATA2SERVCSBJCT.ADD3, ENAGREEDATA2SERVCSBJCT.ADD4, ENAGREEDATA2SERVCSBJCT.USERGEN, ENAGREEDATA2SERVCSBJCT.DATEEDIT, ENAGREEDATA2SERVCSBJCT.PRINTHOLDER, ENAGREEDATA2SERVCSBJCT.SERVICESOBJECTREFCODE, ENAGREEDATA2SERVCSBJCT.WARRANTREFCODE "
			+" FROM ENAGREEDATA2SERVCSBJCT WHERE ENAGREEDATA2SERVCSBJCT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberDoc = set.getString(2);
				anObject.rights = set.getString(3);
				anObject.connectionObj = set.getString(4);
				anObject.buildersArea = set.getInt(5);
				if (set.wasNull()) {
					anObject.buildersArea = Integer.MIN_VALUE;
				}
				anObject.voltage = set.getString(6);
				anObject.amperage = set.getString(7);
				anObject.add1_1 = set.getString(8);
				anObject.add1_2 = set.getString(9);
				anObject.add2 = set.getString(10);
				anObject.add3 = set.getString(11);
				anObject.add4 = set.getString(12);
				anObject.userGen = set.getString(13);
				anObject.dateEdit = set.getTimestamp(14);
				anObject.printHolder = set.getInt(15);
				if (set.wasNull()) {
					anObject.printHolder = Integer.MIN_VALUE;
				}
				anObject.servicesObjectRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.servicesObjectRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.warrantRef.code = Integer.MIN_VALUE;
				}
				if(anObject.servicesObjectRef.code != Integer.MIN_VALUE) {
					anObject.setServicesObjectRef(
						new com.ksoe.energynet.dataminer.generated.ENServicesObjectDAOGen(connection,getUserProfile()).getRef(anObject.servicesObjectRef.code));
				}
				if(anObject.warrantRef.code != Integer.MIN_VALUE) {
					anObject.setWarrantRef(
						new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).getRef(anObject.warrantRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENAgreeData2ServicesObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAgreeData2ServicesObjectRef ref = new com.ksoe.energynet.valueobject.references.ENAgreeData2ServicesObjectRef();
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

		selectStr = "DELETE FROM  ENAGREEDATA2SERVCSBJCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAgreeData2ServicesObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAgreeData2ServicesObject.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAgreeData2ServicesObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAgreeData2ServicesObject.remove%} access denied");
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
	
	public long count(ENAgreeData2ServicesObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAgreeData2ServicesObjectFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAgreeData2ServicesObjectFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENAGREEDATA2SERVCSBJCT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAgreeData2ServicesObjectFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENAGREEDATA2SERVCSBJCT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAgreeData2ServicesObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAgreeData2ServicesObject.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENAGREEDATA2SERVCSBJCT.CODE FROM  ENAGREEDATA2SERVCSBJCT WHERE  ENAGREEDATA2SERVCSBJCT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENAGREEDATA2SERVCSBJCT.CODE");
		_checkConditionToken(condition,"numberdoc","ENAGREEDATA2SERVCSBJCT.NUMBERDOC");
		_checkConditionToken(condition,"rights","ENAGREEDATA2SERVCSBJCT.RIGHTS");
		_checkConditionToken(condition,"connectionobj","ENAGREEDATA2SERVCSBJCT.CONNECTIONOBJ");
		_checkConditionToken(condition,"buildersarea","ENAGREEDATA2SERVCSBJCT.BUILDERSAREA");
		_checkConditionToken(condition,"voltage","ENAGREEDATA2SERVCSBJCT.VOLTAGE");
		_checkConditionToken(condition,"amperage","ENAGREEDATA2SERVCSBJCT.AMPERAGE");
		_checkConditionToken(condition,"add1_1","ENAGREEDATA2SERVCSBJCT.ADD1_1");
		_checkConditionToken(condition,"add1_2","ENAGREEDATA2SERVCSBJCT.ADD1_2");
		_checkConditionToken(condition,"add2","ENAGREEDATA2SERVCSBJCT.ADD2");
		_checkConditionToken(condition,"add3","ENAGREEDATA2SERVCSBJCT.ADD3");
		_checkConditionToken(condition,"add4","ENAGREEDATA2SERVCSBJCT.ADD4");
		_checkConditionToken(condition,"usergen","ENAGREEDATA2SERVCSBJCT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENAGREEDATA2SERVCSBJCT.DATEEDIT");
		_checkConditionToken(condition,"printholder","ENAGREEDATA2SERVCSBJCT.PRINTHOLDER");
		// relationship conditions
		_checkConditionToken(condition,"servicesobjectref","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"servicesobjectref.code","SERVICESOBJECTREFCODE");
		_checkConditionToken(condition,"warrantref","WARRANTREFCODE");
		_checkConditionToken(condition,"warrantref.code","WARRANTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAgreeData2ServicesObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENAGREEDATA2SERVCSBJCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENAGREEDATA2SERVCSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENAGREEDATA2SERVCSBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENAGREEDATA2SERVCSBJCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAgreeData2ServicesObjectDAO
