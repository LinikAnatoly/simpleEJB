
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
import com.ksoe.energynet.valueobject.ENAct;
import com.ksoe.energynet.valueobject.filter.ENActFilter;
import com.ksoe.energynet.valueobject.brief.ENActShort;
import com.ksoe.energynet.valueobject.lists.ENActShortList;


/**
 * DAO Object for ENAct;
 *
 */

public class ENActDAOGen extends GenericDataMiner {

	public ENActDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct inObject) throws PersistenceException {
		ENAct obj = new ENAct();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberGen == null && obj.numberGen == null){}
		else
			if(inObject.numberGen == null || obj.numberGen == null) return false;
			else
				if ( ! inObject.numberGen.equals(obj.numberGen)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if(inObject.finMolCode == null && obj.finMolCode == null){}
		else
			if(inObject.finMolCode == null || obj.finMolCode == null) return false;
			else
				if ( ! inObject.finMolCode.equals(obj.finMolCode)){
					return false;
				}

		if(inObject.finMolName == null && obj.finMolName == null){}
		else
			if(inObject.finMolName == null || obj.finMolName == null) return false;
			else
				if ( ! inObject.finMolName.equals(obj.finMolName)){
					return false;
				}

		if(inObject.finMechanicCode == null && obj.finMechanicCode == null){}
		else
			if(inObject.finMechanicCode == null || obj.finMechanicCode == null) return false;
			else
				if ( ! inObject.finMechanicCode.equals(obj.finMechanicCode)){
					return false;
				}

		if(inObject.finMechanicName == null && obj.finMechanicName == null){}
		else
			if(inObject.finMechanicName == null || obj.finMechanicName == null) return false;
			else
				if ( ! inObject.finMechanicName.equals(obj.finMechanicName)){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
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

		if(inObject.dateAct == null && obj.dateAct == null){} else 
			if(inObject.dateAct == null || obj.dateAct == null) return false;
			else
				if (inObject.dateAct.compareTo(obj.dateAct) != 0){
					return false;
				}

		if(inObject.molCodeObject == null && obj.molCodeObject == null){}
		else
			if(inObject.molCodeObject == null || obj.molCodeObject == null) return false;
			else
				if ( ! inObject.molCodeObject.equals(obj.molCodeObject)){
					return false;
				}

		if(inObject.checkedByAccountant == null && obj.checkedByAccountant == null){} else 
			if(inObject.checkedByAccountant == null || obj.checkedByAccountant == null) return false;
			else
				if (inObject.checkedByAccountant.compareTo(obj.checkedByAccountant) != 0){
					return false;
				}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.actTypeRef.code != obj.actTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENACT (CODE,NUMBERGEN,DATEGEN,FINMOLCODE,FINMOLNAME,FINMECHANICCODE,FINMECHANICNAME,COMMENTGEN,INVNUMBER,USERGEN,DATEEDIT,DOMAIN_INFO,MODIFY_TIME,DATEACT,MOLCODEOBJECT,CHECKEDBYACCOUNTANT,STATUSREFCODE,ELEMENTCODE,ACTTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberGen);
			if (anObject.dateGen == null) {
				statement.setDate(3, null);
			} else {
				statement.setDate(3, new java.sql.Date(anObject.dateGen.getTime()));
			}
			statement.setString(4, anObject.finMolCode);
			statement.setString(5, anObject.finMolName);
			statement.setString(6, anObject.finMechanicCode);
			statement.setString(7, anObject.finMechanicName);
			statement.setString(8, anObject.commentGen);
			statement.setString(9, anObject.invNumber);
			statement.setString(10, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(11, null);
			} else {
				statement.setDate(11, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			statement.setString(12, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13, null);
			} else {
				statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.dateAct == null) {
				statement.setDate(14, null);
			} else {
				statement.setDate(14, new java.sql.Date(anObject.dateAct.getTime()));
			}
			statement.setString(15, anObject.molCodeObject);
			if (anObject.checkedByAccountant != null) {
				statement.setBoolean(16, anObject.checkedByAccountant);
			} else {
				statement.setNull(16, java.sql.Types.BOOLEAN);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(17,anObject.statusRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct.element.code%} = {%"+anObject.element.code+"%}");
				}
				statement.setInt(18,anObject.element.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.actTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkStateDAOGen(connection,getUserProfile()).exists(anObject.actTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENAct.actTypeRef.code%} = {%"+anObject.actTypeRef.code+"%}");
				}
				statement.setInt(19,anObject.actTypeRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAct oldObject = new ENAct();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAct.modify_time_Field + "," + ENAct.domain_info_Field+" FROM  ENACT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUMBERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINMOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINMOLNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINMECHANICCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINMECHANICNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
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
					if(fieldNameStr.compareTo("DATEACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODEOBJECT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CHECKEDBYACCOUNTANT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACT SET  NUMBERGEN = ? , DATEGEN = ? , FINMOLCODE = ? , FINMOLNAME = ? , FINMECHANICCODE = ? , FINMECHANICNAME = ? , COMMENTGEN = ? , INVNUMBER = ? , USERGEN = ? , DATEEDIT = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DATEACT = ? , MOLCODEOBJECT = ? , CHECKEDBYACCOUNTANT = ? , STATUSREFCODE = ? , ELEMENTCODE = ? , ACTTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT SET ";
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
					statement.setString(1, anObject.numberGen);
					if (anObject.dateGen == null) {
						statement.setDate(2, null);
					} else {
						statement.setDate(2, new java.sql.Date(anObject.dateGen.getTime()));
					}
					statement.setString(3, anObject.finMolCode);
					statement.setString(4, anObject.finMolName);
					statement.setString(5, anObject.finMechanicCode);
					statement.setString(6, anObject.finMechanicName);
					statement.setString(7, anObject.commentGen);
					statement.setString(8, anObject.invNumber);
					statement.setString(9, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(10, null);
					} else {
						statement.setDate(10, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					statement.setString(11, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12, null);
					} else {
						statement.setBigDecimal(12, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.dateAct == null) {
						statement.setDate(13, null);
					} else {
						statement.setDate(13, new java.sql.Date(anObject.dateAct.getTime()));
					}
					statement.setString(14, anObject.molCodeObject);
					if (anObject.checkedByAccountant == null) {
						statement.setNull(15, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(15, anObject.checkedByAccountant);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.statusRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(17, anObject.element.code);
					} else {
						statement.setNull(17, java.sql.Types.INTEGER);
					}
					if (anObject.actTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.actTypeRef.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					statement.setInt(19, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberGen);
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
						if("FINMOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finMolCode);
							continue;
						}
						if("FINMOLNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finMolName);
							continue;
						}
						if("FINMECHANICCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finMechanicCode);
							continue;
						}
						if("FINMECHANICNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finMechanicName);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumber);
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
						if("DATEACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAct == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateAct.getTime()));
							}
							continue;
						}
						if("MOLCODEOBJECT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.molCodeObject);
							continue;
						}
						if("CHECKEDBYACCOUNTANT".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.checkedByAccountant);
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
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.element.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actTypeRef.code);
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

	} // end of save(ENAct anObject,String[] anAttributes)


	public ENActShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct filterObject = new ENAct();
		Vector<ENActShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finMolCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finMolName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finMechanicCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finMechanicName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateAct, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCodeObject, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.checkedByAccountant, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENActFilter filter) {
		String out = buildCondition((ENAct)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberGen, ENAct.numberGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENAct.dateGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finMolCode, ENAct.finMolCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finMolName, ENAct.finMolName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finMechanicCode, ENAct.finMechanicCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finMechanicName, ENAct.finMechanicName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENAct.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENAct.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENAct.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENAct.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENAct.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAct.modify_time_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAct, ENAct.dateAct_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCodeObject, ENAct.molCodeObject_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.checkedByAccountant, ENAct.checkedByAccountant_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENAct.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENAct.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actTypeRef.code, ENAct.actTypeRef_QFielld, out);
		}
		return out;
	}

	public ENActShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActShortList getFilteredList(ENAct filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActShortList getScrollableFilteredList(ENAct aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActShortList getScrollableFilteredList(ENAct aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActShortList getScrollableFilteredList(ENActFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENActShortList getScrollableFilteredList(ENActFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENActShortList getScrollableFilteredList(ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENActShortList result = new ENActShortList();
		ENActShort anObject;
		result.list = new Vector<ENActShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT.CODE"+
			",ENACT.NUMBERGEN"+
			",ENACT.DATEGEN"+
			",ENACT.FINMOLCODE"+
			",ENACT.FINMOLNAME"+
			",ENACT.FINMECHANICNAME"+
			",ENACT.INVNUMBER"+
			",ENACT.USERGEN"+
			",ENACT.DATEEDIT"+
			",ENACT.DATEACT"+
			",ENACT.MOLCODEOBJECT"+
			",ENACT.CHECKEDBYACCOUNTANT"+
			", ENACTSTATUS.CODE " +
			", ENACTSTATUS.NAME " +
			", ENELEMENT.CODE " +
			", ENPLANWORKSTATE.CODE " +
			", ENPLANWORKSTATE.NAME " +
			", ENPLANWORKSTATE.SHORTNAME " +
		" FROM ENACT " +
			" LEFT JOIN ENACTSTATUS on ENACTSTATUS.CODE = ENACT.STATUSREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENACT.ELEMENTCODE "+
			" LEFT JOIN ENPLANWORKSTATE on ENPLANWORKSTATE.CODE = ENACT.ACTTYPEREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENActShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.finMolCode = set.getString(4);
				anObject.finMolName = set.getString(5);
				anObject.finMechanicName = set.getString(6);
				anObject.invNumber = set.getString(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getDate(9);
				anObject.dateAct = set.getDate(10);
				anObject.molCodeObject = set.getString(11);
				anObject.checkedByAccountant = set.getBoolean(12);
				if ( set.wasNull() ) {
					anObject.checkedByAccountant = null;
				}

				anObject.statusRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(14);
				anObject.elementCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.actTypeRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.actTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.actTypeRefName = set.getString(17);
				anObject.actTypeRefShortName = set.getString(18);

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
	
	public int[] getFilteredCodeArray(ENActFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENActFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT.CODE FROM ENACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENACT.DOMAIN_INFO IS NOT NULL) ";
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


	public ENAct getObject(int uid) throws PersistenceException {
		ENAct result = new ENAct();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENAct anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENAct anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENAct anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENAct.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENACT.CODE, ENACT.NUMBERGEN, ENACT.DATEGEN, ENACT.FINMOLCODE, ENACT.FINMOLNAME, ENACT.FINMECHANICCODE, ENACT.FINMECHANICNAME, ENACT.COMMENTGEN, ENACT.INVNUMBER, ENACT.USERGEN, ENACT.DATEEDIT, ENACT.DOMAIN_INFO, ENACT.MODIFY_TIME, ENACT.DATEACT, ENACT.MOLCODEOBJECT, ENACT.CHECKEDBYACCOUNTANT, ENACT.STATUSREFCODE, ENACT.ELEMENTCODE, ENACT.ACTTYPEREFCODE "
			+" FROM ENACT WHERE ENACT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.numberGen = set.getString(2);
				anObject.dateGen = set.getDate(3);
				anObject.finMolCode = set.getString(4);
				anObject.finMolName = set.getString(5);
				anObject.finMechanicCode = set.getString(6);
				anObject.finMechanicName = set.getString(7);
				anObject.commentGen = set.getString(8);
				anObject.invNumber = set.getString(9);
				anObject.userGen = set.getString(10);
				anObject.dateEdit = set.getDate(11);
				anObject.domain_info = set.getString(12);
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.dateAct = set.getDate(14);
				anObject.molCodeObject = set.getString(15);
				anObject.checkedByAccountant = set.getBoolean(16);
				if (set.wasNull()) {
					anObject.checkedByAccountant = null;
				}
				anObject.statusRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				anObject.element.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.actTypeRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.actTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


	public com.ksoe.energynet.valueobject.references.ENActRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActRef ref = new com.ksoe.energynet.valueobject.references.ENActRef();
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

		selectStr = "DELETE FROM  ENACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENAct.remove%} access denied");
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
	
	public long count(ENActFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENACT.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENAct.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENAct.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACT.CODE FROM  ENACT WHERE  ENACT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENACT.CODE");
		_checkConditionToken(condition,"numbergen","ENACT.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENACT.DATEGEN");
		_checkConditionToken(condition,"finmolcode","ENACT.FINMOLCODE");
		_checkConditionToken(condition,"finmolname","ENACT.FINMOLNAME");
		_checkConditionToken(condition,"finmechaniccode","ENACT.FINMECHANICCODE");
		_checkConditionToken(condition,"finmechanicname","ENACT.FINMECHANICNAME");
		_checkConditionToken(condition,"commentgen","ENACT.COMMENTGEN");
		_checkConditionToken(condition,"invnumber","ENACT.INVNUMBER");
		_checkConditionToken(condition,"usergen","ENACT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENACT.DATEEDIT");
		_checkConditionToken(condition,"domain_info","ENACT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENACT.MODIFY_TIME");
		_checkConditionToken(condition,"dateact","ENACT.DATEACT");
		_checkConditionToken(condition,"molcodeobject","ENACT.MOLCODEOBJECT");
		_checkConditionToken(condition,"checkedbyaccountant","ENACT.CHECKEDBYACCOUNTANT");
		// relationship conditions
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"acttyperef","ACTTYPEREFCODE");
		_checkConditionToken(condition,"acttyperef.code","ACTTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENAct anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActDAO
