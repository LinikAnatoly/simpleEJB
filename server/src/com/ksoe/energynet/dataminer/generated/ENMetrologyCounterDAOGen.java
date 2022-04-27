
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.ENMetrologyCounter;
import com.ksoe.energynet.valueobject.filter.ENMetrologyCounterFilter;
import com.ksoe.energynet.valueobject.brief.ENMetrologyCounterShort;
import com.ksoe.energynet.valueobject.lists.ENMetrologyCounterShortList;


/**
 * DAO Object for ENMetrologyCounter;
 *
 */

public class ENMetrologyCounterDAOGen extends GenericDataMiner {

	public ENMetrologyCounterDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENMetrologyCounterDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENMetrologyCounter inObject) throws PersistenceException {
		ENMetrologyCounter obj = new ENMetrologyCounter();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.buildNumber == null && obj.buildNumber == null){}
		else
			if(inObject.buildNumber == null || obj.buildNumber == null) return false;
			else
				if ( ! inObject.buildNumber.equals(obj.buildNumber)){
					return false;
				}

		if(inObject.account == null && obj.account == null){}
		else
			if(inObject.account == null || obj.account == null) return false;
			else
				if ( ! inObject.account.equals(obj.account)){
					return false;
				}

		if(inObject.departmetFKCode == null && obj.departmetFKCode == null){}
		else
			if(inObject.departmetFKCode == null || obj.departmetFKCode == null) return false;
			else
				if ( ! inObject.departmetFKCode.equals(obj.departmetFKCode)){
					return false;
				}

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.dateIn == null && obj.dateIn == null){} else 
			if(inObject.dateIn == null || obj.dateIn == null) return false;
			else
				if (inObject.dateIn.compareTo(obj.dateIn) != 0){
					return false;
				}

		if(inObject.dateBuild == null && obj.dateBuild == null){} else 
			if(inObject.dateBuild == null || obj.dateBuild == null) return false;
			else
				if (inObject.dateBuild.compareTo(obj.dateBuild) != 0){
					return false;
				}

		if(inObject.cost == null && obj.cost == null){}
		else
			if(inObject.cost == null || obj.cost == null) return false;
			else
				if ( ! inObject.cost.equals(obj.cost)){
					return false;
				}

		if (inObject.scCode != obj.scCode){
					return false;
				}

		if(inObject.counterType == null && obj.counterType == null){}
		else
			if(inObject.counterType == null || obj.counterType == null) return false;
			else
				if ( ! inObject.counterType.equals(obj.counterType)){
					return false;
				}

		if (inObject.phasity != obj.phasity){
					return false;
				}

		if (inObject.zones != obj.zones){
					return false;
				}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.zoneRef.code != obj.zoneRef.code){
			return false;
		}
		if (inObject.accountingTypeRef.code != obj.accountingTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENMetrologyCounter anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENMetrologyCounter anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENMETROLOGYCOUNTER (CODE,INVNUMBER,NAME,BUILDNUMBER,ACCOUNT,DEPARTMETFKCODE,MOLCODE,DATEIN,DATEBUILD,COST,SCCODE,COUNTERTYPE,PHASITY,ZONES,DOMAIN_INFO,MODIFY_TIME,ELEMENTCODE,ZONEREFCODE,ACCOUNTINGTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.invNumber);
			statement.setString(3,anObject.name);
			statement.setString(4,anObject.buildNumber);
			statement.setString(5,anObject.account);
			statement.setString(6,anObject.departmetFKCode);
			statement.setString(7,anObject.molCode);
			if (anObject.dateIn == null) {
				statement.setDate(8,null);
			} else {
				statement.setDate(8,new java.sql.Date(anObject.dateIn.getTime()));
			}
			if (anObject.dateBuild == null) {
				statement.setDate(9,null);
			} else {
				statement.setDate(9,new java.sql.Date(anObject.dateBuild.getTime()));
			}
			if (anObject.cost != null) {
				anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10,anObject.cost);
			if (anObject.scCode != Integer.MIN_VALUE ) {
				statement.setInt(11,anObject.scCode);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			statement.setString(12,anObject.counterType);
			if (anObject.phasity != Integer.MIN_VALUE ) {
				statement.setInt(13,anObject.phasity);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.zones != Integer.MIN_VALUE ) {
				statement.setInt(14,anObject.zones);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			statement.setString(15,anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(16,null);
			} else {
				statement.setBigDecimal(16,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENMetrologyCounter.element.code%} = {%"+anObject.element.code+"%}");
				}
				statement.setInt(17,anObject.element.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.zoneRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQStorageZoneDAOGen(connection,getUserProfile()).exists(anObject.zoneRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENMetrologyCounter.zoneRef.code%} = {%"+anObject.zoneRef.code+"%}");
				}
				statement.setInt(18,anObject.zoneRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.accountingTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKAccountingTypeDAOGen(connection,getUserProfile()).exists(anObject.accountingTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENMetrologyCounter.accountingTypeRef.code%} = {%"+anObject.accountingTypeRef.code+"%}");
				}
				statement.setInt(19,anObject.accountingTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENMetrologyCounterDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENMetrologyCounter anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENMetrologyCounter anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENMetrologyCounter oldObject = new ENMetrologyCounter();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENMetrologyCounter.modify_time_Field + "," + ENMetrologyCounter.domain_info_Field+" FROM  ENMETROLOGYCOUNTER WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMETFKCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBUILD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COST") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COUNTERTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHASITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ZONES") == 0) {
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
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ZONEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACCOUNTINGTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENMETROLOGYCOUNTER SET  INVNUMBER = ? , NAME = ? , BUILDNUMBER = ? , ACCOUNT = ? , DEPARTMETFKCODE = ? , MOLCODE = ? , DATEIN = ? , DATEBUILD = ? , COST = ? , SCCODE = ? , COUNTERTYPE = ? , PHASITY = ? , ZONES = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , ELEMENTCODE = ? , ZONEREFCODE = ? , ACCOUNTINGTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENMETROLOGYCOUNTER SET ";
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
					statement.setString(1,anObject.invNumber);
					statement.setString(2,anObject.name);
					statement.setString(3,anObject.buildNumber);
					statement.setString(4,anObject.account);
					statement.setString(5,anObject.departmetFKCode);
					statement.setString(6,anObject.molCode);
					if (anObject.dateIn == null) {
						statement.setDate(7,null);
					} else {
						statement.setDate(7,new java.sql.Date(anObject.dateIn.getTime()));
					}
					if (anObject.dateBuild == null) {
						statement.setDate(8,null);
					} else {
						statement.setDate(8,new java.sql.Date(anObject.dateBuild.getTime()));
					}
					if (anObject.cost != null) {
						anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9,anObject.cost);
					if (anObject.scCode != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.scCode);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setString(11,anObject.counterType);
					if (anObject.phasity != Integer.MIN_VALUE) {
						statement.setInt(12,anObject.phasity);
					} else {
						statement.setNull(12,java.sql.Types.INTEGER);
					}
					if (anObject.zones != Integer.MIN_VALUE) {
						statement.setInt(13,anObject.zones);
					} else {
						statement.setNull(13,java.sql.Types.INTEGER);
					}
					statement.setString(14,anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(15,null);
					} else {
						statement.setBigDecimal(15,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(16,anObject.element.code);
					} else {
						statement.setNull(16,java.sql.Types.INTEGER);
					}
					if (anObject.zoneRef.code != Integer.MIN_VALUE) {
						statement.setInt(17,anObject.zoneRef.code);
					} else {
						statement.setNull(17,java.sql.Types.INTEGER);
					}
					if (anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(18,anObject.accountingTypeRef.code);
					} else {
						statement.setNull(18,java.sql.Types.INTEGER);
					}
					statement.setInt(19,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.invNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("BUILDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.buildNumber);
							continue;
						}
						if("ACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.account);
							continue;
						}
						if("DEPARTMETFKCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.departmetFKCode);
							continue;
						}
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molCode);
							continue;
						}
						if("DATEIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateIn == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateIn.getTime()));
							}
							continue;
						}
						if("DATEBUILD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateBuild == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateBuild.getTime()));
							}
							continue;
						}
						if("COST".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cost != null) {
								anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.cost);
							continue;
						}
						if("SCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.scCode);
							continue;
						}
						if("COUNTERTYPE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.counterType);
							continue;
						}
						if("PHASITY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.phasity);
							continue;
						}
						if("ZONES".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.zones);
							continue;
						}
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.domain_info);
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
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.element.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ZONEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.zoneRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.zoneRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACCOUNTINGTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.accountingTypeRef.code);
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

	} // end of save(ENMetrologyCounter anObject,String[] anAttributes)


	public ENMetrologyCounterShort getShortObject(int anObjectCode) throws PersistenceException {
		ENMetrologyCounter filterObject = new ENMetrologyCounter();
		Vector<ENMetrologyCounterShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENMetrologyCounterShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENMetrologyCounter filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buildNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.account, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmetFKCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateIn, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBuild, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.cost, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.scCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.counterType, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.phasity, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.zones, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.zoneRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.accountingTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENMetrologyCounterFilter filter) {
		String out = buildCondition((ENMetrologyCounter)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENMetrologyCounter filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENMetrologyCounter.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENMetrologyCounter.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENMetrologyCounter.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buildNumber, ENMetrologyCounter.buildNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.account, ENMetrologyCounter.account_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmetFKCode, ENMetrologyCounter.departmetFKCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, ENMetrologyCounter.molCode_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateIn, ENMetrologyCounter.dateIn_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBuild, ENMetrologyCounter.dateBuild_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.cost, ENMetrologyCounter.cost_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.scCode, ENMetrologyCounter.scCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.counterType, ENMetrologyCounter.counterType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.phasity, ENMetrologyCounter.phasity_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.zones, ENMetrologyCounter.zones_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENMetrologyCounter.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENMetrologyCounter.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENMetrologyCounter.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.zoneRef.code, ENMetrologyCounter.zoneRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.accountingTypeRef.code, ENMetrologyCounter.accountingTypeRef_QFielld, out);
		}
		return out;
	}

	public ENMetrologyCounterShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENMetrologyCounterShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENMetrologyCounterShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENMetrologyCounterShortList getFilteredList(ENMetrologyCounter filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounter aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENMetrologyCounterShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounterFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounterFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENMetrologyCounterShortList getScrollableFilteredList(ENMetrologyCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENMetrologyCounterShortList result = new ENMetrologyCounterShortList();
		ENMetrologyCounterShort anObject;
		result.list = new Vector<ENMetrologyCounterShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENMETROLOGYCOUNTER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENMETROLOGYCOUNTER.CODE"+
			",ENMETROLOGYCOUNTER.INVNUMBER"+
			",ENMETROLOGYCOUNTER.NAME"+
			",ENMETROLOGYCOUNTER.BUILDNUMBER"+
			",ENMETROLOGYCOUNTER.ACCOUNT"+
			",ENMETROLOGYCOUNTER.DEPARTMETFKCODE"+
			",ENMETROLOGYCOUNTER.MOLCODE"+
			",ENMETROLOGYCOUNTER.DATEIN"+
			",ENMETROLOGYCOUNTER.DATEBUILD"+
			",ENMETROLOGYCOUNTER.COST"+
			",ENMETROLOGYCOUNTER.SCCODE"+
			",ENMETROLOGYCOUNTER.COUNTERTYPE"+
			",ENMETROLOGYCOUNTER.PHASITY"+
			",ENMETROLOGYCOUNTER.ZONES"+
			", ENELEMENT.CODE " +
			", RQSTORAGEZONE.CODE " +
			", RQSTORAGEZONE.NAME " +
			", TKACCOUNTINGTYPE.CODE " +
			", TKACCOUNTINGTYPE.NAME " +
		" FROM ENMETROLOGYCOUNTER " +
			", ENELEMENT " +
			", RQSTORAGEZONE " +
			", TKACCOUNTINGTYPE " +
		"";
		whereStr = " ENELEMENT.CODE = ENMETROLOGYCOUNTER.ELEMENTCODE" ; //+
		whereStr += " AND RQSTORAGEZONE.CODE = ENMETROLOGYCOUNTER.ZONEREFCODE" ; //+
		whereStr += " AND TKACCOUNTINGTYPE.CODE = ENMETROLOGYCOUNTER.ACCOUNTINGTYPEREFCODE" ; //+

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENMetrologyCounterShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.cost = set.getBigDecimal(10);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(12);
				anObject.phasity = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.phasity = Integer.MIN_VALUE;
				}
				anObject.zones = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.zones = Integer.MIN_VALUE;
				}

				anObject.elementCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.zoneRefCode = Integer.MIN_VALUE;
				}
				anObject.zoneRefName = set.getString(17);
				anObject.accountingTypeRefCode = set.getInt(18);
				if(set.wasNull()) {
					anObject.accountingTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.accountingTypeRefName = set.getString(19);

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
	
	public int[] getFilteredCodeArray(ENMetrologyCounterFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENMetrologyCounterFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENMetrologyCounter aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENMETROLOGYCOUNTER.CODE FROM ENMETROLOGYCOUNTER";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENMETROLOGYCOUNTER.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENMETROLOGYCOUNTER.DOMAIN_INFO IS NOT NULL) ";
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

	public ENMetrologyCounter getObject(int uid) throws PersistenceException {
		ENMetrologyCounter result = new ENMetrologyCounter();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENMetrologyCounter anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getObject%} access denied");
		}


		selectStr = "SELECT  ENMETROLOGYCOUNTER.CODE, ENMETROLOGYCOUNTER.INVNUMBER, ENMETROLOGYCOUNTER.NAME, ENMETROLOGYCOUNTER.BUILDNUMBER, ENMETROLOGYCOUNTER.ACCOUNT, ENMETROLOGYCOUNTER.DEPARTMETFKCODE, ENMETROLOGYCOUNTER.MOLCODE, ENMETROLOGYCOUNTER.DATEIN, ENMETROLOGYCOUNTER.DATEBUILD, ENMETROLOGYCOUNTER.COST, ENMETROLOGYCOUNTER.SCCODE, ENMETROLOGYCOUNTER.COUNTERTYPE, ENMETROLOGYCOUNTER.PHASITY, ENMETROLOGYCOUNTER.ZONES, ENMETROLOGYCOUNTER.DOMAIN_INFO, ENMETROLOGYCOUNTER.MODIFY_TIME, ENMETROLOGYCOUNTER.ELEMENTCODE, ENMETROLOGYCOUNTER.ZONEREFCODE, ENMETROLOGYCOUNTER.ACCOUNTINGTYPEREFCODE "
			+" FROM ENMETROLOGYCOUNTER WHERE ENMETROLOGYCOUNTER.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());
		if(segregationWhereStr.length() > 0) {
			selectStr = selectStr + " AND " + segregationWhereStr;
		}

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.account = set.getString(5);
				anObject.departmetFKCode = set.getString(6);
				anObject.molCode = set.getString(7);
				anObject.dateIn = set.getDate(8);
				anObject.dateBuild = set.getDate(9);
				anObject.cost = set.getBigDecimal(10);
				if(anObject.cost != null) {
					anObject.cost = anObject.cost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.scCode = set.getInt(11);
				if (set.wasNull()) {
					anObject.scCode = Integer.MIN_VALUE;
				}
				anObject.counterType = set.getString(12);
				anObject.phasity = set.getInt(13);
				if (set.wasNull()) {
					anObject.phasity = Integer.MIN_VALUE;
				}
				anObject.zones = set.getInt(14);
				if (set.wasNull()) {
					anObject.zones = Integer.MIN_VALUE;
				}
				anObject.domain_info = set.getString(15);
				anObject.modify_time = set.getLong(16);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.element.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.zoneRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.zoneRef.code = Integer.MIN_VALUE;
				}
				anObject.accountingTypeRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.accountingTypeRef.code = Integer.MIN_VALUE;
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
				}
				if(anObject.zoneRef.code != Integer.MIN_VALUE) {
					anObject.setZoneRef(
						new com.ksoe.rqorder.dataminer.generated.RQStorageZoneDAOGen(connection,getUserProfile()).getRef(anObject.zoneRef.code));
				}
				if(anObject.accountingTypeRef.code != Integer.MIN_VALUE) {
					anObject.setAccountingTypeRef(
						new com.ksoe.techcard.dataminer.generated.TKAccountingTypeDAOGen(connection,getUserProfile()).getRef(anObject.accountingTypeRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENMetrologyCounterRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENMetrologyCounterRef ref = new com.ksoe.energynet.valueobject.references.ENMetrologyCounterRef();
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

		selectStr = "DELETE FROM  ENMETROLOGYCOUNTER WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENMetrologyCounter object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENMetrologyCounter.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.remove%} access denied");
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
	
	public long count(ENMetrologyCounterFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENMetrologyCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENMetrologyCounterFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENMETROLOGYCOUNTER", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENMETROLOGYCOUNTER.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENMetrologyCounterFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENMETROLOGYCOUNTER");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENMetrologyCounter.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENMetrologyCounter.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENMETROLOGYCOUNTER.CODE FROM  ENMETROLOGYCOUNTER WHERE  ENMETROLOGYCOUNTER.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENMETROLOGYCOUNTER",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENMETROLOGYCOUNTER.CODE");
		_checkConditionToken(condition,"invnumber","ENMETROLOGYCOUNTER.INVNUMBER");
		_checkConditionToken(condition,"name","ENMETROLOGYCOUNTER.NAME");
		_checkConditionToken(condition,"buildnumber","ENMETROLOGYCOUNTER.BUILDNUMBER");
		_checkConditionToken(condition,"account","ENMETROLOGYCOUNTER.ACCOUNT");
		_checkConditionToken(condition,"departmetfkcode","ENMETROLOGYCOUNTER.DEPARTMETFKCODE");
		_checkConditionToken(condition,"molcode","ENMETROLOGYCOUNTER.MOLCODE");
		_checkConditionToken(condition,"datein","ENMETROLOGYCOUNTER.DATEIN");
		_checkConditionToken(condition,"datebuild","ENMETROLOGYCOUNTER.DATEBUILD");
		_checkConditionToken(condition,"cost","ENMETROLOGYCOUNTER.COST");
		_checkConditionToken(condition,"sccode","ENMETROLOGYCOUNTER.SCCODE");
		_checkConditionToken(condition,"countertype","ENMETROLOGYCOUNTER.COUNTERTYPE");
		_checkConditionToken(condition,"phasity","ENMETROLOGYCOUNTER.PHASITY");
		_checkConditionToken(condition,"zones","ENMETROLOGYCOUNTER.ZONES");
		_checkConditionToken(condition,"domain_info","ENMETROLOGYCOUNTER.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENMETROLOGYCOUNTER.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"zoneref","ZONEREFCODE");
		_checkConditionToken(condition,"zoneref.code","ZONEREFCODE");
		_checkConditionToken(condition,"accountingtyperef","ACCOUNTINGTYPEREFCODE");
		_checkConditionToken(condition,"accountingtyperef.code","ACCOUNTINGTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENMetrologyCounter anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENMETROLOGYCOUNTER", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENMETROLOGYCOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENMETROLOGYCOUNTER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENMETROLOGYCOUNTER");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENMetrologyCounterDAO
