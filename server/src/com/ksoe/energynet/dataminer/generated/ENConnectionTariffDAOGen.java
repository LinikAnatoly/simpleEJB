
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
import com.ksoe.energynet.valueobject.ENConnectionTariff;
import com.ksoe.energynet.valueobject.filter.ENConnectionTariffFilter;
import com.ksoe.energynet.valueobject.brief.ENConnectionTariffShort;
import com.ksoe.energynet.valueobject.lists.ENConnectionTariffShortList;


/**
 * DAO Object for ENConnectionTariff;
 *
 */

public class ENConnectionTariffDAOGen extends GenericDataMiner {

	public ENConnectionTariffDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENConnectionTariffDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENConnectionTariff inObject) throws PersistenceException {
		ENConnectionTariff obj = new ENConnectionTariff();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.shortname == null && obj.shortname == null){}
		else
			if(inObject.shortname == null || obj.shortname == null) return false;
			else
				if ( ! inObject.shortname.equals(obj.shortname)){
					return false;
				}

		if(inObject.userGen == null && obj.userGen == null){}
		else
			if(inObject.userGen == null || obj.userGen == null) return false;
			else
				if ( ! inObject.userGen.equals(obj.userGen)){
					return false;
				}
		if (inObject.levelRef.code != obj.levelRef.code){
			return false;
		}
		if (inObject.categoryRef.code != obj.categoryRef.code){
			return false;
		}
		if (inObject.powerPointRef.code != obj.powerPointRef.code){
			return false;
		}
		if (inObject.phasityRef.code != obj.phasityRef.code){
			return false;
		}
		if (inObject.lineTypeRef.code != obj.lineTypeRef.code){
			return false;
		}
		if (inObject.installationTypeRef.code != obj.installationTypeRef.code){
			return false;
		}
		if (inObject.locationTypeRef.code != obj.locationTypeRef.code){
			return false;
		}
		if (inObject.tarifTypeRef.code != obj.tarifTypeRef.code){
			return false;
		}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENConnectionTariff anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENConnectionTariff anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCONNECTIONTARIFF (CODE,NAME,SHORTNAME,USERGEN,MODIFY_TIME,LEVELREFCODE,CATEGORYREFCODE,POWERPOINTREFCODE,PHASITYREFCODE,LINETYPEREFCODE,INSTALLATIONTYPEREFCOD,LOCATIONTYPEREFCODE,TARIFTYPEREFCODE,DEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.name);
			statement.setString(3, anObject.shortname);
			statement.setString(4, anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(5, null);
			} else {
				statement.setBigDecimal(5, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.levelRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionLevelDAOGen(connection,getUserProfile()).exists(anObject.levelRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.levelRef.code%} = {%"+anObject.levelRef.code+"%}");
				}
				statement.setInt(6,anObject.levelRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.categoryRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPowerReliabilityCategoryDAOGen(connection,getUserProfile()).exists(anObject.categoryRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.categoryRef.code%} = {%"+anObject.categoryRef.code+"%}");
				}
				statement.setInt(7,anObject.categoryRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.powerPointRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionPowerPointDAOGen(connection,getUserProfile()).exists(anObject.powerPointRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.powerPointRef.code%} = {%"+anObject.powerPointRef.code+"%}");
				}
				statement.setInt(8,anObject.powerPointRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.phasityRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionPhasityDAOGen(connection,getUserProfile()).exists(anObject.phasityRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.phasityRef.code%} = {%"+anObject.phasityRef.code+"%}");
				}
				statement.setInt(9,anObject.phasityRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.lineTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionLineTypeDAOGen(connection,getUserProfile()).exists(anObject.lineTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.lineTypeRef.code%} = {%"+anObject.lineTypeRef.code+"%}");
				}
				statement.setInt(10,anObject.lineTypeRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.installationTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionInstallationTypeDAOGen(connection,getUserProfile()).exists(anObject.installationTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.installationTypeRef.code%} = {%"+anObject.installationTypeRef.code+"%}");
				}
				statement.setInt(11,anObject.installationTypeRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.locationTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionLocationTypeDAOGen(connection,getUserProfile()).exists(anObject.locationTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.locationTypeRef.code%} = {%"+anObject.locationTypeRef.code+"%}");
				}
				statement.setInt(12,anObject.locationTypeRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.tarifTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENConnectionTariffTypeDAOGen(connection,getUserProfile()).exists(anObject.tarifTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.tarifTypeRef.code%} = {%"+anObject.tarifTypeRef.code+"%}");
				}
				statement.setInt(13,anObject.tarifTypeRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENConnectionTariff.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(14,anObject.departmentRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENConnectionTariffDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENConnectionTariff anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENConnectionTariff anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENConnectionTariff oldObject = new ENConnectionTariff();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENConnectionTariff.modify_time_Field+" FROM  ENCONNECTIONTARIFF WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("SHORTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LEVELREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CATEGORYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWERPOINTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PHASITYREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LINETYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INSTALLATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("LOCATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TARIFTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCONNECTIONTARIFF SET  NAME = ? , SHORTNAME = ? , USERGEN = ? , MODIFY_TIME = ? , LEVELREFCODE = ? , CATEGORYREFCODE = ? , POWERPOINTREFCODE = ? , PHASITYREFCODE = ? , LINETYPEREFCODE = ? , INSTALLATIONTYPEREFCOD = ? , LOCATIONTYPEREFCODE = ? , TARIFTYPEREFCODE = ? , DEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCONNECTIONTARIFF SET ";
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
					statement.setString(1, anObject.name);
					statement.setString(2, anObject.shortname);
					statement.setString(3, anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(4, null);
					} else {
						statement.setBigDecimal(4, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.levelRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.levelRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.categoryRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.categoryRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.powerPointRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.powerPointRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.phasityRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.phasityRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.lineTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.lineTypeRef.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					if (anObject.installationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.installationTypeRef.code);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.locationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.locationTypeRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.tarifTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.tarifTypeRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.departmentRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setInt(14, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("SHORTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.shortname);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
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
						if("LEVELREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.levelRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.levelRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CATEGORYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.categoryRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.categoryRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("POWERPOINTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.powerPointRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.powerPointRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PHASITYREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.phasityRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.phasityRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("LINETYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.lineTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.lineTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("INSTALLATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.installationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.installationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("LOCATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.locationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.locationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TARIFTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.tarifTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.tarifTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.departmentRef.code);
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

	} // end of save(ENConnectionTariff anObject,String[] anAttributes)


	public ENConnectionTariffShort getShortObject(int anObjectCode) throws PersistenceException {
		ENConnectionTariff filterObject = new ENConnectionTariff();
		Vector<ENConnectionTariffShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENConnectionTariffShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENConnectionTariff filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.shortname, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.levelRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.categoryRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.powerPointRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.phasityRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.lineTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.installationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.locationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.tarifTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENConnectionTariffFilter filter) {
		String out = buildCondition((ENConnectionTariff)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENConnectionTariff filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENConnectionTariff.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENConnectionTariff.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.shortname, ENConnectionTariff.shortname_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENConnectionTariff.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENConnectionTariff.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.levelRef.code, ENConnectionTariff.levelRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.categoryRef.code, ENConnectionTariff.categoryRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.powerPointRef.code, ENConnectionTariff.powerPointRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.phasityRef.code, ENConnectionTariff.phasityRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.lineTypeRef.code, ENConnectionTariff.lineTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.installationTypeRef.code, ENConnectionTariff.installationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.locationTypeRef.code, ENConnectionTariff.locationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.tarifTypeRef.code, ENConnectionTariff.tarifTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENConnectionTariff.departmentRef_QFielld, out);
		}
		return out;
	}

	public ENConnectionTariffShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENConnectionTariffShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENConnectionTariffShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENConnectionTariffShortList getFilteredList(ENConnectionTariff filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariff aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariff aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENConnectionTariffShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariffFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariffFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENConnectionTariffShortList getScrollableFilteredList(ENConnectionTariff aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENConnectionTariffShortList result = new ENConnectionTariffShortList();
		ENConnectionTariffShort anObject;
		result.list = new Vector<ENConnectionTariffShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCONNECTIONTARIFF.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCONNECTIONTARIFF.CODE"+
			",ENCONNECTIONTARIFF.NAME"+
			",ENCONNECTIONTARIFF.SHORTNAME"+
			",ENCONNECTIONTARIFF.USERGEN"+
			", ENCONNECTIONLEVEL.CODE " +
			", ENCONNECTIONLEVEL.NAME " +
			", ENPOWERRELIABILITYCTGR.CODE " +
			", ENPOWERRELIABILITYCTGR.NAME " +
			", ENCONNECTIONPOWERPOINT.CODE " +
			", ENCONNECTIONPOWERPOINT.NAME " +
			", ENCONNECTIONPHASITY.CODE " +
			", ENCONNECTIONPHASITY.NAME " +
			", ENCONNECTIONLINETYPE.CODE " +
			", ENCONNECTIONLINETYPE.NAME " +
			", ENCONNECTIONINSTLLTNTP.CODE " +
			", ENCONNECTIONINSTLLTNTP.NAME " +
			", ENCONNECTIONLOCATIONTP.CODE " +
			", ENCONNECTIONLOCATIONTP.NAME " +
			", ENCONNECTIONTARIFFTYPE.CODE " +
			", ENCONNECTIONTARIFFTYPE.NAME " +
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
		" FROM ENCONNECTIONTARIFF " +
			" LEFT JOIN ENCONNECTIONLEVEL on ENCONNECTIONLEVEL.CODE = ENCONNECTIONTARIFF.LEVELREFCODE "+
			" LEFT JOIN ENPOWERRELIABILITYCTGR on ENPOWERRELIABILITYCTGR.CODE = ENCONNECTIONTARIFF.CATEGORYREFCODE "+
			" LEFT JOIN ENCONNECTIONPOWERPOINT on ENCONNECTIONPOWERPOINT.CODE = ENCONNECTIONTARIFF.POWERPOINTREFCODE "+
			" LEFT JOIN ENCONNECTIONPHASITY on ENCONNECTIONPHASITY.CODE = ENCONNECTIONTARIFF.PHASITYREFCODE "+
			" LEFT JOIN ENCONNECTIONLINETYPE on ENCONNECTIONLINETYPE.CODE = ENCONNECTIONTARIFF.LINETYPEREFCODE "+
			" LEFT JOIN ENCONNECTIONINSTLLTNTP on ENCONNECTIONINSTLLTNTP.CODE = ENCONNECTIONTARIFF.INSTALLATIONTYPEREFCOD "+
			" LEFT JOIN ENCONNECTIONLOCATIONTP on ENCONNECTIONLOCATIONTP.CODE = ENCONNECTIONTARIFF.LOCATIONTYPEREFCODE "+
			" LEFT JOIN ENCONNECTIONTARIFFTYPE on ENCONNECTIONTARIFFTYPE.CODE = ENCONNECTIONTARIFF.TARIFTYPEREFCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENCONNECTIONTARIFF.DEPARTMENTREFCODE "+
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
				anObject = new ENConnectionTariffShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.shortname = set.getString(3);
				anObject.userGen = set.getString(4);

				anObject.levelRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.levelRefCode = Integer.MIN_VALUE;
				}
				anObject.levelRefName = set.getString(6);
				anObject.categoryRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.categoryRefCode = Integer.MIN_VALUE;
				}
				anObject.categoryRefName = set.getString(8);
				anObject.powerPointRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.powerPointRefCode = Integer.MIN_VALUE;
				}
				anObject.powerPointRefName = set.getString(10);
				anObject.phasityRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.phasityRefCode = Integer.MIN_VALUE;
				}
				anObject.phasityRefName = set.getString(12);
				anObject.lineTypeRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.lineTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.lineTypeRefName = set.getString(14);
				anObject.installationTypeRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.installationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.installationTypeRefName = set.getString(16);
				anObject.locationTypeRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.locationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.locationTypeRefName = set.getString(18);
				anObject.tarifTypeRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.tarifTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.tarifTypeRefName = set.getString(20);
				anObject.departmentRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(22);
				anObject.departmentRefDateStart = set.getDate(23);
				anObject.departmentRefDateFinal = set.getDate(24);
				anObject.departmentRefRenCode = set.getInt(25);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(26);
				anObject.departmentRefKau_table_id_1884 = set.getInt(27);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(28);
				anObject.departmentRefName_1884 = set.getString(29);
				anObject.departmentRefHrmorganizationid = set.getString(30);

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
	
	public int[] getFilteredCodeArray(ENConnectionTariffFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENConnectionTariffFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENConnectionTariff aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCONNECTIONTARIFF.CODE FROM ENCONNECTIONTARIFF";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCONNECTIONTARIFF.CODE";
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


	public ENConnectionTariff getObject(int uid) throws PersistenceException {
		ENConnectionTariff result = new ENConnectionTariff();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENConnectionTariff anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENCONNECTIONTARIFF.CODE, ENCONNECTIONTARIFF.NAME, ENCONNECTIONTARIFF.SHORTNAME, ENCONNECTIONTARIFF.USERGEN, ENCONNECTIONTARIFF.MODIFY_TIME, ENCONNECTIONTARIFF.LEVELREFCODE, ENCONNECTIONTARIFF.CATEGORYREFCODE, ENCONNECTIONTARIFF.POWERPOINTREFCODE, ENCONNECTIONTARIFF.PHASITYREFCODE, ENCONNECTIONTARIFF.LINETYPEREFCODE, ENCONNECTIONTARIFF.INSTALLATIONTYPEREFCOD, ENCONNECTIONTARIFF.LOCATIONTYPEREFCODE, ENCONNECTIONTARIFF.TARIFTYPEREFCODE, ENCONNECTIONTARIFF.DEPARTMENTREFCODE "
			+" FROM ENCONNECTIONTARIFF WHERE ENCONNECTIONTARIFF.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.name = set.getString(2);
				anObject.shortname = set.getString(3);
				anObject.userGen = set.getString(4);
				anObject.modify_time = set.getLong(5);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.levelRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.levelRef.code = Integer.MIN_VALUE;
				}
				anObject.categoryRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.categoryRef.code = Integer.MIN_VALUE;
				}
				anObject.powerPointRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.powerPointRef.code = Integer.MIN_VALUE;
				}
				anObject.phasityRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.phasityRef.code = Integer.MIN_VALUE;
				}
				anObject.lineTypeRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.lineTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.installationTypeRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.installationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.locationTypeRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.locationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.tarifTypeRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.tarifTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENConnectionTariffRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENConnectionTariffRef ref = new com.ksoe.energynet.valueobject.references.ENConnectionTariffRef();
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

		selectStr = "DELETE FROM  ENCONNECTIONTARIFF WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENConnectionTariff object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENConnectionTariff.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENConnectionTariff.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENConnectionTariff.remove%} access denied");
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
	
	public long count(ENConnectionTariffFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENConnectionTariffFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENConnectionTariffFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCONNECTIONTARIFF", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENConnectionTariffFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCONNECTIONTARIFF");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENConnectionTariff.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENConnectionTariff.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCONNECTIONTARIFF.CODE FROM  ENCONNECTIONTARIFF WHERE  ENCONNECTIONTARIFF.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCONNECTIONTARIFF.CODE");
		_checkConditionToken(condition,"name","ENCONNECTIONTARIFF.NAME");
		_checkConditionToken(condition,"shortname","ENCONNECTIONTARIFF.SHORTNAME");
		_checkConditionToken(condition,"usergen","ENCONNECTIONTARIFF.USERGEN");
		_checkConditionToken(condition,"modify_time","ENCONNECTIONTARIFF.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"levelref","LEVELREFCODE");
		_checkConditionToken(condition,"levelref.code","LEVELREFCODE");
		_checkConditionToken(condition,"categoryref","CATEGORYREFCODE");
		_checkConditionToken(condition,"categoryref.code","CATEGORYREFCODE");
		_checkConditionToken(condition,"powerpointref","POWERPOINTREFCODE");
		_checkConditionToken(condition,"powerpointref.code","POWERPOINTREFCODE");
		_checkConditionToken(condition,"phasityref","PHASITYREFCODE");
		_checkConditionToken(condition,"phasityref.code","PHASITYREFCODE");
		_checkConditionToken(condition,"linetyperef","LINETYPEREFCODE");
		_checkConditionToken(condition,"linetyperef.code","LINETYPEREFCODE");
		_checkConditionToken(condition,"installationtyperef","INSTALLATIONTYPEREFCOD");
		_checkConditionToken(condition,"installationtyperef.code","INSTALLATIONTYPEREFCOD");
		_checkConditionToken(condition,"locationtyperef","LOCATIONTYPEREFCODE");
		_checkConditionToken(condition,"locationtyperef.code","LOCATIONTYPEREFCODE");
		_checkConditionToken(condition,"tariftyperef","TARIFTYPEREFCODE");
		_checkConditionToken(condition,"tariftyperef.code","TARIFTYPEREFCODE");
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENConnectionTariff anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCONNECTIONTARIFF", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCONNECTIONTARIFF", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCONNECTIONTARIFF", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCONNECTIONTARIFF");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENConnectionTariffDAO
