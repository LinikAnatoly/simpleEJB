
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
import com.ksoe.energynet.valueobject.ENInspectionSheet;
import com.ksoe.energynet.valueobject.filter.ENInspectionSheetFilter;
import com.ksoe.energynet.valueobject.brief.ENInspectionSheetShort;
import com.ksoe.energynet.valueobject.lists.ENInspectionSheetShortList;


/**
 * DAO Object for ENInspectionSheet;
 *
 */

public class ENInspectionSheetDAOGen extends GenericDataMiner {

	public ENInspectionSheetDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENInspectionSheetDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENInspectionSheet inObject) throws PersistenceException {
		ENInspectionSheet obj = new ENInspectionSheet();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if (inObject.inspectionKind != obj.inspectionKind){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.executor == null && obj.executor == null){}
		else
			if(inObject.executor == null || obj.executor == null) return false;
			else
				if ( ! inObject.executor.equals(obj.executor)){
					return false;
				}

		if(inObject.accepted == null && obj.accepted == null){}
		else
			if(inObject.accepted == null || obj.accepted == null) return false;
			else
				if ( ! inObject.accepted.equals(obj.accepted)){
					return false;
				}

		if(inObject.objectInvNumber == null && obj.objectInvNumber == null){}
		else
			if(inObject.objectInvNumber == null || obj.objectInvNumber == null) return false;
			else
				if ( ! inObject.objectInvNumber.equals(obj.objectInvNumber)){
					return false;
				}

		if(inObject.objectName == null && obj.objectName == null){}
		else
			if(inObject.objectName == null || obj.objectName == null) return false;
			else
				if ( ! inObject.objectName.equals(obj.objectName)){
					return false;
				}

		if (inObject.equipmentKind != obj.equipmentKind){
					return false;
				}

		if (inObject.takeIntoCalculation != obj.takeIntoCalculation){
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
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.elementRef.code != obj.elementRef.code){
			return false;
		}
		if (inObject.defects2InspectRef.code != obj.defects2InspectRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		return true;
	}

	public int add(ENInspectionSheet anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENInspectionSheet anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENINSPECTIONSHEET (CODE,NAME,INSPECTIONKIND,DATEGEN,EXECUTOR,ACCEPTED,OBJECTINVNUMBER,OBJECTNAME,EQUIPMENTKIND,TAKEINTOCALCULATION,USERGEN,DATEEDIT,MODIFY_TIME,STATUSREFCODE,ELEMENTREFCODE,DEFECTS2INSPECTREFCODE,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.name);
			if (anObject.inspectionKind != Integer.MIN_VALUE ) {
				statement.setInt(3, anObject.inspectionKind);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			if (anObject.dateGen == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.dateGen.getTime()));
			}
			statement.setString(5, anObject.executor);
			statement.setString(6, anObject.accepted);
			statement.setString(7, anObject.objectInvNumber);
			statement.setString(8, anObject.objectName);
			if (anObject.equipmentKind != Integer.MIN_VALUE ) {
				statement.setInt(9, anObject.equipmentKind);
			} else {
				statement.setNull(9, java.sql.Types.INTEGER);
			}
			if (anObject.takeIntoCalculation != Integer.MIN_VALUE ) {
				statement.setInt(10, anObject.takeIntoCalculation);
			} else {
				statement.setNull(10, java.sql.Types.INTEGER);
			}
			statement.setString(11, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(12, null);
			} else {
				statement.setDate(12, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13, null);
			} else {
				statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.statusRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.elementRef.code != Integer.MIN_VALUE){
				statement.setInt(15,anObject.elementRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.defects2InspectRef.code != Integer.MIN_VALUE){
				statement.setInt(16,anObject.defects2InspectRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				statement.setInt(17,anObject.planRef.code);
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
			throw new PersistenceException("Error in method {%ENInspectionSheetDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENInspectionSheet anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENInspectionSheet anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENInspectionSheet oldObject = new ENInspectionSheet();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENInspectionSheet.modify_time_Field+" FROM  ENINSPECTIONSHEET WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("INSPECTIONKIND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EXECUTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCEPTED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTINVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("EQUIPMENTKIND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TAKEINTOCALCULATION") == 0) {
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
					if(fieldNameStr.compareTo("ELEMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEFECTS2INSPECTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENINSPECTIONSHEET SET  NAME = ? , INSPECTIONKIND = ? , DATEGEN = ? , EXECUTOR = ? , ACCEPTED = ? , OBJECTINVNUMBER = ? , OBJECTNAME = ? , EQUIPMENTKIND = ? , TAKEINTOCALCULATION = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , STATUSREFCODE = ? , ELEMENTREFCODE = ? , DEFECTS2INSPECTREFCODE = ? , PLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENINSPECTIONSHEET SET ";
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
					statement.setString(1, anObject.name);
					if (anObject.inspectionKind != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.inspectionKind);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					if (anObject.dateGen == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
					}
					statement.setString(4, anObject.executor);
					statement.setString(5, anObject.accepted);
					statement.setString(6, anObject.objectInvNumber);
					statement.setString(7, anObject.objectName);
					if (anObject.equipmentKind != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.equipmentKind);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.takeIntoCalculation != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.takeIntoCalculation);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setString(10, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(11, null);
					} else {
						statement.setDate(11, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12, null);
					} else {
						statement.setBigDecimal(12, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.statusRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.elementRef.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.elementRef.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.defects2InspectRef.code != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.defects2InspectRef.code);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.planRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					statement.setInt(17, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("INSPECTIONKIND".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.inspectionKind);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateGen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateGen.getTime()));
							}
							continue;
						}
						if("EXECUTOR".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.executor);
							continue;
						}
						if("ACCEPTED".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.accepted);
							continue;
						}
						if("OBJECTINVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.objectInvNumber);
							continue;
						}
						if("OBJECTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.objectName);
							continue;
						}
						if("EQUIPMENTKIND".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.equipmentKind);
							continue;
						}
						if("TAKEINTOCALCULATION".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.takeIntoCalculation);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.statusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DEFECTS2INSPECTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.defects2InspectRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.defects2InspectRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.planRef.code);
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

	} // end of save(ENInspectionSheet anObject,String[] anAttributes)


	public ENInspectionSheetShort getShortObject(int anObjectCode) throws PersistenceException {
		ENInspectionSheet filterObject = new ENInspectionSheet();
		Vector<ENInspectionSheetShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENInspectionSheetShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENInspectionSheet filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.inspectionKind, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.executor, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.accepted, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectInvNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.objectName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.equipmentKind, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.takeIntoCalculation, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.defects2InspectRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENInspectionSheetFilter filter) {
		String out = buildCondition((ENInspectionSheet)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENInspectionSheet filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENInspectionSheet.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENInspectionSheet.name_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.inspectionKind, ENInspectionSheet.inspectionKind_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENInspectionSheet.dateGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.executor, ENInspectionSheet.executor_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.accepted, ENInspectionSheet.accepted_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectInvNumber, ENInspectionSheet.objectInvNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.objectName, ENInspectionSheet.objectName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.equipmentKind, ENInspectionSheet.equipmentKind_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.takeIntoCalculation, ENInspectionSheet.takeIntoCalculation_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENInspectionSheet.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENInspectionSheet.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENInspectionSheet.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENInspectionSheet.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementRef.code, ENInspectionSheet.elementRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.defects2InspectRef.code, ENInspectionSheet.defects2InspectRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENInspectionSheet.planRef_QFielld, out);
		}
		return out;
	}

	public ENInspectionSheetShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENInspectionSheetShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENInspectionSheetShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENInspectionSheetShortList getFilteredList(ENInspectionSheet filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheet aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheet aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENInspectionSheetShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheetFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheetFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENInspectionSheetShortList getScrollableFilteredList(ENInspectionSheet aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENInspectionSheetShortList result = new ENInspectionSheetShortList();
		ENInspectionSheetShort anObject;
		result.list = new Vector<ENInspectionSheetShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENINSPECTIONSHEET.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENINSPECTIONSHEET.CODE"+
			",ENINSPECTIONSHEET.NAME"+
			",ENINSPECTIONSHEET.INSPECTIONKIND"+
			",ENINSPECTIONSHEET.DATEGEN"+
			",ENINSPECTIONSHEET.EXECUTOR"+
			",ENINSPECTIONSHEET.ACCEPTED"+
			",ENINSPECTIONSHEET.OBJECTINVNUMBER"+
			",ENINSPECTIONSHEET.OBJECTNAME"+
			",ENINSPECTIONSHEET.EQUIPMENTKIND"+
			",ENINSPECTIONSHEET.TAKEINTOCALCULATION"+
			",ENINSPECTIONSHEET.USERGEN"+
			",ENINSPECTIONSHEET.DATEEDIT"+
			", ENINSPECTIONSHEETSTATS.CODE " +
			", ENINSPECTIONSHEETSTATS.NAME " +
			", ENELEMENT.CODE " +
			", TKDEFECTS2INSPECTION.CODE " +
			", TKDEFECTS2INSPECTION.NAME " +
			", TKDEFECTS2INSPECTION.USERGEN " +
			", TKDEFECTS2INSPECTION.DATEEDIT " +
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.INVESTDATESTARTWORK " +
			", ENPLANWORK.INVESTWORKMEASCODE " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
		" FROM ENINSPECTIONSHEET " +
			" LEFT JOIN ENINSPECTIONSHEETSTATS on ENINSPECTIONSHEETSTATS.CODE = ENINSPECTIONSHEET.STATUSREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENINSPECTIONSHEET.ELEMENTREFCODE "+
			" LEFT JOIN TKDEFECTS2INSPECTION on TKDEFECTS2INSPECTION.CODE = ENINSPECTIONSHEET.DEFECTS2INSPECTREFCODE "+
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENINSPECTIONSHEET.PLANREFCODE "+
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
				anObject = new ENInspectionSheetShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.inspectionKind = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.inspectionKind = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(4);
				anObject.executor = set.getString(5);
				anObject.accepted = set.getString(6);
				anObject.objectInvNumber = set.getString(7);
				anObject.objectName = set.getString(8);
				anObject.equipmentKind = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.equipmentKind = Integer.MIN_VALUE;
				}
				anObject.takeIntoCalculation = set.getInt(10);
				if ( set.wasNull() ) {
					anObject.takeIntoCalculation = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getDate(12);

				anObject.statusRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(14);
				anObject.elementRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.elementRefCode = Integer.MIN_VALUE;
				}
				anObject.defects2InspectRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.defects2InspectRefCode = Integer.MIN_VALUE;
				}
				anObject.defects2InspectRefName = set.getString(17);
				anObject.defects2InspectRefUserGen = set.getString(18);
				anObject.defects2InspectRefDateEdit = set.getTimestamp(19);
				anObject.planRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(21);
				anObject.planRefDateStart = set.getDate(22);
				anObject.planRefDateFinal = set.getDate(23);
				anObject.planRefYearGen = set.getInt(24);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(26);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(27);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(28);
				anObject.planRefDateEdit = set.getDate(29);
				anObject.planRefWorkOrderNumber = set.getString(30);
				anObject.planRefDateWorkOrder = set.getDate(31);
				anObject.planRefPriConnectionNumber = set.getString(32);
				anObject.planRefDateEndPriConnection = set.getDate(33);
				anObject.planRefInvestWorksDescription = set.getString(34);
				anObject.planRefInvestDateStartWork = set.getTimestamp(35);
				anObject.planRefInvestWorkMeasCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.planRefInvestWorkMeasCode = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideFinId = set.getInt(37);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(38);
				anObject.planRefTotalTimeHours = set.getBigDecimal(39);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(40);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(41);

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
	
	public int[] getFilteredCodeArray(ENInspectionSheetFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENInspectionSheetFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENInspectionSheet aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENINSPECTIONSHEET.CODE FROM ENINSPECTIONSHEET";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENINSPECTIONSHEET.CODE";
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


	public ENInspectionSheet getObject(int uid) throws PersistenceException {
		ENInspectionSheet result = new ENInspectionSheet();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENInspectionSheet anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENINSPECTIONSHEET.CODE, ENINSPECTIONSHEET.NAME, ENINSPECTIONSHEET.INSPECTIONKIND, ENINSPECTIONSHEET.DATEGEN, ENINSPECTIONSHEET.EXECUTOR, ENINSPECTIONSHEET.ACCEPTED, ENINSPECTIONSHEET.OBJECTINVNUMBER, ENINSPECTIONSHEET.OBJECTNAME, ENINSPECTIONSHEET.EQUIPMENTKIND, ENINSPECTIONSHEET.TAKEINTOCALCULATION, ENINSPECTIONSHEET.USERGEN, ENINSPECTIONSHEET.DATEEDIT, ENINSPECTIONSHEET.MODIFY_TIME, ENINSPECTIONSHEET.STATUSREFCODE, ENINSPECTIONSHEET.ELEMENTREFCODE, ENINSPECTIONSHEET.DEFECTS2INSPECTREFCODE, ENINSPECTIONSHEET.PLANREFCODE "
			+" FROM ENINSPECTIONSHEET WHERE ENINSPECTIONSHEET.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.inspectionKind = set.getInt(3);
				if (set.wasNull()) {
					anObject.inspectionKind = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(4);
				anObject.executor = set.getString(5);
				anObject.accepted = set.getString(6);
				anObject.objectInvNumber = set.getString(7);
				anObject.objectName = set.getString(8);
				anObject.equipmentKind = set.getInt(9);
				if (set.wasNull()) {
					anObject.equipmentKind = Integer.MIN_VALUE;
				}
				anObject.takeIntoCalculation = set.getInt(10);
				if (set.wasNull()) {
					anObject.takeIntoCalculation = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(11);
				anObject.dateEdit = set.getDate(12);
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.elementRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.elementRef.code = Integer.MIN_VALUE;
				}
				anObject.defects2InspectRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.defects2InspectRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENInspectionSheetRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENInspectionSheetRef ref = new com.ksoe.energynet.valueobject.references.ENInspectionSheetRef();
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

		selectStr = "DELETE FROM  ENINSPECTIONSHEET WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENInspectionSheet object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENInspectionSheet.getObject%} access denied");
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
	
	public long count(ENInspectionSheetFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENInspectionSheetFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENInspectionSheetFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENINSPECTIONSHEET", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENINSPECTIONSHEET WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENInspectionSheetFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENInspectionSheetFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENINSPECTIONSHEET");
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
			"SELECT  ENINSPECTIONSHEET.CODE FROM  ENINSPECTIONSHEET WHERE  ENINSPECTIONSHEET.CODE = ?";
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
		_checkConditionToken(condition,"code","ENINSPECTIONSHEET.CODE");
		_checkConditionToken(condition,"name","ENINSPECTIONSHEET.NAME");
		_checkConditionToken(condition,"inspectionkind","ENINSPECTIONSHEET.INSPECTIONKIND");
		_checkConditionToken(condition,"dategen","ENINSPECTIONSHEET.DATEGEN");
		_checkConditionToken(condition,"executor","ENINSPECTIONSHEET.EXECUTOR");
		_checkConditionToken(condition,"accepted","ENINSPECTIONSHEET.ACCEPTED");
		_checkConditionToken(condition,"objectinvnumber","ENINSPECTIONSHEET.OBJECTINVNUMBER");
		_checkConditionToken(condition,"objectname","ENINSPECTIONSHEET.OBJECTNAME");
		_checkConditionToken(condition,"equipmentkind","ENINSPECTIONSHEET.EQUIPMENTKIND");
		_checkConditionToken(condition,"takeintocalculation","ENINSPECTIONSHEET.TAKEINTOCALCULATION");
		_checkConditionToken(condition,"usergen","ENINSPECTIONSHEET.USERGEN");
		_checkConditionToken(condition,"dateedit","ENINSPECTIONSHEET.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENINSPECTIONSHEET.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"elementref","ELEMENTREFCODE");
		_checkConditionToken(condition,"elementref.code","ELEMENTREFCODE");
		_checkConditionToken(condition,"defects2inspectref","DEFECTS2INSPECTREFCODE");
		_checkConditionToken(condition,"defects2inspectref.code","DEFECTS2INSPECTREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
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
	
	private void _collectAutoIncrementFields(ENInspectionSheet anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENINSPECTIONSHEET", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENINSPECTIONSHEET", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENINSPECTIONSHEET", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENINSPECTIONSHEET");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENInspectionSheetDAO
