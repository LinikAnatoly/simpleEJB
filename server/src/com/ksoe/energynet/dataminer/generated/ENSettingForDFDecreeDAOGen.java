
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
import com.ksoe.energynet.valueobject.ENSettingForDFDecree;
import com.ksoe.energynet.valueobject.filter.ENSettingForDFDecreeFilter;
import com.ksoe.energynet.valueobject.brief.ENSettingForDFDecreeShort;
import com.ksoe.energynet.valueobject.lists.ENSettingForDFDecreeShortList;


/**
 * DAO Object for ENSettingForDFDecree;
 *
 */

public class ENSettingForDFDecreeDAOGen extends GenericDataMiner {

	public ENSettingForDFDecreeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSettingForDFDecreeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSettingForDFDecree inObject) throws PersistenceException {
		ENSettingForDFDecree obj = new ENSettingForDFDecree();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.dfDocTypeCode != obj.dfDocTypeCode){
					return false;
				}

		if(inObject.dfDocTypeName == null && obj.dfDocTypeName == null){}
		else
			if(inObject.dfDocTypeName == null || obj.dfDocTypeName == null) return false;
			else
				if ( ! inObject.dfDocTypeName.equals(obj.dfDocTypeName)){
					return false;
				}

		if (inObject.catalogCode != obj.catalogCode){
					return false;
				}

		if(inObject.catalogName == null && obj.catalogName == null){}
		else
			if(inObject.catalogName == null || obj.catalogName == null) return false;
			else
				if ( ! inObject.catalogName.equals(obj.catalogName)){
					return false;
				}

		if (inObject.dfDocPrefixCode != obj.dfDocPrefixCode){
					return false;
				}

		if(inObject.dfDocPrefixName == null && obj.dfDocPrefixName == null){}
		else
			if(inObject.dfDocPrefixName == null || obj.dfDocPrefixName == null) return false;
			else
				if ( ! inObject.dfDocPrefixName.equals(obj.dfDocPrefixName)){
					return false;
				}

		if(inObject.prefixSignerTabN == null && obj.prefixSignerTabN == null){}
		else
			if(inObject.prefixSignerTabN == null || obj.prefixSignerTabN == null) return false;
			else
				if ( ! inObject.prefixSignerTabN.equals(obj.prefixSignerTabN)){
					return false;
				}

		if(inObject.prefixSignerFio == null && obj.prefixSignerFio == null){}
		else
			if(inObject.prefixSignerFio == null || obj.prefixSignerFio == null) return false;
			else
				if ( ! inObject.prefixSignerFio.equals(obj.prefixSignerFio)){
					return false;
				}

		if(inObject.prefixSignerPostInfo == null && obj.prefixSignerPostInfo == null){}
		else
			if(inObject.prefixSignerPostInfo == null || obj.prefixSignerPostInfo == null) return false;
			else
				if ( ! inObject.prefixSignerPostInfo.equals(obj.prefixSignerPostInfo)){
					return false;
				}

		if(inObject.initiatorTabn == null && obj.initiatorTabn == null){}
		else
			if(inObject.initiatorTabn == null || obj.initiatorTabn == null) return false;
			else
				if ( ! inObject.initiatorTabn.equals(obj.initiatorTabn)){
					return false;
				}

		if(inObject.initiatorFio == null && obj.initiatorFio == null){}
		else
			if(inObject.initiatorFio == null || obj.initiatorFio == null) return false;
			else
				if ( ! inObject.initiatorFio.equals(obj.initiatorFio)){
					return false;
				}

		if(inObject.initiatorPodrName == null && obj.initiatorPodrName == null){}
		else
			if(inObject.initiatorPodrName == null || obj.initiatorPodrName == null) return false;
			else
				if ( ! inObject.initiatorPodrName.equals(obj.initiatorPodrName)){
					return false;
				}

		if (inObject.initiatorPodrCode != obj.initiatorPodrCode){
					return false;
				}

		if(inObject.designatedTabn == null && obj.designatedTabn == null){}
		else
			if(inObject.designatedTabn == null || obj.designatedTabn == null) return false;
			else
				if ( ! inObject.designatedTabn.equals(obj.designatedTabn)){
					return false;
				}

		if(inObject.designatedFio == null && obj.designatedFio == null){}
		else
			if(inObject.designatedFio == null || obj.designatedFio == null) return false;
			else
				if ( ! inObject.designatedFio.equals(obj.designatedFio)){
					return false;
				}

		if(inObject.designatedpostInfo == null && obj.designatedpostInfo == null){}
		else
			if(inObject.designatedpostInfo == null || obj.designatedpostInfo == null) return false;
			else
				if ( ! inObject.designatedpostInfo.equals(obj.designatedpostInfo)){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.responsRef.code != obj.responsRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSettingForDFDecree anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSettingForDFDecree anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSETTINGFORDFDECREE (CODE,DFDOCTYPECODE,DFDOCTYPENAME,CATALOGCODE,CATALOGNAME,DFDOCPREFIXCODE,DFDOCPREFIXNAME,PREFIXSIGNERTABN,PREFIXSIGNERFIO,PREFIXSIGNERPOSTINFO,INITIATORTABN,INITIATORFIO,INITIATORPODRNAME,INITIATORPODRCODE,DESIGNATEDTABN,DESIGNATEDFIO,DESIGNATEDPOSTINFO,DEPARTMENTREFCODE,RESPONSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.dfDocTypeCode != Integer.MIN_VALUE ) {
				statement.setInt(2, anObject.dfDocTypeCode);
			} else {
				statement.setNull(2, java.sql.Types.INTEGER);
			}
			statement.setString(3, anObject.dfDocTypeName);
			if (anObject.catalogCode != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.catalogCode);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.catalogName);
			if (anObject.dfDocPrefixCode != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.dfDocPrefixCode);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			statement.setString(7, anObject.dfDocPrefixName);
			statement.setString(8, anObject.prefixSignerTabN);
			statement.setString(9, anObject.prefixSignerFio);
			statement.setString(10, anObject.prefixSignerPostInfo);
			statement.setString(11, anObject.initiatorTabn);
			statement.setString(12, anObject.initiatorFio);
			statement.setString(13, anObject.initiatorPodrName);
			if (anObject.initiatorPodrCode != Integer.MIN_VALUE ) {
				statement.setInt(14, anObject.initiatorPodrCode);
			} else {
				statement.setNull(14, java.sql.Types.INTEGER);
			}
			statement.setString(15, anObject.designatedTabn);
			statement.setString(16, anObject.designatedFio);
			statement.setString(17, anObject.designatedpostInfo);
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSettingForDFDecree.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(18,anObject.departmentRef.code);
			} else {
				statement.setNull(18,java.sql.Types.INTEGER);
			}
			if (anObject.responsRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWarrantDAOGen(connection,getUserProfile()).exists(anObject.responsRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSettingForDFDecree.responsRef.code%} = {%"+anObject.responsRef.code+"%}");
				}
				statement.setInt(19,anObject.responsRef.code);
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
			throw new PersistenceException("Error in method {%ENSettingForDFDecreeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSettingForDFDecree anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSettingForDFDecree anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("DFDOCTYPECODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCTYPENAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CATALOGCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CATALOGNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCPREFIXCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DFDOCPREFIXNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREFIXSIGNERTABN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREFIXSIGNERFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PREFIXSIGNERPOSTINFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIATORTABN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIATORFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIATORPODRNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("INITIATORPODRCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESIGNATEDTABN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESIGNATEDFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DESIGNATEDPOSTINFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RESPONSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSETTINGFORDFDECREE SET  DFDOCTYPECODE = ? , DFDOCTYPENAME = ? , CATALOGCODE = ? , CATALOGNAME = ? , DFDOCPREFIXCODE = ? , DFDOCPREFIXNAME = ? , PREFIXSIGNERTABN = ? , PREFIXSIGNERFIO = ? , PREFIXSIGNERPOSTINFO = ? , INITIATORTABN = ? , INITIATORFIO = ? , INITIATORPODRNAME = ? , INITIATORPODRCODE = ? , DESIGNATEDTABN = ? , DESIGNATEDFIO = ? , DESIGNATEDPOSTINFO = ? , DEPARTMENTREFCODE = ? , RESPONSREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSETTINGFORDFDECREE SET ";
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
					if (anObject.dfDocTypeCode != Integer.MIN_VALUE) {
						statement.setInt(1, anObject.dfDocTypeCode);
					} else {
						statement.setNull(1, java.sql.Types.INTEGER);
					}
					statement.setString(2, anObject.dfDocTypeName);
					if (anObject.catalogCode != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.catalogCode);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.catalogName);
					if (anObject.dfDocPrefixCode != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.dfDocPrefixCode);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					statement.setString(6, anObject.dfDocPrefixName);
					statement.setString(7, anObject.prefixSignerTabN);
					statement.setString(8, anObject.prefixSignerFio);
					statement.setString(9, anObject.prefixSignerPostInfo);
					statement.setString(10, anObject.initiatorTabn);
					statement.setString(11, anObject.initiatorFio);
					statement.setString(12, anObject.initiatorPodrName);
					if (anObject.initiatorPodrCode != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.initiatorPodrCode);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setString(14, anObject.designatedTabn);
					statement.setString(15, anObject.designatedFio);
					statement.setString(16, anObject.designatedpostInfo);
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(17, anObject.departmentRef.code);
					} else {
						statement.setNull(17, java.sql.Types.INTEGER);
					}
					if (anObject.responsRef.code != Integer.MIN_VALUE) {
						statement.setInt(18, anObject.responsRef.code);
					} else {
						statement.setNull(18, java.sql.Types.INTEGER);
					}
					statement.setInt(19, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("DFDOCTYPECODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocTypeCode);
							continue;
						}
						if("DFDOCTYPENAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocTypeName);
							continue;
						}
						if("CATALOGCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.catalogCode);
							continue;
						}
						if("CATALOGNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.catalogName);
							continue;
						}
						if("DFDOCPREFIXCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.dfDocPrefixCode);
							continue;
						}
						if("DFDOCPREFIXNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.dfDocPrefixName);
							continue;
						}
						if("PREFIXSIGNERTABN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.prefixSignerTabN);
							continue;
						}
						if("PREFIXSIGNERFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.prefixSignerFio);
							continue;
						}
						if("PREFIXSIGNERPOSTINFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.prefixSignerPostInfo);
							continue;
						}
						if("INITIATORTABN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.initiatorTabn);
							continue;
						}
						if("INITIATORFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.initiatorFio);
							continue;
						}
						if("INITIATORPODRNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.initiatorPodrName);
							continue;
						}
						if("INITIATORPODRCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.initiatorPodrCode);
							continue;
						}
						if("DESIGNATEDTABN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.designatedTabn);
							continue;
						}
						if("DESIGNATEDFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.designatedFio);
							continue;
						}
						if("DESIGNATEDPOSTINFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.designatedpostInfo);
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
						if("RESPONSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.responsRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.responsRef.code);
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

	} // end of save(ENSettingForDFDecree anObject,String[] anAttributes)


	public ENSettingForDFDecreeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSettingForDFDecree filterObject = new ENSettingForDFDecree();
		Vector<ENSettingForDFDecreeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSettingForDFDecreeShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENSettingForDFDecree filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocTypeCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocTypeName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.catalogCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.catalogName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.dfDocPrefixCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.dfDocPrefixName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.prefixSignerTabN, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.prefixSignerFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.prefixSignerPostInfo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.initiatorTabn, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.initiatorFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.initiatorPodrName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.initiatorPodrCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.designatedTabn, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.designatedFio, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.designatedpostInfo, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.responsRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENSettingForDFDecreeFilter filter) {
		String out = buildCondition((ENSettingForDFDecree)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSettingForDFDecree filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSettingForDFDecree.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocTypeCode, ENSettingForDFDecree.dfDocTypeCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocTypeName, ENSettingForDFDecree.dfDocTypeName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.catalogCode, ENSettingForDFDecree.catalogCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.catalogName, ENSettingForDFDecree.catalogName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.dfDocPrefixCode, ENSettingForDFDecree.dfDocPrefixCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.dfDocPrefixName, ENSettingForDFDecree.dfDocPrefixName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.prefixSignerTabN, ENSettingForDFDecree.prefixSignerTabN_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.prefixSignerFio, ENSettingForDFDecree.prefixSignerFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.prefixSignerPostInfo, ENSettingForDFDecree.prefixSignerPostInfo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.initiatorTabn, ENSettingForDFDecree.initiatorTabn_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.initiatorFio, ENSettingForDFDecree.initiatorFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.initiatorPodrName, ENSettingForDFDecree.initiatorPodrName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.initiatorPodrCode, ENSettingForDFDecree.initiatorPodrCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.designatedTabn, ENSettingForDFDecree.designatedTabn_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.designatedFio, ENSettingForDFDecree.designatedFio_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.designatedpostInfo, ENSettingForDFDecree.designatedpostInfo_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENSettingForDFDecree.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.responsRef.code, ENSettingForDFDecree.responsRef_QFielld, out);
		}
		return out;
	}

	public ENSettingForDFDecreeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSettingForDFDecreeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSettingForDFDecreeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSettingForDFDecreeShortList getFilteredList(ENSettingForDFDecree filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSettingForDFDecreeShortList getScrollableFilteredList(ENSettingForDFDecree aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSettingForDFDecreeShortList getScrollableFilteredList(ENSettingForDFDecree aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSettingForDFDecreeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSettingForDFDecreeShortList getScrollableFilteredList(ENSettingForDFDecreeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENSettingForDFDecreeShortList getScrollableFilteredList(ENSettingForDFDecreeFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENSettingForDFDecreeShortList getScrollableFilteredList(ENSettingForDFDecree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSettingForDFDecreeShortList result = new ENSettingForDFDecreeShortList();
		ENSettingForDFDecreeShort anObject;
		result.list = new Vector<ENSettingForDFDecreeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSETTINGFORDFDECREE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSETTINGFORDFDECREE.CODE"+
			",ENSETTINGFORDFDECREE.DFDOCTYPECODE"+
			",ENSETTINGFORDFDECREE.DFDOCTYPENAME"+
			",ENSETTINGFORDFDECREE.CATALOGCODE"+
			",ENSETTINGFORDFDECREE.CATALOGNAME"+
			",ENSETTINGFORDFDECREE.DFDOCPREFIXCODE"+
			",ENSETTINGFORDFDECREE.DFDOCPREFIXNAME"+
			",ENSETTINGFORDFDECREE.PREFIXSIGNERTABN"+
			",ENSETTINGFORDFDECREE.PREFIXSIGNERFIO"+
			",ENSETTINGFORDFDECREE.PREFIXSIGNERPOSTINFO"+
			",ENSETTINGFORDFDECREE.INITIATORTABN"+
			",ENSETTINGFORDFDECREE.INITIATORFIO"+
			",ENSETTINGFORDFDECREE.INITIATORPODRNAME"+
			",ENSETTINGFORDFDECREE.INITIATORPODRCODE"+
			",ENSETTINGFORDFDECREE.DESIGNATEDTABN"+
			",ENSETTINGFORDFDECREE.DESIGNATEDFIO"+
			",ENSETTINGFORDFDECREE.DESIGNATEDPOSTINFO"+
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
			", ENWARRANT.DEPARTMENTNAME " +
			", ENWARRANT.DEPARTMENTNAMEGENITIVE " +
		" FROM ENSETTINGFORDFDECREE " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENSETTINGFORDFDECREE.DEPARTMENTREFCODE "+
			" LEFT JOIN ENWARRANT on ENWARRANT.CODE = ENSETTINGFORDFDECREE.RESPONSREFCODE "+
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
				anObject = new ENSettingForDFDecreeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeCode = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeName = set.getString(3);
				anObject.catalogCode = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.catalogCode = Integer.MIN_VALUE;
				}
				anObject.catalogName = set.getString(5);
				anObject.dfDocPrefixCode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.dfDocPrefixCode = Integer.MIN_VALUE;
				}
				anObject.dfDocPrefixName = set.getString(7);
				anObject.prefixSignerTabN = set.getString(8);
				anObject.prefixSignerFio = set.getString(9);
				anObject.prefixSignerPostInfo = set.getString(10);
				anObject.initiatorTabn = set.getString(11);
				anObject.initiatorFio = set.getString(12);
				anObject.initiatorPodrName = set.getString(13);
				anObject.initiatorPodrCode = set.getInt(14);
				if ( set.wasNull() ) {
					anObject.initiatorPodrCode = Integer.MIN_VALUE;
				}
				anObject.designatedTabn = set.getString(15);
				anObject.designatedFio = set.getString(16);
				anObject.designatedpostInfo = set.getString(17);

				anObject.departmentRefCode = set.getInt(18);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(19);
				anObject.departmentRefDateStart = set.getDate(20);
				anObject.departmentRefDateFinal = set.getDate(21);
				anObject.departmentRefRenCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(23);
				anObject.departmentRefKau_table_id_1884 = set.getInt(24);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(25);
				anObject.departmentRefName_1884 = set.getString(26);
				anObject.departmentRefHrmorganizationid = set.getString(27);
				anObject.responsRefCode = set.getInt(28);
				if(set.wasNull()) {
					anObject.responsRefCode = Integer.MIN_VALUE;
				}
				anObject.responsRefNumbergen = set.getString(29);
				anObject.responsRefName = set.getString(30);
				anObject.responsRefWarrantFIO = set.getString(31);
				anObject.responsRefWarrantShortFIO = set.getString(32);
				anObject.responsRefWarrantPosition = set.getString(33);
				anObject.responsRefGenitiveFIO = set.getString(34);
				anObject.responsRefGenitivePosition = set.getString(35);
				anObject.responsRefPassport = set.getString(36);
				anObject.responsRefAddress = set.getString(37);
				anObject.responsRefPower = set.getInt(38);
				if(set.wasNull()) {
					anObject.responsRefPower = Integer.MIN_VALUE;
				}
				anObject.responsRefMaxSum = set.getBigDecimal(39);
				if(anObject.responsRefMaxSum != null) {
					anObject.responsRefMaxSum = anObject.responsRefMaxSum.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.responsRefDepartmentName = set.getString(40);
				anObject.responsRefDepartmentNameGenitive = set.getString(41);

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
	
	public int[] getFilteredCodeArray(ENSettingForDFDecreeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSettingForDFDecreeFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSettingForDFDecree aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSETTINGFORDFDECREE.CODE FROM ENSETTINGFORDFDECREE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSETTINGFORDFDECREE.CODE";
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


	public ENSettingForDFDecree getObject(int uid) throws PersistenceException {
		ENSettingForDFDecree result = new ENSettingForDFDecree();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSettingForDFDecree anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSETTINGFORDFDECREE.CODE, ENSETTINGFORDFDECREE.DFDOCTYPECODE, ENSETTINGFORDFDECREE.DFDOCTYPENAME, ENSETTINGFORDFDECREE.CATALOGCODE, ENSETTINGFORDFDECREE.CATALOGNAME, ENSETTINGFORDFDECREE.DFDOCPREFIXCODE, ENSETTINGFORDFDECREE.DFDOCPREFIXNAME, ENSETTINGFORDFDECREE.PREFIXSIGNERTABN, ENSETTINGFORDFDECREE.PREFIXSIGNERFIO, ENSETTINGFORDFDECREE.PREFIXSIGNERPOSTINFO, ENSETTINGFORDFDECREE.INITIATORTABN, ENSETTINGFORDFDECREE.INITIATORFIO, ENSETTINGFORDFDECREE.INITIATORPODRNAME, ENSETTINGFORDFDECREE.INITIATORPODRCODE, ENSETTINGFORDFDECREE.DESIGNATEDTABN, ENSETTINGFORDFDECREE.DESIGNATEDFIO, ENSETTINGFORDFDECREE.DESIGNATEDPOSTINFO, ENSETTINGFORDFDECREE.DEPARTMENTREFCODE, ENSETTINGFORDFDECREE.RESPONSREFCODE "
			+" FROM ENSETTINGFORDFDECREE WHERE ENSETTINGFORDFDECREE.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.dfDocTypeCode = set.getInt(2);
				if (set.wasNull()) {
					anObject.dfDocTypeCode = Integer.MIN_VALUE;
				}
				anObject.dfDocTypeName = set.getString(3);
				anObject.catalogCode = set.getInt(4);
				if (set.wasNull()) {
					anObject.catalogCode = Integer.MIN_VALUE;
				}
				anObject.catalogName = set.getString(5);
				anObject.dfDocPrefixCode = set.getInt(6);
				if (set.wasNull()) {
					anObject.dfDocPrefixCode = Integer.MIN_VALUE;
				}
				anObject.dfDocPrefixName = set.getString(7);
				anObject.prefixSignerTabN = set.getString(8);
				anObject.prefixSignerFio = set.getString(9);
				anObject.prefixSignerPostInfo = set.getString(10);
				anObject.initiatorTabn = set.getString(11);
				anObject.initiatorFio = set.getString(12);
				anObject.initiatorPodrName = set.getString(13);
				anObject.initiatorPodrCode = set.getInt(14);
				if (set.wasNull()) {
					anObject.initiatorPodrCode = Integer.MIN_VALUE;
				}
				anObject.designatedTabn = set.getString(15);
				anObject.designatedFio = set.getString(16);
				anObject.designatedpostInfo = set.getString(17);
				anObject.departmentRef.code = set.getInt(18);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.responsRef.code = set.getInt(19);
				if (set.wasNull()) {
					anObject.responsRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSettingForDFDecreeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSettingForDFDecreeRef ref = new com.ksoe.energynet.valueobject.references.ENSettingForDFDecreeRef();
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

		selectStr = "DELETE FROM  ENSETTINGFORDFDECREE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSettingForDFDecree object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSettingForDFDecree.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSettingForDFDecree.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSettingForDFDecree.remove%} access denied");
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
	
	public long count(ENSettingForDFDecreeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSettingForDFDecreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSettingForDFDecreeFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSETTINGFORDFDECREE", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENSETTINGFORDFDECREE WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSettingForDFDecreeFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSETTINGFORDFDECREE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSettingForDFDecree.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSettingForDFDecree.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSETTINGFORDFDECREE.CODE FROM  ENSETTINGFORDFDECREE WHERE  ENSETTINGFORDFDECREE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSETTINGFORDFDECREE.CODE");
		_checkConditionToken(condition,"dfdoctypecode","ENSETTINGFORDFDECREE.DFDOCTYPECODE");
		_checkConditionToken(condition,"dfdoctypename","ENSETTINGFORDFDECREE.DFDOCTYPENAME");
		_checkConditionToken(condition,"catalogcode","ENSETTINGFORDFDECREE.CATALOGCODE");
		_checkConditionToken(condition,"catalogname","ENSETTINGFORDFDECREE.CATALOGNAME");
		_checkConditionToken(condition,"dfdocprefixcode","ENSETTINGFORDFDECREE.DFDOCPREFIXCODE");
		_checkConditionToken(condition,"dfdocprefixname","ENSETTINGFORDFDECREE.DFDOCPREFIXNAME");
		_checkConditionToken(condition,"prefixsignertabn","ENSETTINGFORDFDECREE.PREFIXSIGNERTABN");
		_checkConditionToken(condition,"prefixsignerfio","ENSETTINGFORDFDECREE.PREFIXSIGNERFIO");
		_checkConditionToken(condition,"prefixsignerpostinfo","ENSETTINGFORDFDECREE.PREFIXSIGNERPOSTINFO");
		_checkConditionToken(condition,"initiatortabn","ENSETTINGFORDFDECREE.INITIATORTABN");
		_checkConditionToken(condition,"initiatorfio","ENSETTINGFORDFDECREE.INITIATORFIO");
		_checkConditionToken(condition,"initiatorpodrname","ENSETTINGFORDFDECREE.INITIATORPODRNAME");
		_checkConditionToken(condition,"initiatorpodrcode","ENSETTINGFORDFDECREE.INITIATORPODRCODE");
		_checkConditionToken(condition,"designatedtabn","ENSETTINGFORDFDECREE.DESIGNATEDTABN");
		_checkConditionToken(condition,"designatedfio","ENSETTINGFORDFDECREE.DESIGNATEDFIO");
		_checkConditionToken(condition,"designatedpostinfo","ENSETTINGFORDFDECREE.DESIGNATEDPOSTINFO");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"responsref","RESPONSREFCODE");
		_checkConditionToken(condition,"responsref.code","RESPONSREFCODE");
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
	
	private void _collectAutoIncrementFields(ENSettingForDFDecree anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSETTINGFORDFDECREE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSETTINGFORDFDECREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSETTINGFORDFDECREE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSETTINGFORDFDECREE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSettingForDFDecreeDAO
