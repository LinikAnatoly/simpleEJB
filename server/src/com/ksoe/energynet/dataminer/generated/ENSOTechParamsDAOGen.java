
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
import com.ksoe.energynet.valueobject.ENSOTechParams;
import com.ksoe.energynet.valueobject.filter.ENSOTechParamsFilter;
import com.ksoe.energynet.valueobject.brief.ENSOTechParamsShort;
import com.ksoe.energynet.valueobject.lists.ENSOTechParamsShortList;


/**
 * DAO Object for ENSOTechParams;
 *
 */

public class ENSOTechParamsDAOGen extends GenericDataMiner {

	public ENSOTechParamsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSOTechParamsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSOTechParams inObject) throws PersistenceException {
		ENSOTechParams obj = new ENSOTechParams();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.closestDistance != obj.closestDistance){
					return false;
				}

		if(inObject.substationBuildSum == null && obj.substationBuildSum == null){}
		else
			if(inObject.substationBuildSum == null || obj.substationBuildSum == null) return false;
			else
				if ( ! inObject.substationBuildSum.equals(obj.substationBuildSum)){
					return false;
				}

		if(inObject.calculationSum == null && obj.calculationSum == null){}
		else
			if(inObject.calculationSum == null || obj.calculationSum == null) return false;
			else
				if ( ! inObject.calculationSum.equals(obj.calculationSum)){
					return false;
				}

		if (inObject.closestDistance2 != obj.closestDistance2){
					return false;
				}

		if (inObject.infoDistance2 != obj.infoDistance2){
					return false;
				}

		if(inObject.object4closestDistanceName == null && obj.object4closestDistanceName == null){}
		else
			if(inObject.object4closestDistanceName == null || obj.object4closestDistanceName == null) return false;
			else
				if ( ! inObject.object4closestDistanceName.equals(obj.object4closestDistanceName)){
					return false;
				}

		if(inObject.object4closestDistance2Name == null && obj.object4closestDistance2Name == null){}
		else
			if(inObject.object4closestDistance2Name == null || obj.object4closestDistance2Name == null) return false;
			else
				if ( ! inObject.object4closestDistance2Name.equals(obj.object4closestDistance2Name)){
					return false;
				}

		if(inObject.cityTypeName == null && obj.cityTypeName == null){}
		else
			if(inObject.cityTypeName == null || obj.cityTypeName == null) return false;
			else
				if ( ! inObject.cityTypeName.equals(obj.cityTypeName)){
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
		if (inObject.cityTypeRef.code != obj.cityTypeRef.code){
			return false;
		}
		if (inObject.servicesobject.code != obj.servicesobject.code){
			return false;
		}
		return true;
	}

	public int add(ENSOTechParams anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSOTechParams anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSOTECHPARAMS (CODE,CLOSESTDISTANCE,SUBSTATIONBUILDSUM,CALCULATIONSUM,CLOSESTDISTANCE2,INFODISTANCE2,OBJECT4CLOSESTDISTNCNM,OBJECT4CLOSESTDSTNC2NM,CITYTYPENAME,USERGEN,MODIFY_TIME,LEVELREFCODE,CATEGORYREFCODE,POWERPOINTREFCODE,PHASITYREFCODE,LINETYPEREFCODE,INSTALLATIONTYPEREFCOD,LOCATIONTYPEREFCODE,CITYTYPEREFCODE,SERVICESOBJECTCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.closestDistance != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.closestDistance);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			if (anObject.substationBuildSum != null) {
				anObject.substationBuildSum = anObject.substationBuildSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3, anObject.substationBuildSum);
			if (anObject.calculationSum != null) {
				anObject.calculationSum = anObject.calculationSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.calculationSum);
			if (anObject.closestDistance2 != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.closestDistance2);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			if (anObject.infoDistance2 != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.infoDistance2);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			statement.setString(7, anObject.object4closestDistanceName);
			statement.setString(8, anObject.object4closestDistance2Name);
			statement.setString(9, anObject.cityTypeName);
			statement.setString(10, anObject.userGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(11, null);
			} else {
				statement.setBigDecimal(11, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.levelRef.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.levelRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.categoryRef.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.categoryRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.powerPointRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.powerPointRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.phasityRef.code != Integer.MIN_VALUE){
				statement.setInt(15,anObject.phasityRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.lineTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(16,anObject.lineTypeRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.installationTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(17,anObject.installationTypeRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}
			if (anObject.locationTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(18,anObject.locationTypeRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.cityTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(19,anObject.cityTypeRef.code);
			} else {
				statement.setNull(19,java.sql.Types.INTEGER);
			}
			if (anObject.servicesobject.code != Integer.MIN_VALUE){
				statement.setInt(20,anObject.servicesobject.code);
			} else {
				statement.setNull(20,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENSOTechParamsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSOTechParams anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSOTechParams anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSOTechParams oldObject = new ENSOTechParams();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSOTechParams.modify_time_Field+" FROM  ENSOTECHPARAMS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CLOSESTDISTANCE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SUBSTATIONBUILDSUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CALCULATIONSUM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLOSESTDISTANCE2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INFODISTANCE2") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECT4CLOSESTDISTANCENAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OBJECT4CLOSESTDISTANCE2NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CITYTYPENAME") == 0) {
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
					if(fieldNameStr.compareTo("CITYTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SERVICESOBJECT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSOTECHPARAMS SET  CLOSESTDISTANCE = ? , SUBSTATIONBUILDSUM = ? , CALCULATIONSUM = ? , CLOSESTDISTANCE2 = ? , INFODISTANCE2 = ? , OBJECT4CLOSESTDISTNCNM = ? , OBJECT4CLOSESTDSTNC2NM = ? , CITYTYPENAME = ? , USERGEN = ? , MODIFY_TIME = ? , LEVELREFCODE = ? , CATEGORYREFCODE = ? , POWERPOINTREFCODE = ? , PHASITYREFCODE = ? , LINETYPEREFCODE = ? , INSTALLATIONTYPEREFCOD = ? , LOCATIONTYPEREFCODE = ? , CITYTYPEREFCODE = ? , SERVICESOBJECTCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSOTECHPARAMS SET ";
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
					if (anObject.closestDistance != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.closestDistance);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					if (anObject.substationBuildSum != null) {
						anObject.substationBuildSum = anObject.substationBuildSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2, anObject.substationBuildSum);
					if (anObject.calculationSum != null) {
						anObject.calculationSum = anObject.calculationSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.calculationSum);
					if (anObject.closestDistance2 != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.closestDistance2);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.infoDistance2 != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.infoDistance2);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					statement.setString(6, anObject.object4closestDistanceName);
					statement.setString(7, anObject.object4closestDistance2Name);
					statement.setString(8, anObject.cityTypeName);
					statement.setString(9, anObject.userGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(10, null);
					} else {
						statement.setBigDecimal(10, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.levelRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.levelRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					if (anObject.categoryRef.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.categoryRef.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.powerPointRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.powerPointRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.phasityRef.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.phasityRef.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.lineTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.lineTypeRef.code);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					if (anObject.installationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.installationTypeRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					if (anObject.locationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(17, anObject.locationTypeRef.code);
					} else {
						statement.setNull(17, java.sql.Types.INTEGER);
					}
					if (anObject.cityTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.cityTypeRef.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					if (anObject.servicesobject.code != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.servicesobject.code);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					statement.setInt(20, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CLOSESTDISTANCE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.closestDistance);
							continue;
						}
						if("SUBSTATIONBUILDSUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.substationBuildSum != null) {
								anObject.substationBuildSum = anObject.substationBuildSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.substationBuildSum);
							continue;
						}
						if("CALCULATIONSUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.calculationSum != null) {
								anObject.calculationSum = anObject.calculationSum.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.calculationSum);
							continue;
						}
						if("CLOSESTDISTANCE2".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.closestDistance2);
							continue;
						}
						if("INFODISTANCE2".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.infoDistance2);
							continue;
						}
						if("OBJECT4CLOSESTDISTANCENAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.object4closestDistanceName);
							continue;
						}
						if("OBJECT4CLOSESTDISTANCE2NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.object4closestDistance2Name);
							continue;
						}
						if("CITYTYPENAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.cityTypeName);
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
						if("CITYTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.cityTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.cityTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("SERVICESOBJECT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.servicesobject.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.servicesobject.code);
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

	} // end of save(ENSOTechParams anObject,String[] anAttributes)


	public ENSOTechParamsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSOTechParams filterObject = new ENSOTechParams();
		Vector<ENSOTechParamsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSOTechParamsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSOTechParams filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.closestDistance, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.substationBuildSum, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.calculationSum, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.closestDistance2, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.infoDistance2, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.object4closestDistanceName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.object4closestDistance2Name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.cityTypeName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.levelRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.categoryRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.powerPointRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.phasityRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.lineTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.installationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.locationTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cityTypeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.servicesobject.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSOTechParamsFilter filter) {
		String out = buildCondition((ENSOTechParams)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSOTechParams filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSOTechParams.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.closestDistance, ENSOTechParams.closestDistance_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.substationBuildSum, ENSOTechParams.substationBuildSum_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.calculationSum, ENSOTechParams.calculationSum_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.closestDistance2, ENSOTechParams.closestDistance2_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.infoDistance2, ENSOTechParams.infoDistance2_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.object4closestDistanceName, ENSOTechParams.object4closestDistanceName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.object4closestDistance2Name, ENSOTechParams.object4closestDistance2Name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.cityTypeName, ENSOTechParams.cityTypeName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENSOTechParams.userGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSOTechParams.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.levelRef.code, ENSOTechParams.levelRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.categoryRef.code, ENSOTechParams.categoryRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.powerPointRef.code, ENSOTechParams.powerPointRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.phasityRef.code, ENSOTechParams.phasityRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.lineTypeRef.code, ENSOTechParams.lineTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.installationTypeRef.code, ENSOTechParams.installationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.locationTypeRef.code, ENSOTechParams.locationTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cityTypeRef.code, ENSOTechParams.cityTypeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.servicesobject.code, ENSOTechParams.servicesobject_QFielld, out);
		}
		return out;
	}

	public ENSOTechParamsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSOTechParamsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSOTechParamsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSOTechParamsShortList getFilteredList(ENSOTechParams filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSOTechParamsShortList getScrollableFilteredList(ENSOTechParams aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSOTechParamsShortList getScrollableFilteredList(ENSOTechParams aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSOTechParamsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSOTechParamsShortList getScrollableFilteredList(ENSOTechParamsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSOTechParamsShortList getScrollableFilteredList(ENSOTechParamsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSOTechParamsShortList getScrollableFilteredList(ENSOTechParams aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSOTechParamsShortList result = new ENSOTechParamsShortList();
		ENSOTechParamsShort anObject;
		result.list = new Vector<ENSOTechParamsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOTECHPARAMS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSOTECHPARAMS.CODE"+
			",ENSOTECHPARAMS.CLOSESTDISTANCE"+
			",ENSOTECHPARAMS.SUBSTATIONBUILDSUM"+
			",ENSOTECHPARAMS.CALCULATIONSUM"+
			",ENSOTECHPARAMS.CLOSESTDISTANCE2"+
			",ENSOTECHPARAMS.INFODISTANCE2"+
			",ENSOTECHPARAMS.OBJECT4CLOSESTDISTNCNM"+
			",ENSOTECHPARAMS.OBJECT4CLOSESTDSTNC2NM"+
			",ENSOTECHPARAMS.CITYTYPENAME"+
			",ENSOTECHPARAMS.USERGEN"+
			", ENCONNECTIONLEVEL.CODE " +
			", ENCONNECTIONLEVEL.NAME " +
			", ENPOWERRELIABILITYCTGR.CODE " +
			", ENPOWERRELIABILITYCTGR.NAME " +
			", ENPOWERRELIABILITYCTGR.COEF " +
			", ENCONNECTIONPOWERPOINT.CODE " +
			", ENCONNECTIONPOWERPOINT.NAME " +
			", ENCONNECTIONPOWERPOINT.COEF " +
			", ENCONNECTIONPHASITY.CODE " +
			", ENCONNECTIONPHASITY.NAME " +
			", ENCONNECTIONLINETYPE.CODE " +
			", ENCONNECTIONLINETYPE.NAME " +
			", ENCONNECTIONINSTLLTNTP.CODE " +
			", ENCONNECTIONINSTLLTNTP.NAME " +
			", ENCONNECTIONINSTLLTNTP.COEF " +
			", ENCONNECTIONLOCATIONTP.CODE " +
			", ENCONNECTIONLOCATIONTP.NAME " +
			", ENCONNECTIONCITYTYPE.CODE " +
			", ENCONNECTIONCITYTYPE.NAME " +
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
			", ENSERVICESOBJECT.TERM " +
			", ENSERVICESOBJECT.REGULATION " +
			", ENSERVICESOBJECT.BOUNDARYDATEWORK " +
			", ENSERVICESOBJECT.COUNTDAYDELAY " +
			", ENSERVICESOBJECT.FACTDATEWORK " +
			", ENSERVICESOBJECT.CODEEIC " +
			", ENSERVICESOBJECT.PERSONALACCOUNTUID " +
			", ENSERVICESOBJECT.CUSTOMERMAILINGADDRESS " +
			", ENSERVICESOBJECT.POWERGENERATION " +
			", ENSERVICESOBJECT.POSTCODE " +
			", ENSERVICESOBJECT.CUSTOMEREMAIL " +
		" FROM ENSOTECHPARAMS " +
			" LEFT JOIN ENCONNECTIONLEVEL on ENCONNECTIONLEVEL.CODE = ENSOTECHPARAMS.LEVELREFCODE "+
			" LEFT JOIN ENPOWERRELIABILITYCTGR on ENPOWERRELIABILITYCTGR.CODE = ENSOTECHPARAMS.CATEGORYREFCODE "+
			" LEFT JOIN ENCONNECTIONPOWERPOINT on ENCONNECTIONPOWERPOINT.CODE = ENSOTECHPARAMS.POWERPOINTREFCODE "+
			" LEFT JOIN ENCONNECTIONPHASITY on ENCONNECTIONPHASITY.CODE = ENSOTECHPARAMS.PHASITYREFCODE "+
			" LEFT JOIN ENCONNECTIONLINETYPE on ENCONNECTIONLINETYPE.CODE = ENSOTECHPARAMS.LINETYPEREFCODE "+
			" LEFT JOIN ENCONNECTIONINSTLLTNTP on ENCONNECTIONINSTLLTNTP.CODE = ENSOTECHPARAMS.INSTALLATIONTYPEREFCOD "+
			" LEFT JOIN ENCONNECTIONLOCATIONTP on ENCONNECTIONLOCATIONTP.CODE = ENSOTECHPARAMS.LOCATIONTYPEREFCODE "+
			" LEFT JOIN ENCONNECTIONCITYTYPE on ENCONNECTIONCITYTYPE.CODE = ENSOTECHPARAMS.CITYTYPEREFCODE "+
			" LEFT JOIN ENSERVICESOBJECT on ENSERVICESOBJECT.CODE = ENSOTECHPARAMS.SERVICESOBJECTCODE "+
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
				anObject = new ENSOTechParamsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.closestDistance = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.closestDistance = Integer.MIN_VALUE;
				}
				anObject.substationBuildSum = set.getBigDecimal(3);
				if(anObject.substationBuildSum != null) {
					anObject.substationBuildSum = anObject.substationBuildSum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calculationSum = set.getBigDecimal(4);
				if(anObject.calculationSum != null) {
					anObject.calculationSum = anObject.calculationSum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.closestDistance2 = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.closestDistance2 = Integer.MIN_VALUE;
				}
				anObject.infoDistance2 = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.infoDistance2 = Integer.MIN_VALUE;
				}
				anObject.object4closestDistanceName = set.getString(7);
				anObject.object4closestDistance2Name = set.getString(8);
				anObject.cityTypeName = set.getString(9);
				anObject.userGen = set.getString(10);

				anObject.levelRefCode = set.getInt(11);
				if(set.wasNull()) {
					anObject.levelRefCode = Integer.MIN_VALUE;
				}
				anObject.levelRefName = set.getString(12);
				anObject.categoryRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.categoryRefCode = Integer.MIN_VALUE;
				}
				anObject.categoryRefName = set.getString(14);
				anObject.categoryRefCoef = set.getBigDecimal(15);
				if(anObject.categoryRefCoef != null) {
					anObject.categoryRefCoef = anObject.categoryRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.powerPointRefCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.powerPointRefCode = Integer.MIN_VALUE;
				}
				anObject.powerPointRefName = set.getString(17);
				anObject.powerPointRefCoef = set.getBigDecimal(18);
				if(anObject.powerPointRefCoef != null) {
					anObject.powerPointRefCoef = anObject.powerPointRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phasityRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.phasityRefCode = Integer.MIN_VALUE;
				}
				anObject.phasityRefName = set.getString(20);
				anObject.lineTypeRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.lineTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.lineTypeRefName = set.getString(22);
				anObject.installationTypeRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.installationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.installationTypeRefName = set.getString(24);
				anObject.installationTypeRefCoef = set.getBigDecimal(25);
				if(anObject.installationTypeRefCoef != null) {
					anObject.installationTypeRefCoef = anObject.installationTypeRefCoef.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.locationTypeRefCode = set.getInt(26);
				if(set.wasNull()) {
					anObject.locationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.locationTypeRefName = set.getString(27);
				anObject.cityTypeRefCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.cityTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.cityTypeRefName = set.getString(29);
				anObject.servicesobjectCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.servicesobjectCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectContractNumber = set.getString(31);
				anObject.servicesobjectContractDate = set.getDate(32);
				anObject.servicesobjectName = set.getString(33);
				anObject.servicesobjectPartnerCode = set.getString(34);
				anObject.servicesobjectFinDocCode = set.getString(35);
				anObject.servicesobjectFinDocID = set.getInt(36);
				if(set.wasNull()) {
					anObject.servicesobjectFinDocID = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCommentGen = set.getString(37);
				anObject.servicesobjectContractNumberServices = set.getString(38);
				anObject.servicesobjectContractDateServices = set.getDate(39);
				anObject.servicesobjectContragentName = set.getString(40);
				anObject.servicesobjectContragentAddress = set.getString(41);
				anObject.servicesobjectContragentAddressWork = set.getString(42);
				anObject.servicesobjectContragentOkpo = set.getString(43);
				anObject.servicesobjectContragentBankAccount = set.getString(44);
				anObject.servicesobjectContragentBankName = set.getString(45);
				anObject.servicesobjectContragentBankMfo = set.getString(46);
				anObject.servicesobjectContragentBossName = set.getString(47);
				anObject.servicesobjectContragentPassport = set.getString(48);
				anObject.servicesobjectContractServicesSumma = set.getBigDecimal(49);
				if(anObject.servicesobjectContractServicesSumma != null) {
					anObject.servicesobjectContractServicesSumma = anObject.servicesobjectContractServicesSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesSummaVAT = set.getBigDecimal(50);
				if(anObject.servicesobjectContractServicesSummaVAT != null) {
					anObject.servicesobjectContractServicesSummaVAT = anObject.servicesobjectContractServicesSummaVAT.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesPower = set.getBigDecimal(51);
				if(anObject.servicesobjectContractServicesPower != null) {
					anObject.servicesobjectContractServicesPower = anObject.servicesobjectContractServicesPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCommentServicesGen = set.getString(52);
				anObject.servicesobjectContractServicesDistance = set.getBigDecimal(53);
				if(anObject.servicesobjectContractServicesDistance != null) {
					anObject.servicesobjectContractServicesDistance = anObject.servicesobjectContractServicesDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContractServicesDay = set.getBigDecimal(54);
				if(anObject.servicesobjectContractServicesDay != null) {
					anObject.servicesobjectContractServicesDay = anObject.servicesobjectContractServicesDay.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectUserGen = set.getString(55);
				anObject.servicesobjectDateEdit = set.getDate(56);
				anObject.servicesobjectWarrantDate = set.getDate(57);
				anObject.servicesobjectWarrantNumber = set.getString(58);
				anObject.servicesobjectWarrantFIO = set.getString(59);
				anObject.servicesobjectRegionalType = set.getInt(60);
				if(set.wasNull()) {
					anObject.servicesobjectRegionalType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBasisType = set.getBigDecimal(61);
				if(anObject.servicesobjectBasisType != null) {
					anObject.servicesobjectBasisType = anObject.servicesobjectBasisType.setScale(0,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectContragentPosition = set.getString(62);
				anObject.servicesobjectExecuteWorkDate = set.getDate(63);
				anObject.servicesobjectTimeStart = set.getTimestamp(64);
				anObject.servicesobjectTimeFinal = set.getTimestamp(65);
				anObject.servicesobjectContragentPhoneNumber = set.getString(66);
				anObject.servicesobjectExecutorPhoneNumber = set.getString(67);
				anObject.servicesobjectContragentObjectWork = set.getString(68);
				anObject.servicesobjectIsNoPay = set.getInt(69);
				if(set.wasNull()) {
					anObject.servicesobjectIsNoPay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectIsCustomerMaterials = set.getInt(70);
				if(set.wasNull()) {
					anObject.servicesobjectIsCustomerMaterials = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDate = set.getDate(71);
				anObject.servicesobjectFinPayFormCode = set.getInt(72);
				if(set.wasNull()) {
					anObject.servicesobjectFinPayFormCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFinPayFormName = set.getString(73);
				anObject.servicesobjectPartnerId = set.getInt(74);
				if(set.wasNull()) {
					anObject.servicesobjectPartnerId = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPayDetail = set.getString(75);
				anObject.servicesobjectActTransferNumber = set.getString(76);
				anObject.servicesobjectActTransferDate = set.getDate(77);
				anObject.servicesobjectResposible = set.getString(78);
				anObject.servicesobjectResposiblePosition = set.getString(79);
				anObject.servicesobjectResposibleTabNumber = set.getString(80);
				anObject.servicesobjectPrevContractStatus = set.getInt(81);
				if(set.wasNull()) {
					anObject.servicesobjectPrevContractStatus = Integer.MIN_VALUE;
				}
				anObject.servicesobjectReconnectionTU = set.getInt(82);
				if(set.wasNull()) {
					anObject.servicesobjectReconnectionTU = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountCode = set.getInt(83);
				if(set.wasNull()) {
					anObject.servicesobjectPersonalAccountCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectPersonalAccountNumber = set.getString(84);
				anObject.servicesobjectTabNumber = set.getString(85);
				anObject.servicesobjectCitiesList = set.getString(86);
				anObject.servicesobjectLineLength = set.getBigDecimal(87);
				if(anObject.servicesobjectLineLength != null) {
					anObject.servicesobjectLineLength = anObject.servicesobjectLineLength.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectProjectCode = set.getString(88);
				anObject.servicesobjectCnPackCode = set.getInt(89);
				if(set.wasNull()) {
					anObject.servicesobjectCnPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectDfPackCode = set.getInt(90);
				if(set.wasNull()) {
					anObject.servicesobjectDfPackCode = Integer.MIN_VALUE;
				}
				anObject.servicesobjectCountersZoneType = set.getInt(91);
				if(set.wasNull()) {
					anObject.servicesobjectCountersZoneType = Integer.MIN_VALUE;
				}
				anObject.servicesobjectAxPartnerCode = set.getString(92);
				anObject.servicesobjectAxPartnerName = set.getString(93);
				anObject.servicesobjectAxContractNumber = set.getString(94);
				anObject.servicesobjectAxContractDate = set.getDate(95);
				anObject.servicesobjectAxContractCode = set.getString(96);
				anObject.servicesobjectAxContractId = set.getString(97);
				anObject.servicesobjectAxContractCommentGen = set.getString(98);
				anObject.servicesobjectProjAgreeSumma = set.getBigDecimal(99);
				if(anObject.servicesobjectProjAgreeSumma != null) {
					anObject.servicesobjectProjAgreeSumma = anObject.servicesobjectProjAgreeSumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectTopographySumma = set.getBigDecimal(100);
				if(anObject.servicesobjectTopographySumma != null) {
					anObject.servicesobjectTopographySumma = anObject.servicesobjectTopographySumma.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectCreatedFromSite = set.getInt(101);
				if(set.wasNull()) {
					anObject.servicesobjectCreatedFromSite = Integer.MIN_VALUE;
				}
				anObject.servicesobjectTerm = set.getInt(102);
				if(set.wasNull()) {
					anObject.servicesobjectTerm = Integer.MIN_VALUE;
				}
				anObject.servicesobjectRegulation = set.getInt(103);
				if(set.wasNull()) {
					anObject.servicesobjectRegulation = Integer.MIN_VALUE;
				}
				anObject.servicesobjectBoundaryDateWork = set.getDate(104);
				anObject.servicesobjectCountDayDelay = set.getInt(105);
				if(set.wasNull()) {
					anObject.servicesobjectCountDayDelay = Integer.MIN_VALUE;
				}
				anObject.servicesobjectFactDateWork = set.getDate(106);
				anObject.servicesobjectCodeEIC = set.getString(107);
				anObject.servicesobjectPersonalAccountUid = set.getString(108);
				anObject.servicesobjectCustomerMailingAddress = set.getString(109);
				anObject.servicesobjectPowerGeneration = set.getBigDecimal(110);
				if(anObject.servicesobjectPowerGeneration != null) {
					anObject.servicesobjectPowerGeneration = anObject.servicesobjectPowerGeneration.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesobjectPostCode = set.getString(111);
				anObject.servicesobjectCustomerEmail = set.getString(112);

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
	
	public int[] getFilteredCodeArray(ENSOTechParamsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSOTechParamsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSOTechParams aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSOTECHPARAMS.CODE FROM ENSOTECHPARAMS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSOTECHPARAMS.CODE";
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


	public ENSOTechParams getObject(int uid) throws PersistenceException {
		ENSOTechParams result = new ENSOTechParams();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSOTechParams anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSOTECHPARAMS.CODE, ENSOTECHPARAMS.CLOSESTDISTANCE, ENSOTECHPARAMS.SUBSTATIONBUILDSUM, ENSOTECHPARAMS.CALCULATIONSUM, ENSOTECHPARAMS.CLOSESTDISTANCE2, ENSOTECHPARAMS.INFODISTANCE2, ENSOTECHPARAMS.OBJECT4CLOSESTDISTNCNM, ENSOTECHPARAMS.OBJECT4CLOSESTDSTNC2NM, ENSOTECHPARAMS.CITYTYPENAME, ENSOTECHPARAMS.USERGEN, ENSOTECHPARAMS.MODIFY_TIME, ENSOTECHPARAMS.LEVELREFCODE, ENSOTECHPARAMS.CATEGORYREFCODE, ENSOTECHPARAMS.POWERPOINTREFCODE, ENSOTECHPARAMS.PHASITYREFCODE, ENSOTECHPARAMS.LINETYPEREFCODE, ENSOTECHPARAMS.INSTALLATIONTYPEREFCOD, ENSOTECHPARAMS.LOCATIONTYPEREFCODE, ENSOTECHPARAMS.CITYTYPEREFCODE, ENSOTECHPARAMS.SERVICESOBJECTCODE "
			+" FROM ENSOTECHPARAMS WHERE ENSOTECHPARAMS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.closestDistance = set.getInt(2);
				if (set.wasNull()) {
					anObject.closestDistance = Integer.MIN_VALUE;
				}
				anObject.substationBuildSum = set.getBigDecimal(3);
				if(anObject.substationBuildSum != null) {
					anObject.substationBuildSum = anObject.substationBuildSum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calculationSum = set.getBigDecimal(4);
				if(anObject.calculationSum != null) {
					anObject.calculationSum = anObject.calculationSum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.closestDistance2 = set.getInt(5);
				if (set.wasNull()) {
					anObject.closestDistance2 = Integer.MIN_VALUE;
				}
				anObject.infoDistance2 = set.getInt(6);
				if (set.wasNull()) {
					anObject.infoDistance2 = Integer.MIN_VALUE;
				}
				anObject.object4closestDistanceName = set.getString(7);
				anObject.object4closestDistance2Name = set.getString(8);
				anObject.cityTypeName = set.getString(9);
				anObject.userGen = set.getString(10);
				anObject.modify_time = set.getLong(11);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.levelRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.levelRef.code = Integer.MIN_VALUE;
				}
				anObject.categoryRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.categoryRef.code = Integer.MIN_VALUE;
				}
				anObject.powerPointRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.powerPointRef.code = Integer.MIN_VALUE;
				}
				anObject.phasityRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.phasityRef.code = Integer.MIN_VALUE;
				}
				anObject.lineTypeRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.lineTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.installationTypeRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.installationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.locationTypeRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.locationTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.cityTypeRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.cityTypeRef.code = Integer.MIN_VALUE;
				}
				anObject.servicesobject.code = set.getInt(20);
				if (set.wasNull()) {
					anObject.servicesobject.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSOTechParamsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSOTechParamsRef ref = new com.ksoe.energynet.valueobject.references.ENSOTechParamsRef();
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

		selectStr = "DELETE FROM  ENSOTECHPARAMS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSOTechParams object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSOTechParams.getObject%} access denied");
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
	
	public long count(ENSOTechParamsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSOTechParamsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSOTechParamsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSOTECHPARAMS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENSOTECHPARAMS WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSOTechParamsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSOTechParamsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSOTECHPARAMS");
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
			"SELECT  ENSOTECHPARAMS.CODE FROM  ENSOTECHPARAMS WHERE  ENSOTECHPARAMS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSOTECHPARAMS.CODE");
		_checkConditionToken(condition,"closestdistance","ENSOTECHPARAMS.CLOSESTDISTANCE");
		_checkConditionToken(condition,"substationbuildsum","ENSOTECHPARAMS.SUBSTATIONBUILDSUM");
		_checkConditionToken(condition,"calculationsum","ENSOTECHPARAMS.CALCULATIONSUM");
		_checkConditionToken(condition,"closestdistance2","ENSOTECHPARAMS.CLOSESTDISTANCE2");
		_checkConditionToken(condition,"infodistance2","ENSOTECHPARAMS.INFODISTANCE2");
		_checkConditionToken(condition,"object4closestdistancename","ENSOTECHPARAMS.OBJECT4CLOSESTDISTNCNM");
		_checkConditionToken(condition,"object4closestdistance2name","ENSOTECHPARAMS.OBJECT4CLOSESTDSTNC2NM");
		_checkConditionToken(condition,"citytypename","ENSOTECHPARAMS.CITYTYPENAME");
		_checkConditionToken(condition,"usergen","ENSOTECHPARAMS.USERGEN");
		_checkConditionToken(condition,"modify_time","ENSOTECHPARAMS.MODIFY_TIME");
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
		_checkConditionToken(condition,"citytyperef","CITYTYPEREFCODE");
		_checkConditionToken(condition,"citytyperef.code","CITYTYPEREFCODE");
		_checkConditionToken(condition,"servicesobject","SERVICESOBJECTCODE");
		_checkConditionToken(condition,"servicesobject.code","SERVICESOBJECTCODE");
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
	
	private void _collectAutoIncrementFields(ENSOTechParams anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSOTECHPARAMS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSOTECHPARAMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSOTECHPARAMS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSOTECHPARAMS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSOTechParamsDAO
