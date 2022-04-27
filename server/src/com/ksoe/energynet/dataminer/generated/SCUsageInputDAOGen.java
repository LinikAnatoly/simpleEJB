
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
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
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
import com.ksoe.energynet.valueobject.SCUsageInput;
import com.ksoe.energynet.valueobject.filter.SCUsageInputFilter;
import com.ksoe.energynet.valueobject.brief.SCUsageInputShort;
import com.ksoe.energynet.valueobject.lists.SCUsageInputShortList;


/**
 * DAO Object for SCUsageInput;
 *
 */

public class SCUsageInputDAOGen extends GenericDataMiner {

	public SCUsageInputDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public SCUsageInputDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(SCUsageInput inObject) throws PersistenceException {
		SCUsageInput obj = new SCUsageInput();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberDoc == null && obj.numberDoc == null){}
		else
			if(inObject.numberDoc == null || obj.numberDoc == null) return false;
			else
				if ( ! inObject.numberDoc.equals(obj.numberDoc)){
					return false;
				}

		if (inObject.numberInt != obj.numberInt){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

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

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.molName == null && obj.molName == null){}
		else
			if(inObject.molName == null || obj.molName == null) return false;
			else
				if ( ! inObject.molName.equals(obj.molName)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.dateEdit == null && obj.dateEdit == null){} else 
			if(inObject.dateEdit == null || obj.dateEdit == null) return false;
			else
				if (inObject.dateEdit.compareTo(obj.dateEdit) != 0){
					return false;
				}

		if (inObject.iszku != obj.iszku){
					return false;
				}

		if (inObject.isprinted != obj.isprinted){
					return false;
				}

		if(inObject.molCodeCounter == null && obj.molCodeCounter == null){}
		else
			if(inObject.molCodeCounter == null || obj.molCodeCounter == null) return false;
			else
				if ( ! inObject.molCodeCounter.equals(obj.molCodeCounter)){
					return false;
				}

		if(inObject.molNameCounter == null && obj.molNameCounter == null){}
		else
			if(inObject.molNameCounter == null || obj.molNameCounter == null) return false;
			else
				if ( ! inObject.molNameCounter.equals(obj.molNameCounter)){
					return false;
				}

		if (inObject.autoCreated != obj.autoCreated){
					return false;
				}

		if (inObject.isDocsReceived != obj.isDocsReceived){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		return true;
	}

	public int add(SCUsageInput anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(SCUsageInput anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(anObject.getDomain_info() == null) {
			anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
		}
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO SCUSAGEINPUT (CODE,NUMBERDOC,NUMBERINT,DATEGEN,DATESTART,DATEFINAL,MOLCODE,MOLNAME,COMMENTGEN,DATEEDIT,ISZKU,ISPRINTED,MOLCODECOUNTER,MOLNAMECOUNTER,AUTOCREATED,ISDOCSRECEIVED,USERGEN,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTCODE,STATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberDoc);
			if (anObject.numberInt != Integer.MIN_VALUE ) {
				statement.setInt(3, anObject.numberInt);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			if (anObject.dateGen == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.dateStart == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.dateStart.getTime()));
			}
			if (anObject.dateFinal == null) {
				statement.setDate(6, null);
			} else {
				statement.setDate(6, new java.sql.Date(anObject.dateFinal.getTime()));
			}
			statement.setString(7, anObject.molCode);
			statement.setString(8, anObject.molName);
			statement.setString(9, anObject.commentGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(10, null);
			} else {
				statement.setTimestamp(10, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.iszku != Integer.MIN_VALUE ) {
				statement.setInt(11, anObject.iszku);
			} else {
				statement.setNull(11, java.sql.Types.INTEGER);
			}
			if (anObject.isprinted != Integer.MIN_VALUE ) {
				statement.setInt(12, anObject.isprinted);
			} else {
				statement.setNull(12, java.sql.Types.INTEGER);
			}
			statement.setString(13, anObject.molCodeCounter);
			statement.setString(14, anObject.molNameCounter);
			if (anObject.autoCreated != Integer.MIN_VALUE ) {
				statement.setInt(15, anObject.autoCreated);
			} else {
				statement.setNull(15, java.sql.Types.INTEGER);
			}
			if (anObject.isDocsReceived != Integer.MIN_VALUE ) {
				statement.setInt(16, anObject.isDocsReceived);
			} else {
				statement.setNull(16, java.sql.Types.INTEGER);
			}
			statement.setString(17, anObject.userGen);
			statement.setString(18, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(19, null);
			} else {
				statement.setBigDecimal(19, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.department.code != Integer.MIN_VALUE){
				statement.setInt(20,anObject.department.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(21,anObject.statusRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%SCUsageInputDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(SCUsageInput anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(SCUsageInput anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			SCUsageInput oldObject = new SCUsageInput();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+SCUsageInput.modify_time_Field + "," + SCUsageInput.domain_info_Field+" FROM  SCUSAGEINPUT WHERE CODE = ?";
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
				oldObject.domain_info = set.getString(2);
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

			if(anObject.getDomain_info() == null) {
				anObject.setDomain_info(getUserProfile().getDomainInfo().getDomain());
			}
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
					if(fieldNameStr.compareTo("NUMBERINT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
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
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEEDIT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISZKU") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISPRINTED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODECOUNTER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLNAMECOUNTER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AUTOCREATED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ISDOCSRECEIVED") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOMAIN_INFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE SCUSAGEINPUT SET  NUMBERDOC = ? , NUMBERINT = ? , DATEGEN = ? , DATESTART = ? , DATEFINAL = ? , MOLCODE = ? , MOLNAME = ? , COMMENTGEN = ? , DATEEDIT = ? , ISZKU = ? , ISPRINTED = ? , MOLCODECOUNTER = ? , MOLNAMECOUNTER = ? , AUTOCREATED = ? , ISDOCSRECEIVED = ? , USERGEN = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , STATUSREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE SCUSAGEINPUT SET ";
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
					statement.setString(1, anObject.numberDoc);
					if (anObject.numberInt != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.numberInt);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					if (anObject.dateGen == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.dateStart == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(5, null);
					} else {
						statement.setDate(5, new java.sql.Date(anObject.dateFinal.getTime()));
					}
					statement.setString(6, anObject.molCode);
					statement.setString(7, anObject.molName);
					statement.setString(8, anObject.commentGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(9, null);
					} else {
						statement.setTimestamp(9, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.iszku != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.iszku);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.isprinted != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.isprinted);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					statement.setString(12, anObject.molCodeCounter);
					statement.setString(13, anObject.molNameCounter);
					if (anObject.autoCreated != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.autoCreated);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.isDocsReceived != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.isDocsReceived);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					statement.setString(16, anObject.userGen);
					statement.setString(17, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(18, null);
					} else {
						statement.setBigDecimal(18, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.department.code);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.statusRef.code);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					statement.setInt(21, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERDOC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberDoc);
							continue;
						}
						if("NUMBERINT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.numberInt);
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
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molCode);
							continue;
						}
						if("MOLNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molName);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
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
						if("ISZKU".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.iszku);
							continue;
						}
						if("ISPRINTED".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isprinted);
							continue;
						}
						if("MOLCODECOUNTER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molCodeCounter);
							continue;
						}
						if("MOLNAMECOUNTER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molNameCounter);
							continue;
						}
						if("AUTOCREATED".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.autoCreated);
							continue;
						}
						if("ISDOCSRECEIVED".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.isDocsReceived);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.domain_info);
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
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.department.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
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

	} // end of save(SCUsageInput anObject,String[] anAttributes)


	public SCUsageInputShort getShortObject(int anObjectCode) throws PersistenceException {
		SCUsageInput filterObject = new SCUsageInput();
		Vector<SCUsageInputShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (SCUsageInputShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(SCUsageInput filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberDoc, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.numberInt, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.iszku, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isprinted, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCodeCounter, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molNameCounter, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.autoCreated, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isDocsReceived, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(SCUsageInputFilter filter) {
		String out = buildCondition((SCUsageInput)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(SCUsageInput filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, SCUsageInput.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberDoc, SCUsageInput.numberDoc_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.numberInt, SCUsageInput.numberInt_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, SCUsageInput.dateGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, SCUsageInput.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, SCUsageInput.dateFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, SCUsageInput.molCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molName, SCUsageInput.molName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, SCUsageInput.commentGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, SCUsageInput.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.iszku, SCUsageInput.iszku_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isprinted, SCUsageInput.isprinted_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCodeCounter, SCUsageInput.molCodeCounter_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molNameCounter, SCUsageInput.molNameCounter_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.autoCreated, SCUsageInput.autoCreated_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isDocsReceived, SCUsageInput.isDocsReceived_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, SCUsageInput.userGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, SCUsageInput.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, SCUsageInput.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, SCUsageInput.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, SCUsageInput.statusRef_QFielld, out);
		}
		return out;
	}

	public SCUsageInputShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public SCUsageInputShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public SCUsageInputShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public SCUsageInputShortList getFilteredList(SCUsageInput filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public SCUsageInputShortList getScrollableFilteredList(SCUsageInput aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public SCUsageInputShortList getScrollableFilteredList(SCUsageInput aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public SCUsageInputShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public SCUsageInputShortList getScrollableFilteredList(SCUsageInputFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public SCUsageInputShortList getScrollableFilteredList(SCUsageInputFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public SCUsageInputShortList getScrollableFilteredList(SCUsageInput aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		SCUsageInputShortList result = new SCUsageInputShortList();
		SCUsageInputShort anObject;
		result.list = new Vector<SCUsageInputShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"SCUSAGEINPUT.CODE"+
			",SCUSAGEINPUT.NUMBERDOC"+
			",SCUSAGEINPUT.DATEGEN"+
			",SCUSAGEINPUT.DATESTART"+
			",SCUSAGEINPUT.DATEFINAL"+
			",SCUSAGEINPUT.MOLCODE"+
			",SCUSAGEINPUT.MOLNAME"+
			",SCUSAGEINPUT.DATEEDIT"+
			",SCUSAGEINPUT.MOLCODECOUNTER"+
			",SCUSAGEINPUT.MOLNAMECOUNTER"+
			",SCUSAGEINPUT.ISDOCSRECEIVED"+
			",SCUSAGEINPUT.USERGEN"+
			", ENDEPARTMENT.CODE " +
			", ENDEPARTMENT.SHORTNAME " +
			", ENDEPARTMENT.DATESTART " +
			", ENDEPARTMENT.DATEFINAL " +
			", ENDEPARTMENT.RENCODE " +
			", ENDEPARTMENT.SHPZBALANS " +
			", ENDEPARTMENT.KAU_TABLE_ID_1884 " +
			", ENDEPARTMENT.KAU_1884 " +
			", ENDEPARTMENT.NAME_1884 " +
			", ENDEPARTMENT.HRMORGANIZATIONID " +
			", SCUSAGEINPUTSTATUS.CODE " +
			", SCUSAGEINPUTSTATUS.NAME " +
		" FROM SCUSAGEINPUT " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = SCUSAGEINPUT.DEPARTMENTCODE "+
			" LEFT JOIN SCUSAGEINPUTSTATUS on SCUSAGEINPUTSTATUS.CODE = SCUSAGEINPUT.STATUSREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInput.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new SCUsageInputShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberDoc = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.dateStart = set.getDate(4);
				anObject.dateFinal = set.getDate(5);
				anObject.molCode = set.getString(6);
				anObject.molName = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);
				anObject.molCodeCounter = set.getString(9);
				anObject.molNameCounter = set.getString(10);
				anObject.isDocsReceived = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.isDocsReceived = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(12);

				anObject.departmentCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(14);
				anObject.departmentDateStart = set.getDate(15);
				anObject.departmentDateFinal = set.getDate(16);
				anObject.departmentRenCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(18);
				anObject.departmentKau_table_id_1884 = set.getInt(19);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(20);
				anObject.departmentName_1884 = set.getString(21);
				anObject.departmentHrmorganizationid = set.getString(22);
				anObject.statusRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(24);

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
	
	public int[] getFilteredCodeArray(SCUsageInputFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(SCUsageInputFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(SCUsageInput aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT SCUSAGEINPUT.CODE FROM SCUSAGEINPUT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "SCUSAGEINPUT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInput.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (SCUSAGEINPUT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
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


	public SCUsageInput getObject(int uid) throws PersistenceException {
		SCUsageInput result = new SCUsageInput();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(SCUsageInput anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(SCUsageInput anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(SCUsageInput anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

        SegregationInfo segregationInfo = null;
        String segregationWhereStr = null;
        
        if (!noSegregation) {
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%SCUsageInput.getObject%} access denied");
            }
        }

		selectStr = "SELECT  SCUSAGEINPUT.CODE, SCUSAGEINPUT.NUMBERDOC, SCUSAGEINPUT.NUMBERINT, SCUSAGEINPUT.DATEGEN, SCUSAGEINPUT.DATESTART, SCUSAGEINPUT.DATEFINAL, SCUSAGEINPUT.MOLCODE, SCUSAGEINPUT.MOLNAME, SCUSAGEINPUT.COMMENTGEN, SCUSAGEINPUT.DATEEDIT, SCUSAGEINPUT.ISZKU, SCUSAGEINPUT.ISPRINTED, SCUSAGEINPUT.MOLCODECOUNTER, SCUSAGEINPUT.MOLNAMECOUNTER, SCUSAGEINPUT.AUTOCREATED, SCUSAGEINPUT.ISDOCSRECEIVED, SCUSAGEINPUT.USERGEN, SCUSAGEINPUT.DOMAIN_INFO, SCUSAGEINPUT.MODIFY_TIME, SCUSAGEINPUT.DEPARTMENTCODE, SCUSAGEINPUT.STATUSREFCODE "
			+" FROM SCUSAGEINPUT WHERE SCUSAGEINPUT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());
            if (segregationWhereStr.length() > 0) {
                selectStr = selectStr + " AND " + segregationWhereStr;
            }
        }

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberDoc = set.getString(2);
				anObject.numberInt = set.getInt(3);
				if (set.wasNull()) {
					anObject.numberInt = Integer.MIN_VALUE;
				}
				anObject.dateGen = set.getDate(4);
				anObject.dateStart = set.getDate(5);
				anObject.dateFinal = set.getDate(6);
				anObject.molCode = set.getString(7);
				anObject.molName = set.getString(8);
				anObject.commentGen = set.getString(9);
				anObject.dateEdit = set.getTimestamp(10);
				anObject.iszku = set.getInt(11);
				if (set.wasNull()) {
					anObject.iszku = Integer.MIN_VALUE;
				}
				anObject.isprinted = set.getInt(12);
				if (set.wasNull()) {
					anObject.isprinted = Integer.MIN_VALUE;
				}
				anObject.molCodeCounter = set.getString(13);
				anObject.molNameCounter = set.getString(14);
				anObject.autoCreated = set.getInt(15);
				if (set.wasNull()) {
					anObject.autoCreated = Integer.MIN_VALUE;
				}
				anObject.isDocsReceived = set.getInt(16);
				if (set.wasNull()) {
					anObject.isDocsReceived = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(17);
				anObject.domain_info = set.getString(18);
				anObject.modify_time = set.getLong(19);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.department.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.department.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				if(anObject.department.code != Integer.MIN_VALUE) {
					anObject.setDepartment(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
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


	public com.ksoe.energynet.valueobject.references.SCUsageInputRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.SCUsageInputRef ref = new com.ksoe.energynet.valueobject.references.SCUsageInputRef();
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

		selectStr = "DELETE FROM  SCUSAGEINPUT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SCUsageInput object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%SCUsageInput.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInput.remove%} access denied");
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
	
	public long count(SCUsageInputFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(SCUsageInputFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, SCUsageInputFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM SCUSAGEINPUT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInput.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (SCUSAGEINPUT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
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
		String sql = String.format("SELECT %s FROM SCUSAGEINPUT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInputFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, SCUsageInputFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "SCUSAGEINPUT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%SCUsageInput.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (SCUSAGEINPUT.DOMAIN_INFO IS NOT NULL) ";
			} else {
				whereStr = " "+whereStr;
			}		
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(SCUsageInput.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%SCUsageInput.getObject%} access denied");
		}
		selectStr =
			"SELECT  SCUSAGEINPUT.CODE FROM  SCUSAGEINPUT WHERE  SCUSAGEINPUT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("SCUSAGEINPUT",segregationInfo,getUserProfile().getDomainInfo());
		if(segregationWhereStr.length() > 0) {
			selectStr = selectStr +
				" AND " + segregationWhereStr;
		}
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
		_checkConditionToken(condition,"code","SCUSAGEINPUT.CODE");
		_checkConditionToken(condition,"numberdoc","SCUSAGEINPUT.NUMBERDOC");
		_checkConditionToken(condition,"numberint","SCUSAGEINPUT.NUMBERINT");
		_checkConditionToken(condition,"dategen","SCUSAGEINPUT.DATEGEN");
		_checkConditionToken(condition,"datestart","SCUSAGEINPUT.DATESTART");
		_checkConditionToken(condition,"datefinal","SCUSAGEINPUT.DATEFINAL");
		_checkConditionToken(condition,"molcode","SCUSAGEINPUT.MOLCODE");
		_checkConditionToken(condition,"molname","SCUSAGEINPUT.MOLNAME");
		_checkConditionToken(condition,"commentgen","SCUSAGEINPUT.COMMENTGEN");
		_checkConditionToken(condition,"dateedit","SCUSAGEINPUT.DATEEDIT");
		_checkConditionToken(condition,"iszku","SCUSAGEINPUT.ISZKU");
		_checkConditionToken(condition,"isprinted","SCUSAGEINPUT.ISPRINTED");
		_checkConditionToken(condition,"molcodecounter","SCUSAGEINPUT.MOLCODECOUNTER");
		_checkConditionToken(condition,"molnamecounter","SCUSAGEINPUT.MOLNAMECOUNTER");
		_checkConditionToken(condition,"autocreated","SCUSAGEINPUT.AUTOCREATED");
		_checkConditionToken(condition,"isdocsreceived","SCUSAGEINPUT.ISDOCSRECEIVED");
		_checkConditionToken(condition,"usergen","SCUSAGEINPUT.USERGEN");
		_checkConditionToken(condition,"domain_info","SCUSAGEINPUT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","SCUSAGEINPUT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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
	
	private void _collectAutoIncrementFields(SCUsageInput anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("SCUSAGEINPUT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("SCUSAGEINPUT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: SCUSAGEINPUT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of SCUsageInputDAO
