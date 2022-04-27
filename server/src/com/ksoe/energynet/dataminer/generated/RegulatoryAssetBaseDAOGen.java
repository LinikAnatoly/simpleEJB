
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
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
import com.ksoe.energynet.valueobject.RegulatoryAssetBase;
import com.ksoe.energynet.valueobject.filter.RegulatoryAssetBaseFilter;
import com.ksoe.energynet.valueobject.brief.RegulatoryAssetBaseShort;
import com.ksoe.energynet.valueobject.lists.RegulatoryAssetBaseShortList;


/**
 * DAO Object for RegulatoryAssetBase;
 *
 */

public class RegulatoryAssetBaseDAOGen extends GenericDataMiner {

	public RegulatoryAssetBaseDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public RegulatoryAssetBaseDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(RegulatoryAssetBase inObject) throws PersistenceException {
		RegulatoryAssetBase obj = new RegulatoryAssetBase();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.inventoryNumber == null && obj.inventoryNumber == null){}
		else
			if(inObject.inventoryNumber == null || obj.inventoryNumber == null) return false;
			else
				if ( ! inObject.inventoryNumber.equals(obj.inventoryNumber)){
					return false;
				}

		if (inObject.inventoryCode != obj.inventoryCode){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.incomeDate == null && obj.incomeDate == null){} else 
			if(inObject.incomeDate == null || obj.incomeDate == null) return false;
			else
				if (inObject.incomeDate.compareTo(obj.incomeDate) != 0){
					return false;
				}

		if(inObject.documentNumber == null && obj.documentNumber == null){}
		else
			if(inObject.documentNumber == null || obj.documentNumber == null) return false;
			else
				if ( ! inObject.documentNumber.equals(obj.documentNumber)){
					return false;
				}

		if(inObject.originalValue == null && obj.originalValue == null){}
		else
			if(inObject.originalValue == null || obj.originalValue == null) return false;
			else
				if ( ! inObject.originalValue.equals(obj.originalValue)){
					return false;
				}

		if (inObject.usefulLife != obj.usefulLife){
					return false;
				}

		if(inObject.initial == null && obj.initial == null){} else 
			if(inObject.initial == null || obj.initial == null) return false;
			else
				if (inObject.initial.compareTo(obj.initial) != 0){
					return false;
				}

		if(inObject.writeOffNumber == null && obj.writeOffNumber == null){}
		else
			if(inObject.writeOffNumber == null || obj.writeOffNumber == null) return false;
			else
				if ( ! inObject.writeOffNumber.equals(obj.writeOffNumber)){
					return false;
				}

		if(inObject.writeOffDate == null && obj.writeOffDate == null){} else 
			if(inObject.writeOffDate == null || obj.writeOffDate == null) return false;
			else
				if (inObject.writeOffDate.compareTo(obj.writeOffDate) != 0){
					return false;
				}

		if(inObject.investition == null && obj.investition == null){} else 
			if(inObject.investition == null || obj.investition == null) return false;
			else
				if (inObject.investition.compareTo(obj.investition) != 0){
					return false;
				}

		if(inObject.investitionProgramName == null && obj.investitionProgramName == null){}
		else
			if(inObject.investitionProgramName == null || obj.investitionProgramName == null) return false;
			else
				if ( ! inObject.investitionProgramName.equals(obj.investitionProgramName)){
					return false;
				}

		if (inObject.investitionProgramYear != obj.investitionProgramYear){
					return false;
				}

		if(inObject.investitionProgramCipher == null && obj.investitionProgramCipher == null){}
		else
			if(inObject.investitionProgramCipher == null || obj.investitionProgramCipher == null) return false;
			else
				if ( ! inObject.investitionProgramCipher.equals(obj.investitionProgramCipher)){
					return false;
				}

		if(inObject.connection == null && obj.connection == null){} else 
			if(inObject.connection == null || obj.connection == null) return false;
			else
				if (inObject.connection.compareTo(obj.connection) != 0){
					return false;
				}

		if(inObject.connectionNumber == null && obj.connectionNumber == null){}
		else
			if(inObject.connectionNumber == null || obj.connectionNumber == null) return false;
			else
				if ( ! inObject.connectionNumber.equals(obj.connectionNumber)){
					return false;
				}

		if(inObject.connectionDate == null && obj.connectionDate == null){} else 
			if(inObject.connectionDate == null || obj.connectionDate == null) return false;
			else
				if (inObject.connectionDate.compareTo(obj.connectionDate) != 0){
					return false;
				}

		if(inObject.connectionContragent == null && obj.connectionContragent == null){}
		else
			if(inObject.connectionContragent == null || obj.connectionContragent == null) return false;
			else
				if ( ! inObject.connectionContragent.equals(obj.connectionContragent)){
					return false;
				}

		if (inObject.categoryCode != obj.categoryCode){
					return false;
				}
		if (inObject.parentRef.code != obj.parentRef.code){
			return false;
		}
		if (inObject.groupRef.code != obj.groupRef.code){
			return false;
		}
		if (inObject.fundingSourceRef.code != obj.fundingSourceRef.code){
			return false;
		}
		return true;
	}

	public int add(RegulatoryAssetBase anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(RegulatoryAssetBase anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO REGULATORYASSETBASE (CODE,INVENTORYNUMBER,INVENTORYCODE,NAME,INCOMEDATE,DOCUMENTNUMBER,ORIGINALVALUE,USEFULLIFE,INITIAL,WRITEOFFNUMBER,WRITEOFFDATE,INVESTITION,INVESTITIONPROGRAMNAME,INVESTITIONPROGRAMYEAR,INVESTITIONPROGRAMCPHR,CONNECTION,CONNECTIONNUMBER,CONNECTIONDATE,CONNECTIONCONTRAGENT,CATEGORYCODE,PARENTREFCODE,GROUPREFCODE,FUNDINGSOURCEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.inventoryNumber);
			if (anObject.inventoryCode != Integer.MIN_VALUE ) {
				statement.setInt(3, anObject.inventoryCode);
			} else {
				statement.setNull(3, java.sql.Types.INTEGER);
			}
			statement.setString(4, anObject.name);
			if (anObject.incomeDate == null) {
				statement.setDate(5, null);
			} else {
				statement.setDate(5, new java.sql.Date(anObject.incomeDate.getTime()));
			}
			statement.setString(6, anObject.documentNumber);
			if (anObject.originalValue != null) {
				anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.originalValue);
			if (anObject.usefulLife != Integer.MIN_VALUE ) {
				statement.setInt(8, anObject.usefulLife);
			} else {
				statement.setNull(8, java.sql.Types.INTEGER);
			}
			if (anObject.initial != null) {
				statement.setBoolean(9, anObject.initial);
			} else {
				statement.setNull(9, java.sql.Types.BOOLEAN);
			}
			statement.setString(10, anObject.writeOffNumber);
			if (anObject.writeOffDate == null) {
				statement.setDate(11, null);
			} else {
				statement.setDate(11, new java.sql.Date(anObject.writeOffDate.getTime()));
			}
			if (anObject.investition != null) {
				statement.setBoolean(12, anObject.investition);
			} else {
				statement.setNull(12, java.sql.Types.BOOLEAN);
			}
			statement.setString(13, anObject.investitionProgramName);
			if (anObject.investitionProgramYear != Integer.MIN_VALUE ) {
				statement.setInt(14, anObject.investitionProgramYear);
			} else {
				statement.setNull(14, java.sql.Types.INTEGER);
			}
			statement.setString(15, anObject.investitionProgramCipher);
			if (anObject.connection != null) {
				statement.setBoolean(16, anObject.connection);
			} else {
				statement.setNull(16, java.sql.Types.BOOLEAN);
			}
			statement.setString(17, anObject.connectionNumber);
			if (anObject.connectionDate == null) {
				statement.setDate(18, null);
			} else {
				statement.setDate(18, new java.sql.Date(anObject.connectionDate.getTime()));
			}
			statement.setString(19, anObject.connectionContragent);
			if (anObject.categoryCode != Integer.MIN_VALUE ) {
				statement.setInt(20, anObject.categoryCode);
			} else {
				statement.setNull(20, java.sql.Types.INTEGER);
			}
			if (anObject.parentRef.code != Integer.MIN_VALUE){
				statement.setInt(21,anObject.parentRef.code);
			} else {
				statement.setNull(21,java.sql.Types.INTEGER);
			}
			if (anObject.groupRef.code != Integer.MIN_VALUE){
				statement.setInt(22,anObject.groupRef.code);
			} else {
				statement.setNull(22,java.sql.Types.INTEGER);
			}
			if (anObject.fundingSourceRef.code != Integer.MIN_VALUE){
				statement.setInt(23,anObject.fundingSourceRef.code);
			} else {
				statement.setNull(23,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%RegulatoryAssetBaseDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(RegulatoryAssetBase anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(RegulatoryAssetBase anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("INVENTORYNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVENTORYCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INCOMEDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOCUMENTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORIGINALVALUE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEFULLIFE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WRITEOFFNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WRITEOFFDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTITION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTITIONPROGRAMNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTITIONPROGRAMYEAR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INVESTITIONPROGRAMCIPHER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONNECTIONCONTRAGENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CATEGORYCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GROUPREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FUNDINGSOURCEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE REGULATORYASSETBASE SET  INVENTORYNUMBER = ? , INVENTORYCODE = ? , NAME = ? , INCOMEDATE = ? , DOCUMENTNUMBER = ? , ORIGINALVALUE = ? , USEFULLIFE = ? , INITIAL = ? , WRITEOFFNUMBER = ? , WRITEOFFDATE = ? , INVESTITION = ? , INVESTITIONPROGRAMNAME = ? , INVESTITIONPROGRAMYEAR = ? , INVESTITIONPROGRAMCPHR = ? , CONNECTION = ? , CONNECTIONNUMBER = ? , CONNECTIONDATE = ? , CONNECTIONCONTRAGENT = ? , CATEGORYCODE = ? , PARENTREFCODE = ? , GROUPREFCODE = ? , FUNDINGSOURCEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE REGULATORYASSETBASE SET ";
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
					statement.setString(1, anObject.inventoryNumber);
					if (anObject.inventoryCode != Integer.MIN_VALUE) {
						statement.setInt(2, anObject.inventoryCode);
					} else {
						statement.setNull(2, java.sql.Types.INTEGER);
					}
					statement.setString(3, anObject.name);
					if (anObject.incomeDate == null) {
						statement.setDate(4, null);
					} else {
						statement.setDate(4, new java.sql.Date(anObject.incomeDate.getTime()));
					}
					statement.setString(5, anObject.documentNumber);
					if (anObject.originalValue != null) {
						anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.originalValue);
					if (anObject.usefulLife != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.usefulLife);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.initial == null) {
						statement.setNull(8, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(8, anObject.initial);
					}
					statement.setString(9, anObject.writeOffNumber);
					if (anObject.writeOffDate == null) {
						statement.setDate(10, null);
					} else {
						statement.setDate(10, new java.sql.Date(anObject.writeOffDate.getTime()));
					}
					if (anObject.investition == null) {
						statement.setNull(11, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(11, anObject.investition);
					}
					statement.setString(12, anObject.investitionProgramName);
					if (anObject.investitionProgramYear != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.investitionProgramYear);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setString(14, anObject.investitionProgramCipher);
					if (anObject.connection == null) {
						statement.setNull(15, java.sql.Types.BOOLEAN);
					} else {
						statement.setBoolean(15, anObject.connection);
					}
					statement.setString(16, anObject.connectionNumber);
					if (anObject.connectionDate == null) {
						statement.setDate(17, null);
					} else {
						statement.setDate(17, new java.sql.Date(anObject.connectionDate.getTime()));
					}
					statement.setString(18, anObject.connectionContragent);
					if (anObject.categoryCode != Integer.MIN_VALUE) {
						statement.setInt(19, anObject.categoryCode);
					} else {
						statement.setNull(19, java.sql.Types.INTEGER);
					}
					if (anObject.parentRef.code != Integer.MIN_VALUE) {
						statement.setInt(20, anObject.parentRef.code);
					} else {
						statement.setNull(20, java.sql.Types.INTEGER);
					}
					if (anObject.groupRef.code != Integer.MIN_VALUE) {
						statement.setInt(21, anObject.groupRef.code);
					} else {
						statement.setNull(21, java.sql.Types.INTEGER);
					}
					if (anObject.fundingSourceRef.code != Integer.MIN_VALUE) {
						statement.setInt(22, anObject.fundingSourceRef.code);
					} else {
						statement.setNull(22, java.sql.Types.INTEGER);
					}
					statement.setInt(23, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVENTORYNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.inventoryNumber);
							continue;
						}
						if("INVENTORYCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.inventoryCode);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("INCOMEDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.incomeDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.incomeDate.getTime()));
							}
							continue;
						}
						if("DOCUMENTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.documentNumber);
							continue;
						}
						if("ORIGINALVALUE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.originalValue != null) {
								anObject.originalValue = anObject.originalValue.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.originalValue);
							continue;
						}
						if("USEFULLIFE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.usefulLife);
							continue;
						}
						if("INITIAL".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.initial);
							continue;
						}
						if("WRITEOFFNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.writeOffNumber);
							continue;
						}
						if("WRITEOFFDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.writeOffDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.writeOffDate.getTime()));
							}
							continue;
						}
						if("INVESTITION".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.investition);
							continue;
						}
						if("INVESTITIONPROGRAMNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.investitionProgramName);
							continue;
						}
						if("INVESTITIONPROGRAMYEAR".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.investitionProgramYear);
							continue;
						}
						if("INVESTITIONPROGRAMCIPHER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.investitionProgramCipher);
							continue;
						}
						if("CONNECTION".compareTo((String)fields.get(i)) == 0) {
								statement.setBoolean(i+1, anObject.connection);
							continue;
						}
						if("CONNECTIONNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionNumber);
							continue;
						}
						if("CONNECTIONDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.connectionDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.connectionDate.getTime()));
							}
							continue;
						}
						if("CONNECTIONCONTRAGENT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.connectionContragent);
							continue;
						}
						if("CATEGORYCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.categoryCode);
							continue;
						}
						if("PARENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.parentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.parentRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GROUPREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.groupRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.groupRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FUNDINGSOURCEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fundingSourceRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.fundingSourceRef.code);
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

	} // end of save(RegulatoryAssetBase anObject,String[] anAttributes)


	public RegulatoryAssetBaseShort getShortObject(int anObjectCode) throws PersistenceException {
		RegulatoryAssetBase filterObject = new RegulatoryAssetBase();
		Vector<RegulatoryAssetBaseShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (RegulatoryAssetBaseShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(RegulatoryAssetBase filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.inventoryNumber, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.inventoryCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.incomeDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.documentNumber, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.originalValue, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.usefulLife, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.initial, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.writeOffNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.writeOffDate, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.investition, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.investitionProgramName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.investitionProgramYear, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.investitionProgramCipher, index, statement);
			index = BaseDAOUtils.setBooleanParameter(filter.connection, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.connectionDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.connectionContragent, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.categoryCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.parentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.groupRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fundingSourceRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(RegulatoryAssetBaseFilter filter) {
		String out = buildCondition((RegulatoryAssetBase)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(RegulatoryAssetBase filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, RegulatoryAssetBase.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.inventoryNumber, RegulatoryAssetBase.inventoryNumber_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.inventoryCode, RegulatoryAssetBase.inventoryCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, RegulatoryAssetBase.name_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.incomeDate, RegulatoryAssetBase.incomeDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.documentNumber, RegulatoryAssetBase.documentNumber_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.originalValue, RegulatoryAssetBase.originalValue_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.usefulLife, RegulatoryAssetBase.usefulLife_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.initial, RegulatoryAssetBase.initial_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.writeOffNumber, RegulatoryAssetBase.writeOffNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.writeOffDate, RegulatoryAssetBase.writeOffDate_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.investition, RegulatoryAssetBase.investition_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.investitionProgramName, RegulatoryAssetBase.investitionProgramName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.investitionProgramYear, RegulatoryAssetBase.investitionProgramYear_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.investitionProgramCipher, RegulatoryAssetBase.investitionProgramCipher_QFielld, out);
			out = BaseDAOUtils.addBooleanToCondition(filter.connection, RegulatoryAssetBase.connection_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionNumber, RegulatoryAssetBase.connectionNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.connectionDate, RegulatoryAssetBase.connectionDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.connectionContragent, RegulatoryAssetBase.connectionContragent_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.categoryCode, RegulatoryAssetBase.categoryCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.parentRef.code, RegulatoryAssetBase.parentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.groupRef.code, RegulatoryAssetBase.groupRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fundingSourceRef.code, RegulatoryAssetBase.fundingSourceRef_QFielld, out);
		}
		return out;
	}

	public RegulatoryAssetBaseShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public RegulatoryAssetBaseShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public RegulatoryAssetBaseShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseShortList getFilteredList(RegulatoryAssetBase filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBase aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBase aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public RegulatoryAssetBaseShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBaseFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBaseFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public RegulatoryAssetBaseShortList getScrollableFilteredList(RegulatoryAssetBase aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		RegulatoryAssetBaseShortList result = new RegulatoryAssetBaseShortList();
		RegulatoryAssetBaseShort anObject;
		result.list = new Vector<RegulatoryAssetBaseShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"REGULATORYASSETBASE.CODE"+
			",REGULATORYASSETBASE.INVENTORYNUMBER"+
			",REGULATORYASSETBASE.INVENTORYCODE"+
			",REGULATORYASSETBASE.NAME"+
			",REGULATORYASSETBASE.INCOMEDATE"+
			",REGULATORYASSETBASE.DOCUMENTNUMBER"+
			",REGULATORYASSETBASE.ORIGINALVALUE"+
			",REGULATORYASSETBASE.INITIAL"+
			",REGULATORYASSETBASE.WRITEOFFNUMBER"+
			",REGULATORYASSETBASE.WRITEOFFDATE"+
			",REGULATORYASSETBASE.INVESTITION"+
			",REGULATORYASSETBASE.INVESTITIONPROGRAMNAME"+
			",REGULATORYASSETBASE.INVESTITIONPROGRAMYEAR"+
			",REGULATORYASSETBASE.INVESTITIONPROGRAMCPHR"+
			",REGULATORYASSETBASE.CONNECTION"+
			",REGULATORYASSETBASE.CONNECTIONNUMBER"+
			",REGULATORYASSETBASE.CONNECTIONDATE"+
			",REGULATORYASSETBASE.CONNECTIONCONTRAGENT"+
			",REGULATORYASSETBASE.CATEGORYCODE"+
			", REGULATORYASSETBASE.CODE " +
			", REGULATORYASSETBASE.INVENTORYNUMBER " +
			", REGULATORYASSETBASE.INVENTORYCODE " +
			", REGULATORYASSETBASE.NAME " +
			", REGULATORYASSETBASE.INCOMEDATE " +
			", REGULATORYASSETBASE.DOCUMENTNUMBER " +
			", REGULATORYASSETBASE.ORIGINALVALUE " +
			", REGULATORYASSETBASE.INITIAL " +
			", REGULATORYASSETBASE.WRITEOFFNUMBER " +
			", REGULATORYASSETBASE.WRITEOFFDATE " +
			", REGULATORYASSETBASE.INVESTITION " +
			", REGULATORYASSETBASE.INVESTITIONPROGRAMNAME " +
			", REGULATORYASSETBASE.INVESTITIONPROGRAMYEAR " +
			", REGULATORYASSETBASE.INVESTITIONPROGRAMCPHR " +
			", REGULATORYASSETBASE.CONNECTION " +
			", REGULATORYASSETBASE.CONNECTIONNUMBER " +
			", REGULATORYASSETBASE.CONNECTIONDATE " +
			", REGULATORYASSETBASE.CONNECTIONCONTRAGENT " +
			", REGULATORYASSETBASE.CATEGORYCODE " +
			", REGULATORYASSETBASEGRP.CODE " +
			", REGULATORYASSETBASEGRP.NUMBER " +
			", REGULATORYASSETBASEGRP.NAME " +
			", REGULATORSSTBSFNDNGSRC.CODE " +
			", REGULATORSSTBSFNDNGSRC.NAME " +
		" FROM REGULATORYASSETBASE " +
			" LEFT JOIN REGULATORYASSETBASE on REGULATORYASSETBASE.CODE = REGULATORYASSETBASE.PARENTREFCODE "+
			" LEFT JOIN REGULATORYASSETBASEGRP on REGULATORYASSETBASEGRP.CODE = REGULATORYASSETBASE.GROUPREFCODE "+
			" LEFT JOIN REGULATORSSTBSFNDNGSRC on REGULATORSSTBSFNDNGSRC.CODE = REGULATORYASSETBASE.FUNDINGSOURCEREFCODE "+
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
				anObject = new RegulatoryAssetBaseShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.inventoryNumber = set.getString(2);
				/*anObject.inventoryCode = set.getInt(3);
				if ( set.wasNull() ) {
					anObject.inventoryCode = Integer.MIN_VALUE;
				}*/
				anObject.name = set.getString(4);
				anObject.incomeDate = set.getDate(5);
				anObject.documentNumber = set.getString(6);
				anObject.originalValue = set.getBigDecimal(7);
				if(anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.initial = set.getBoolean(8);
				if ( set.wasNull() ) {
					anObject.initial = null;
				}
				anObject.writeOffNumber = set.getString(9);
				anObject.writeOffDate = set.getDate(10);
				/*anObject.investition = set.getBoolean(11);
				if ( set.wasNull() ) {
					anObject.investition = null;
				}
				anObject.investitionProgramName = set.getString(12);
				anObject.investitionProgramYear = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.investitionProgramYear = Integer.MIN_VALUE;
				}
				anObject.investitionProgramCipher = set.getString(14);
				anObject.connection = set.getBoolean(15);
				if ( set.wasNull() ) {
					anObject.connection = null;
				}
				anObject.connectionNumber = set.getString(16);
				anObject.connectionDate = set.getDate(17);
				anObject.connectionContragent = set.getString(18);
				anObject.categoryCode = set.getInt(19);
				if ( set.wasNull() ) {
					anObject.categoryCode = Integer.MIN_VALUE;
				}

				anObject.parentRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.parentRefCode = Integer.MIN_VALUE;
				}
				anObject.parentRefInventoryNumber = set.getString(21);
				anObject.parentRefInventoryCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.parentRefInventoryCode = Integer.MIN_VALUE;
				}
				anObject.parentRefName = set.getString(23);
				anObject.parentRefIncomeDate = set.getDate(24);
				anObject.parentRefDocumentNumber = set.getString(25);
				anObject.parentRefOriginalValue = set.getBigDecimal(26);
				if(anObject.parentRefOriginalValue != null) {
					anObject.parentRefOriginalValue = anObject.parentRefOriginalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.parentRefInitial = set.getBoolean(27);
				if(set.wasNull()) {
					anObject.parentRefInitial = null;
				}
				anObject.parentRefWriteOffNumber = set.getString(28);
				anObject.parentRefWriteOffDate = set.getDate(29);
				anObject.parentRefInvestition = set.getBoolean(30);
				if(set.wasNull()) {
					anObject.parentRefInvestition = null;
				}
				anObject.parentRefInvestitionProgramName = set.getString(31);
				anObject.parentRefInvestitionProgramYear = set.getInt(32);
				if(set.wasNull()) {
					anObject.parentRefInvestitionProgramYear = Integer.MIN_VALUE;
				}
				anObject.parentRefInvestitionProgramCipher = set.getString(33);
				anObject.parentRefConnection = set.getBoolean(34);
				if(set.wasNull()) {
					anObject.parentRefConnection = null;
				}
				anObject.parentRefConnectionNumber = set.getString(35);
				anObject.parentRefConnectionDate = set.getDate(36);
				anObject.parentRefConnectionContragent = set.getString(37);
				anObject.parentRefCategoryCode = set.getInt(38);
				if(set.wasNull()) {
					anObject.parentRefCategoryCode = Integer.MIN_VALUE;
				}
				anObject.groupRefCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.groupRefCode = Integer.MIN_VALUE;
				}
				anObject.groupRefNumber = set.getString(40);
				anObject.groupRefName = set.getString(41);
				anObject.fundingSourceRefCode = set.getInt(42);
				if(set.wasNull()) {
					anObject.fundingSourceRefCode = Integer.MIN_VALUE;
				}
				anObject.fundingSourceRefName = set.getString(43);*/

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
	
	public int[] getFilteredCodeArray(RegulatoryAssetBaseFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(RegulatoryAssetBaseFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(RegulatoryAssetBase aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT REGULATORYASSETBASE.CODE FROM REGULATORYASSETBASE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "REGULATORYASSETBASE.CODE";
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


	public RegulatoryAssetBase getObject(int uid) throws PersistenceException {
		RegulatoryAssetBase result = new RegulatoryAssetBase();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(RegulatoryAssetBase anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  REGULATORYASSETBASE.CODE, REGULATORYASSETBASE.INVENTORYNUMBER, REGULATORYASSETBASE.INVENTORYCODE, REGULATORYASSETBASE.NAME, REGULATORYASSETBASE.INCOMEDATE, REGULATORYASSETBASE.DOCUMENTNUMBER, REGULATORYASSETBASE.ORIGINALVALUE, REGULATORYASSETBASE.USEFULLIFE, REGULATORYASSETBASE.INITIAL, REGULATORYASSETBASE.WRITEOFFNUMBER, REGULATORYASSETBASE.WRITEOFFDATE, REGULATORYASSETBASE.INVESTITION, REGULATORYASSETBASE.INVESTITIONPROGRAMNAME, REGULATORYASSETBASE.INVESTITIONPROGRAMYEAR, REGULATORYASSETBASE.INVESTITIONPROGRAMCPHR, REGULATORYASSETBASE.CONNECTION, REGULATORYASSETBASE.CONNECTIONNUMBER, REGULATORYASSETBASE.CONNECTIONDATE, REGULATORYASSETBASE.CONNECTIONCONTRAGENT, REGULATORYASSETBASE.CATEGORYCODE, REGULATORYASSETBASE.PARENTREFCODE, REGULATORYASSETBASE.GROUPREFCODE, REGULATORYASSETBASE.FUNDINGSOURCEREFCODE "
			+" FROM REGULATORYASSETBASE WHERE REGULATORYASSETBASE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.inventoryNumber = set.getString(2);
				anObject.inventoryCode = set.getInt(3);
				if (set.wasNull()) {
					anObject.inventoryCode = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(4);
				anObject.incomeDate = set.getDate(5);
				anObject.documentNumber = set.getString(6);
				anObject.originalValue = set.getBigDecimal(7);
				if(anObject.originalValue != null) {
					anObject.originalValue = anObject.originalValue.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.usefulLife = set.getInt(8);
				if (set.wasNull()) {
					anObject.usefulLife = Integer.MIN_VALUE;
				}
				anObject.initial = set.getBoolean(9);
				if (set.wasNull()) {
					anObject.initial = null;
				}
				anObject.writeOffNumber = set.getString(10);
				anObject.writeOffDate = set.getDate(11);
				anObject.investition = set.getBoolean(12);
				if (set.wasNull()) {
					anObject.investition = null;
				}
				anObject.investitionProgramName = set.getString(13);
				anObject.investitionProgramYear = set.getInt(14);
				if (set.wasNull()) {
					anObject.investitionProgramYear = Integer.MIN_VALUE;
				}
				anObject.investitionProgramCipher = set.getString(15);
				anObject.connection = set.getBoolean(16);
				if (set.wasNull()) {
					anObject.connection = null;
				}
				anObject.connectionNumber = set.getString(17);
				anObject.connectionDate = set.getDate(18);
				anObject.connectionContragent = set.getString(19);
				anObject.categoryCode = set.getInt(20);
				if (set.wasNull()) {
					anObject.categoryCode = Integer.MIN_VALUE;
				}
				anObject.parentRef.code = set.getInt(21);
				if (set.wasNull()) {
					anObject.parentRef.code = Integer.MIN_VALUE;
				}
				anObject.groupRef.code = set.getInt(22);
				if (set.wasNull()) {
					anObject.groupRef.code = Integer.MIN_VALUE;
				}
				anObject.fundingSourceRef.code = set.getInt(23);
				if (set.wasNull()) {
					anObject.fundingSourceRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef ref = new com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef();
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

		selectStr = "DELETE FROM  REGULATORYASSETBASE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		RegulatoryAssetBase object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%RegulatoryAssetBase.getObject%} access denied");
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
	
	public long count(RegulatoryAssetBaseFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(RegulatoryAssetBaseFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, RegulatoryAssetBaseFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM REGULATORYASSETBASE", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM REGULATORYASSETBASE WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, RegulatoryAssetBaseFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "REGULATORYASSETBASE");
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
			"SELECT  REGULATORYASSETBASE.CODE FROM  REGULATORYASSETBASE WHERE  REGULATORYASSETBASE.CODE = ?";
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
		_checkConditionToken(condition,"code","REGULATORYASSETBASE.CODE");
		_checkConditionToken(condition,"inventorynumber","REGULATORYASSETBASE.INVENTORYNUMBER");
		_checkConditionToken(condition,"inventorycode","REGULATORYASSETBASE.INVENTORYCODE");
		_checkConditionToken(condition,"name","REGULATORYASSETBASE.NAME");
		_checkConditionToken(condition,"incomedate","REGULATORYASSETBASE.INCOMEDATE");
		_checkConditionToken(condition,"documentnumber","REGULATORYASSETBASE.DOCUMENTNUMBER");
		_checkConditionToken(condition,"originalvalue","REGULATORYASSETBASE.ORIGINALVALUE");
		_checkConditionToken(condition,"usefullife","REGULATORYASSETBASE.USEFULLIFE");
		_checkConditionToken(condition,"initial","REGULATORYASSETBASE.INITIAL");
		_checkConditionToken(condition,"writeoffnumber","REGULATORYASSETBASE.WRITEOFFNUMBER");
		_checkConditionToken(condition,"writeoffdate","REGULATORYASSETBASE.WRITEOFFDATE");
		_checkConditionToken(condition,"investition","REGULATORYASSETBASE.INVESTITION");
		_checkConditionToken(condition,"investitionprogramname","REGULATORYASSETBASE.INVESTITIONPROGRAMNAME");
		_checkConditionToken(condition,"investitionprogramyear","REGULATORYASSETBASE.INVESTITIONPROGRAMYEAR");
		_checkConditionToken(condition,"investitionprogramcipher","REGULATORYASSETBASE.INVESTITIONPROGRAMCPHR");
		_checkConditionToken(condition,"connection","REGULATORYASSETBASE.CONNECTION");
		_checkConditionToken(condition,"connectionnumber","REGULATORYASSETBASE.CONNECTIONNUMBER");
		_checkConditionToken(condition,"connectiondate","REGULATORYASSETBASE.CONNECTIONDATE");
		_checkConditionToken(condition,"connectioncontragent","REGULATORYASSETBASE.CONNECTIONCONTRAGENT");
		_checkConditionToken(condition,"categorycode","REGULATORYASSETBASE.CATEGORYCODE");
		// relationship conditions
		_checkConditionToken(condition,"parentref","PARENTREFCODE");
		_checkConditionToken(condition,"parentref.code","PARENTREFCODE");
		_checkConditionToken(condition,"groupref","GROUPREFCODE");
		_checkConditionToken(condition,"groupref.code","GROUPREFCODE");
		_checkConditionToken(condition,"fundingsourceref","FUNDINGSOURCEREFCODE");
		_checkConditionToken(condition,"fundingsourceref.code","FUNDINGSOURCEREFCODE");
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
	
	private void _collectAutoIncrementFields(RegulatoryAssetBase anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("REGULATORYASSETBASE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("REGULATORYASSETBASE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("REGULATORYASSETBASE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: REGULATORYASSETBASE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of RegulatoryAssetBaseDAO
