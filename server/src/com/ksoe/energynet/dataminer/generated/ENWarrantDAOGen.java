
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
import com.ksoe.energynet.valueobject.ENWarrant;
import com.ksoe.energynet.valueobject.filter.ENWarrantFilter;
import com.ksoe.energynet.valueobject.brief.ENWarrantShort;
import com.ksoe.energynet.valueobject.lists.ENWarrantShortList;


/**
 * DAO Object for ENWarrant;
 *
 */

public class ENWarrantDAOGen extends GenericDataMiner {

	public ENWarrantDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENWarrantDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENWarrant inObject) throws PersistenceException {
		ENWarrant obj = new ENWarrant();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numbergen == null && obj.numbergen == null){}
		else
			if(inObject.numbergen == null || obj.numbergen == null) return false;
			else
				if ( ! inObject.numbergen.equals(obj.numbergen)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
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

		if(inObject.warrantFIO == null && obj.warrantFIO == null){}
		else
			if(inObject.warrantFIO == null || obj.warrantFIO == null) return false;
			else
				if ( ! inObject.warrantFIO.equals(obj.warrantFIO)){
					return false;
				}

		if(inObject.warrantShortFIO == null && obj.warrantShortFIO == null){}
		else
			if(inObject.warrantShortFIO == null || obj.warrantShortFIO == null) return false;
			else
				if ( ! inObject.warrantShortFIO.equals(obj.warrantShortFIO)){
					return false;
				}

		if(inObject.warrantPosition == null && obj.warrantPosition == null){}
		else
			if(inObject.warrantPosition == null || obj.warrantPosition == null) return false;
			else
				if ( ! inObject.warrantPosition.equals(obj.warrantPosition)){
					return false;
				}

		if(inObject.genitiveFIO == null && obj.genitiveFIO == null){}
		else
			if(inObject.genitiveFIO == null || obj.genitiveFIO == null) return false;
			else
				if ( ! inObject.genitiveFIO.equals(obj.genitiveFIO)){
					return false;
				}

		if(inObject.genitivePosition == null && obj.genitivePosition == null){}
		else
			if(inObject.genitivePosition == null || obj.genitivePosition == null) return false;
			else
				if ( ! inObject.genitivePosition.equals(obj.genitivePosition)){
					return false;
				}

		if(inObject.personSurname == null && obj.personSurname == null){}
		else
			if(inObject.personSurname == null || obj.personSurname == null) return false;
			else
				if ( ! inObject.personSurname.equals(obj.personSurname)){
					return false;
				}

		if(inObject.personSurnameGenitive == null && obj.personSurnameGenitive == null){}
		else
			if(inObject.personSurnameGenitive == null || obj.personSurnameGenitive == null) return false;
			else
				if ( ! inObject.personSurnameGenitive.equals(obj.personSurnameGenitive)){
					return false;
				}

		if(inObject.personName == null && obj.personName == null){}
		else
			if(inObject.personName == null || obj.personName == null) return false;
			else
				if ( ! inObject.personName.equals(obj.personName)){
					return false;
				}

		if(inObject.personNameGenitive == null && obj.personNameGenitive == null){}
		else
			if(inObject.personNameGenitive == null || obj.personNameGenitive == null) return false;
			else
				if ( ! inObject.personNameGenitive.equals(obj.personNameGenitive)){
					return false;
				}

		if(inObject.personPatronimic == null && obj.personPatronimic == null){}
		else
			if(inObject.personPatronimic == null || obj.personPatronimic == null) return false;
			else
				if ( ! inObject.personPatronimic.equals(obj.personPatronimic)){
					return false;
				}

		if(inObject.personPatronimicGenitive == null && obj.personPatronimicGenitive == null){}
		else
			if(inObject.personPatronimicGenitive == null || obj.personPatronimicGenitive == null) return false;
			else
				if ( ! inObject.personPatronimicGenitive.equals(obj.personPatronimicGenitive)){
					return false;
				}

		if(inObject.passport == null && obj.passport == null){}
		else
			if(inObject.passport == null || obj.passport == null) return false;
			else
				if ( ! inObject.passport.equals(obj.passport)){
					return false;
				}

		if(inObject.address == null && obj.address == null){}
		else
			if(inObject.address == null || obj.address == null) return false;
			else
				if ( ! inObject.address.equals(obj.address)){
					return false;
				}

		if(inObject.dateGen == null && obj.dateGen == null){} else 
			if(inObject.dateGen == null || obj.dateGen == null) return false;
			else
				if (inObject.dateGen.compareTo(obj.dateGen) != 0){
					return false;
				}

		if (inObject.power != obj.power){
					return false;
				}

		if(inObject.maxSum == null && obj.maxSum == null){}
		else
			if(inObject.maxSum == null || obj.maxSum == null) return false;
			else
				if ( ! inObject.maxSum.equals(obj.maxSum)){
					return false;
				}

		if(inObject.departmentName == null && obj.departmentName == null){}
		else
			if(inObject.departmentName == null || obj.departmentName == null) return false;
			else
				if ( ! inObject.departmentName.equals(obj.departmentName)){
					return false;
				}

		if(inObject.departmentNameGenitive == null && obj.departmentNameGenitive == null){}
		else
			if(inObject.departmentNameGenitive == null || obj.departmentNameGenitive == null) return false;
			else
				if ( ! inObject.departmentNameGenitive.equals(obj.departmentNameGenitive)){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.warrantStatusRef.code != obj.warrantStatusRef.code){
			return false;
		}
		if (inObject.warrantTypeRef.code != obj.warrantTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENWarrant anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENWarrant anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENWARRANT (CODE,NUMBERGEN,NAME,DATESTART,DATEFINAL,WARRANTFIO,WARRANTSHORTFIO,WARRANTPOSITION,GENITIVEFIO,GENITIVEPOSITION,PERSONSURNAME,PERSONSURNAMEGENITIVE,PERSONNAME,PERSONNAMEGENITIVE,PERSONPATRONIMIC,PERSONPATRONIMICGENITV,PASSPORT,ADDRESS,DATEGEN,POWER,MAXSUM,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTNAME,DEPARTMENTNAMEGENITIVE,DEPARTMENTREFCODE,WARRANTSTATUSREFCODE,WARRANTTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numbergen);
			statement.setString(3, anObject.name);
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
			statement.setString(6, anObject.warrantFIO);
			statement.setString(7, anObject.warrantShortFIO);
			statement.setString(8, anObject.warrantPosition);
			statement.setString(9, anObject.genitiveFIO);
			statement.setString(10, anObject.genitivePosition);
			statement.setString(11, anObject.personSurname);
			statement.setString(12, anObject.personSurnameGenitive);
			statement.setString(13, anObject.personName);
			statement.setString(14, anObject.personNameGenitive);
			statement.setString(15, anObject.personPatronimic);
			statement.setString(16, anObject.personPatronimicGenitive);
			statement.setString(17, anObject.passport);
			statement.setString(18, anObject.address);
			if (anObject.dateGen == null) {
				statement.setDate(19, null);
			} else {
				statement.setDate(19, new java.sql.Date(anObject.dateGen.getTime()));
			}
			if (anObject.power != Integer.MIN_VALUE ) {
				statement.setInt(20, anObject.power);
			} else {
				statement.setNull(20, java.sql.Types.INTEGER);
			}
			if (anObject.maxSum != null) {
				anObject.maxSum = anObject.maxSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(21, anObject.maxSum);
			statement.setString(22, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(23, null);
			} else {
				statement.setBigDecimal(23, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(24, anObject.departmentName);
			statement.setString(25, anObject.departmentNameGenitive);
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWarrant.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(26,anObject.departmentRef.code);
			} else {
				statement.setNull(26,java.sql.Types.INTEGER);
			}
			if (anObject.warrantStatusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantStatusDAOGen(connection,getUserProfile()).exists(anObject.warrantStatusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWarrant.warrantStatusRef.code%} = {%"+anObject.warrantStatusRef.code+"%}");
				}
				statement.setInt(27,anObject.warrantStatusRef.code);
			} else {
				statement.setNull(27,java.sql.Types.INTEGER);
			}
			if (anObject.warrantTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantTypeDAOGen(connection,getUserProfile()).exists(anObject.warrantTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENWarrant.warrantTypeRef.code%} = {%"+anObject.warrantTypeRef.code+"%}");
				}
				statement.setInt(28,anObject.warrantTypeRef.code);
			} else {
				statement.setNull(28,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENWarrantDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENWarrant anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENWarrant anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENWarrant oldObject = new ENWarrant();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENWarrant.modify_time_Field + "," + ENWarrant.domain_info_Field+" FROM  ENWARRANT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NAME") == 0) {
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
					if(fieldNameStr.compareTo("WARRANTFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTSHORTFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENITIVEFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENITIVEPOSITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONSURNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONSURNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONPATRONIMIC") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PERSONPATRONIMICGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PASSPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ADDRESS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POWER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAXSUM") == 0) {
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
					if(fieldNameStr.compareTo("DEPARTMENTNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTNAMEGENITIVE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTSTATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WARRANTTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENWARRANT SET  NUMBERGEN = ? , NAME = ? , DATESTART = ? , DATEFINAL = ? , WARRANTFIO = ? , WARRANTSHORTFIO = ? , WARRANTPOSITION = ? , GENITIVEFIO = ? , GENITIVEPOSITION = ? , PERSONSURNAME = ? , PERSONSURNAMEGENITIVE = ? , PERSONNAME = ? , PERSONNAMEGENITIVE = ? , PERSONPATRONIMIC = ? , PERSONPATRONIMICGENITV = ? , PASSPORT = ? , ADDRESS = ? , DATEGEN = ? , POWER = ? , MAXSUM = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTNAME = ? , DEPARTMENTNAMEGENITIVE = ? , DEPARTMENTREFCODE = ? , WARRANTSTATUSREFCODE = ? , WARRANTTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENWARRANT SET ";
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
					statement.setString(1, anObject.numbergen);
					statement.setString(2, anObject.name);
					if (anObject.dateStart == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.dateStart.getTime()));
					}
					if (anObject.dateFinal == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.dateFinal.getTime()));
					}
					statement.setString(5, anObject.warrantFIO);
					statement.setString(6, anObject.warrantShortFIO);
					statement.setString(7, anObject.warrantPosition);
					statement.setString(8, anObject.genitiveFIO);
					statement.setString(9, anObject.genitivePosition);
					statement.setString(10, anObject.personSurname);
					statement.setString(11, anObject.personSurnameGenitive);
					statement.setString(12, anObject.personName);
					statement.setString(13, anObject.personNameGenitive);
					statement.setString(14, anObject.personPatronimic);
					statement.setString(15, anObject.personPatronimicGenitive);
					statement.setString(16, anObject.passport);
					statement.setString(17, anObject.address);
					if (anObject.dateGen == null) {
						statement.setDate(18, null);
					} else {
						statement.setDate(18, new java.sql.Date(anObject.dateGen.getTime()));
					}
					if (anObject.power != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.power);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					if (anObject.maxSum != null) {
						anObject.maxSum = anObject.maxSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(20, anObject.maxSum);
					statement.setString(21, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(22, null);
					} else {
						statement.setBigDecimal(22, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(23, anObject.departmentName);
					statement.setString(24, anObject.departmentNameGenitive);
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(25, anObject.departmentRef.code);
					} else {
						statement.setNull(25, java.sql.Types.INTEGER);
					}
					if (anObject.warrantStatusRef.code != Integer.MIN_VALUE) {
						statement.setInt(26, anObject.warrantStatusRef.code);
					} else {
						statement.setNull(26, java.sql.Types.INTEGER);
					}
					if (anObject.warrantTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(27, anObject.warrantTypeRef.code);
					} else {
						statement.setNull(27, java.sql.Types.INTEGER);
					}
					statement.setInt(28, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numbergen);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
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
						if("WARRANTFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.warrantFIO);
							continue;
						}
						if("WARRANTSHORTFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.warrantShortFIO);
							continue;
						}
						if("WARRANTPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.warrantPosition);
							continue;
						}
						if("GENITIVEFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.genitiveFIO);
							continue;
						}
						if("GENITIVEPOSITION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.genitivePosition);
							continue;
						}
						if("PERSONSURNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personSurname);
							continue;
						}
						if("PERSONSURNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personSurnameGenitive);
							continue;
						}
						if("PERSONNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personName);
							continue;
						}
						if("PERSONNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personNameGenitive);
							continue;
						}
						if("PERSONPATRONIMIC".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personPatronimic);
							continue;
						}
						if("PERSONPATRONIMICGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.personPatronimicGenitive);
							continue;
						}
						if("PASSPORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.passport);
							continue;
						}
						if("ADDRESS".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.address);
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
						if("POWER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.power);
							continue;
						}
						if("MAXSUM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.maxSum != null) {
								anObject.maxSum = anObject.maxSum.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.maxSum);
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
						if("DEPARTMENTNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.departmentName);
							continue;
						}
						if("DEPARTMENTNAMEGENITIVE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.departmentNameGenitive);
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
						if("WARRANTSTATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantStatusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantStatusRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("WARRANTTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.warrantTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.warrantTypeRef.code);
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

	} // end of save(ENWarrant anObject,String[] anAttributes)


	public ENWarrantShort getShortObject(int anObjectCode) throws PersistenceException {
		ENWarrant filterObject = new ENWarrant();
		Vector<ENWarrantShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENWarrantShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENWarrant filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numbergen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinal, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.warrantFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.warrantShortFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.warrantPosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.genitiveFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.genitivePosition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personSurname, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personSurnameGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personNameGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personPatronimic, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.personPatronimicGenitive, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.passport, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.address, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.power, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.maxSum, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmentName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.departmentNameGenitive, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantStatusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.warrantTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENWarrantFilter filter) {
		String out = buildCondition((ENWarrant)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENWarrant filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENWarrant.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbergen, ENWarrant.numbergen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENWarrant.name_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateStart, ENWarrant.dateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinal, ENWarrant.dateFinal_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.warrantFIO, ENWarrant.warrantFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.warrantShortFIO, ENWarrant.warrantShortFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.warrantPosition, ENWarrant.warrantPosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.genitiveFIO, ENWarrant.genitiveFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.genitivePosition, ENWarrant.genitivePosition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personSurname, ENWarrant.personSurname_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personSurnameGenitive, ENWarrant.personSurnameGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personName, ENWarrant.personName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personNameGenitive, ENWarrant.personNameGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personPatronimic, ENWarrant.personPatronimic_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.personPatronimicGenitive, ENWarrant.personPatronimicGenitive_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.passport, ENWarrant.passport_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.address, ENWarrant.address_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateGen, ENWarrant.dateGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.power, ENWarrant.power_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.maxSum, ENWarrant.maxSum_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENWarrant.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENWarrant.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmentName, ENWarrant.departmentName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.departmentNameGenitive, ENWarrant.departmentNameGenitive_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENWarrant.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantStatusRef.code, ENWarrant.warrantStatusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.warrantTypeRef.code, ENWarrant.warrantTypeRef_QFielld, out);
		}
		return out;
	}

	public ENWarrantShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENWarrantShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENWarrantShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENWarrantShortList getFilteredList(ENWarrant filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENWarrantShortList getScrollableFilteredList(ENWarrant aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENWarrantShortList getScrollableFilteredList(ENWarrant aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENWarrantShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENWarrantShortList getScrollableFilteredList(ENWarrantFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENWarrantShortList getScrollableFilteredList(ENWarrantFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENWarrantShortList getScrollableFilteredList(ENWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENWarrantShortList result = new ENWarrantShortList();
		ENWarrantShort anObject;
		result.list = new Vector<ENWarrantShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENWARRANT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENWARRANT.CODE"+
			",ENWARRANT.NUMBERGEN"+
			",ENWARRANT.NAME"+
			",ENWARRANT.WARRANTFIO"+
			",ENWARRANT.WARRANTSHORTFIO"+
			",ENWARRANT.WARRANTPOSITION"+
			",ENWARRANT.GENITIVEFIO"+
			",ENWARRANT.GENITIVEPOSITION"+
			",ENWARRANT.PASSPORT"+
			",ENWARRANT.ADDRESS"+
			",ENWARRANT.POWER"+
			",ENWARRANT.MAXSUM"+
			",ENWARRANT.DEPARTMENTNAME"+
			",ENWARRANT.DEPARTMENTNAMEGENITIVE"+
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
			", ENWARRANTSTATUS.CODE " +
			", ENWARRANTSTATUS.NAME " +
			", ENWARRANTTYPE.CODE " +
			", ENWARRANTTYPE.NAME " +
		" FROM ENWARRANT " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENWARRANT.DEPARTMENTREFCODE "+
			" LEFT JOIN ENWARRANTSTATUS on ENWARRANTSTATUS.CODE = ENWARRANT.WARRANTSTATUSREFCODE "+
			" LEFT JOIN ENWARRANTTYPE on ENWARRANTTYPE.CODE = ENWARRANT.WARRANTTYPEREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENWarrant.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENWarrantShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numbergen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.warrantFIO = set.getString(4);
				anObject.warrantShortFIO = set.getString(5);
				anObject.warrantPosition = set.getString(6);
				anObject.genitiveFIO = set.getString(7);
				anObject.genitivePosition = set.getString(8);
				anObject.passport = set.getString(9);
				anObject.address = set.getString(10);
				anObject.power = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.power = Integer.MIN_VALUE;
				}
				anObject.maxSum = set.getBigDecimal(12);
				if(anObject.maxSum != null) {
					anObject.maxSum = anObject.maxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.departmentName = set.getString(13);
				anObject.departmentNameGenitive = set.getString(14);

				anObject.departmentRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(16);
				anObject.departmentRefDateStart = set.getDate(17);
				anObject.departmentRefDateFinal = set.getDate(18);
				anObject.departmentRefRenCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(20);
				anObject.departmentRefKau_table_id_1884 = set.getInt(21);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(22);
				anObject.departmentRefName_1884 = set.getString(23);
				anObject.departmentRefHrmorganizationid = set.getString(24);
				anObject.warrantStatusRefCode = set.getInt(25);
				if(set.wasNull()) {
					anObject.warrantStatusRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantStatusRefName = set.getString(26);
				anObject.warrantTypeRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.warrantTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.warrantTypeRefName = set.getString(28);

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
	
	public int[] getFilteredCodeArray(ENWarrantFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENWarrantFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENWarrant aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENWARRANT.CODE FROM ENWARRANT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENWARRANT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENWarrant.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENWARRANT.DOMAIN_INFO IS NOT NULL) ";
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


	public ENWarrant getObject(int uid) throws PersistenceException {
		ENWarrant result = new ENWarrant();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENWarrant anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENWarrant anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENWarrant anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENWarrant.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENWARRANT.CODE, ENWARRANT.NUMBERGEN, ENWARRANT.NAME, ENWARRANT.DATESTART, ENWARRANT.DATEFINAL, ENWARRANT.WARRANTFIO, ENWARRANT.WARRANTSHORTFIO, ENWARRANT.WARRANTPOSITION, ENWARRANT.GENITIVEFIO, ENWARRANT.GENITIVEPOSITION, ENWARRANT.PERSONSURNAME, ENWARRANT.PERSONSURNAMEGENITIVE, ENWARRANT.PERSONNAME, ENWARRANT.PERSONNAMEGENITIVE, ENWARRANT.PERSONPATRONIMIC, ENWARRANT.PERSONPATRONIMICGENITV, ENWARRANT.PASSPORT, ENWARRANT.ADDRESS, ENWARRANT.DATEGEN, ENWARRANT.POWER, ENWARRANT.MAXSUM, ENWARRANT.DOMAIN_INFO, ENWARRANT.MODIFY_TIME, ENWARRANT.DEPARTMENTNAME, ENWARRANT.DEPARTMENTNAMEGENITIVE, ENWARRANT.DEPARTMENTREFCODE, ENWARRANT.WARRANTSTATUSREFCODE, ENWARRANT.WARRANTTYPEREFCODE "
			+" FROM ENWARRANT WHERE ENWARRANT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.numbergen = set.getString(2);
				anObject.name = set.getString(3);
				anObject.dateStart = set.getDate(4);
				anObject.dateFinal = set.getDate(5);
				anObject.warrantFIO = set.getString(6);
				anObject.warrantShortFIO = set.getString(7);
				anObject.warrantPosition = set.getString(8);
				anObject.genitiveFIO = set.getString(9);
				anObject.genitivePosition = set.getString(10);
				anObject.personSurname = set.getString(11);
				anObject.personSurnameGenitive = set.getString(12);
				anObject.personName = set.getString(13);
				anObject.personNameGenitive = set.getString(14);
				anObject.personPatronimic = set.getString(15);
				anObject.personPatronimicGenitive = set.getString(16);
				anObject.passport = set.getString(17);
				anObject.address = set.getString(18);
				anObject.dateGen = set.getDate(19);
				anObject.power = set.getInt(20);
				if (set.wasNull()) {
					anObject.power = Integer.MIN_VALUE;
				}
				anObject.maxSum = set.getBigDecimal(21);
				if(anObject.maxSum != null) {
					anObject.maxSum = anObject.maxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.domain_info = set.getString(22);
				anObject.modify_time = set.getLong(23);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.departmentName = set.getString(24);
				anObject.departmentNameGenitive = set.getString(25);
				anObject.departmentRef.code = set.getInt(26);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantStatusRef.code = set.getInt(27);
				if (set.wasNull()) {
					anObject.warrantStatusRef.code = Integer.MIN_VALUE;
				}
				anObject.warrantTypeRef.code = set.getInt(28);
				if (set.wasNull()) {
					anObject.warrantTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENWarrantRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENWarrantRef ref = new com.ksoe.energynet.valueobject.references.ENWarrantRef();
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

		selectStr = "DELETE FROM  ENWARRANT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENWarrant object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENWarrant.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENWarrant.remove%} access denied");
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
	
	public long count(ENWarrantFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENWarrantFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENWARRANT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENWarrant.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENWARRANT.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENWARRANT WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENWarrantFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENWARRANT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENWarrant.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENWarrant.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENWARRANT.CODE FROM  ENWARRANT WHERE  ENWARRANT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENWARRANT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENWARRANT.CODE");
		_checkConditionToken(condition,"numbergen","ENWARRANT.NUMBERGEN");
		_checkConditionToken(condition,"name","ENWARRANT.NAME");
		_checkConditionToken(condition,"datestart","ENWARRANT.DATESTART");
		_checkConditionToken(condition,"datefinal","ENWARRANT.DATEFINAL");
		_checkConditionToken(condition,"warrantfio","ENWARRANT.WARRANTFIO");
		_checkConditionToken(condition,"warrantshortfio","ENWARRANT.WARRANTSHORTFIO");
		_checkConditionToken(condition,"warrantposition","ENWARRANT.WARRANTPOSITION");
		_checkConditionToken(condition,"genitivefio","ENWARRANT.GENITIVEFIO");
		_checkConditionToken(condition,"genitiveposition","ENWARRANT.GENITIVEPOSITION");
		_checkConditionToken(condition,"personsurname","ENWARRANT.PERSONSURNAME");
		_checkConditionToken(condition,"personsurnamegenitive","ENWARRANT.PERSONSURNAMEGENITIVE");
		_checkConditionToken(condition,"personname","ENWARRANT.PERSONNAME");
		_checkConditionToken(condition,"personnamegenitive","ENWARRANT.PERSONNAMEGENITIVE");
		_checkConditionToken(condition,"personpatronimic","ENWARRANT.PERSONPATRONIMIC");
		_checkConditionToken(condition,"personpatronimicgenitive","ENWARRANT.PERSONPATRONIMICGENITV");
		_checkConditionToken(condition,"passport","ENWARRANT.PASSPORT");
		_checkConditionToken(condition,"address","ENWARRANT.ADDRESS");
		_checkConditionToken(condition,"dategen","ENWARRANT.DATEGEN");
		_checkConditionToken(condition,"power","ENWARRANT.POWER");
		_checkConditionToken(condition,"maxsum","ENWARRANT.MAXSUM");
		_checkConditionToken(condition,"domain_info","ENWARRANT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENWARRANT.MODIFY_TIME");
		_checkConditionToken(condition,"departmentname","ENWARRANT.DEPARTMENTNAME");
		_checkConditionToken(condition,"departmentnamegenitive","ENWARRANT.DEPARTMENTNAMEGENITIVE");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"warrantstatusref","WARRANTSTATUSREFCODE");
		_checkConditionToken(condition,"warrantstatusref.code","WARRANTSTATUSREFCODE");
		_checkConditionToken(condition,"warranttyperef","WARRANTTYPEREFCODE");
		_checkConditionToken(condition,"warranttyperef.code","WARRANTTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENWarrant anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENWARRANT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENWARRANT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENWARRANT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENWARRANT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENWarrantDAO
