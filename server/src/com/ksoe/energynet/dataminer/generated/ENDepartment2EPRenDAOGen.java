
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
import com.ksoe.energynet.valueobject.ENDepartment2EPRen;
import com.ksoe.energynet.valueobject.filter.ENDepartment2EPRenFilter;
import com.ksoe.energynet.valueobject.brief.ENDepartment2EPRenShort;
import com.ksoe.energynet.valueobject.lists.ENDepartment2EPRenShortList;


/**
 * DAO Object for ENDepartment2EPRen;
 *
 */

public class ENDepartment2EPRenDAOGen extends GenericDataMiner {

	public ENDepartment2EPRenDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENDepartment2EPRenDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENDepartment2EPRen inObject) throws PersistenceException {
		ENDepartment2EPRen obj = new ENDepartment2EPRen();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.billingServerIp == null && obj.billingServerIp == null){}
		else
			if(inObject.billingServerIp == null || obj.billingServerIp == null) return false;
			else
				if ( ! inObject.billingServerIp.equals(obj.billingServerIp)){
					return false;
				}

		if(inObject.billingServerJnpPort == null && obj.billingServerJnpPort == null){}
		else
			if(inObject.billingServerJnpPort == null || obj.billingServerJnpPort == null) return false;
			else
				if ( ! inObject.billingServerJnpPort.equals(obj.billingServerJnpPort)){
					return false;
				}

		if(inObject.billingServerPort == null && obj.billingServerPort == null){}
		else
			if(inObject.billingServerPort == null || obj.billingServerPort == null) return false;
			else
				if ( ! inObject.billingServerPort.equals(obj.billingServerPort)){
					return false;
				}

		if (inObject.finRenCode != obj.finRenCode){
					return false;
				}

		if(inObject.finCFOCode == null && obj.finCFOCode == null){}
		else
			if(inObject.finCFOCode == null || obj.finCFOCode == null) return false;
			else
				if ( ! inObject.finCFOCode.equals(obj.finCFOCode)){
					return false;
				}

		if(inObject.finServicesCode == null && obj.finServicesCode == null){}
		else
			if(inObject.finServicesCode == null || obj.finServicesCode == null) return false;
			else
				if ( ! inObject.finServicesCode.equals(obj.finServicesCode)){
					return false;
				}

		if (inObject.domainCode != obj.domainCode){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.renRef.code != obj.renRef.code){
			return false;
		}
		return true;
	}

	public int add(ENDepartment2EPRen anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENDepartment2EPRen anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENDEPARTMENT2EPREN (CODE,BILLINGSERVERIP,BILLINGSERVERJNPPORT,BILLINGSERVERPORT,FINRENCODE,FINCFOCODE,FINSERVICESCODE,DOMAINCODE,DEPARTMENTREFCODE,RENREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.billingServerIp);
			statement.setString(3, anObject.billingServerJnpPort);
			statement.setString(4, anObject.billingServerPort);
			if (anObject.finRenCode != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.finRenCode);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			statement.setString(6, anObject.finCFOCode);
			statement.setString(7, anObject.finServicesCode);
			if (anObject.domainCode != Integer.MIN_VALUE ) {
				statement.setInt(8, anObject.domainCode);
			} else {
				statement.setNull(8, java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENDepartment2EPRen.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(9,anObject.departmentRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.renRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energypro.dataminer.generated.EPRenDAOGen(connection,getUserProfile()).exists(anObject.renRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energypro.valueobject.ENDepartment2EPRen.renRef.code%} = {%"+anObject.renRef.code+"%}");
				}
				statement.setInt(10,anObject.renRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENDepartment2EPRenDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENDepartment2EPRen anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENDepartment2EPRen anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("BILLINGSERVERIP") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BILLINGSERVERJNPPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BILLINGSERVERPORT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINRENCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINCFOCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINSERVICESCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DOMAINCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RENREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENDEPARTMENT2EPREN SET  BILLINGSERVERIP = ? , BILLINGSERVERJNPPORT = ? , BILLINGSERVERPORT = ? , FINRENCODE = ? , FINCFOCODE = ? , FINSERVICESCODE = ? , DOMAINCODE = ? , DEPARTMENTREFCODE = ? , RENREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENDEPARTMENT2EPREN SET ";
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
					statement.setString(1, anObject.billingServerIp);
					statement.setString(2, anObject.billingServerJnpPort);
					statement.setString(3, anObject.billingServerPort);
					if (anObject.finRenCode != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.finRenCode);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					statement.setString(5, anObject.finCFOCode);
					statement.setString(6, anObject.finServicesCode);
					if (anObject.domainCode != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.domainCode);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.departmentRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.renRef.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.renRef.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("BILLINGSERVERIP".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.billingServerIp);
							continue;
						}
						if("BILLINGSERVERJNPPORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.billingServerJnpPort);
							continue;
						}
						if("BILLINGSERVERPORT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.billingServerPort);
							continue;
						}
						if("FINRENCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.finRenCode);
							continue;
						}
						if("FINCFOCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finCFOCode);
							continue;
						}
						if("FINSERVICESCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finServicesCode);
							continue;
						}
						if("DOMAINCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.domainCode);
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
						if("RENREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.renRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.renRef.code);
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

	} // end of save(ENDepartment2EPRen anObject,String[] anAttributes)


	public ENDepartment2EPRenShort getShortObject(int anObjectCode) throws PersistenceException {
		ENDepartment2EPRen filterObject = new ENDepartment2EPRen();
		Vector<ENDepartment2EPRenShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENDepartment2EPRenShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENDepartment2EPRen filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.billingServerIp, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.billingServerJnpPort, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.billingServerPort, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finRenCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finCFOCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finServicesCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.domainCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.renRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENDepartment2EPRenFilter filter) {
		String out = buildCondition((ENDepartment2EPRen)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENDepartment2EPRen filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENDepartment2EPRen.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.billingServerIp, ENDepartment2EPRen.billingServerIp_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.billingServerJnpPort, ENDepartment2EPRen.billingServerJnpPort_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.billingServerPort, ENDepartment2EPRen.billingServerPort_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finRenCode, ENDepartment2EPRen.finRenCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finCFOCode, ENDepartment2EPRen.finCFOCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finServicesCode, ENDepartment2EPRen.finServicesCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.domainCode, ENDepartment2EPRen.domainCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENDepartment2EPRen.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.renRef.code, ENDepartment2EPRen.renRef_QFielld, out);
		}
		return out;
	}

	public ENDepartment2EPRenShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENDepartment2EPRenShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENDepartment2EPRenShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENDepartment2EPRenShortList getFilteredList(ENDepartment2EPRen filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRen aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRen aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENDepartment2EPRenShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRenFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRenFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENDepartment2EPRenShortList getScrollableFilteredList(ENDepartment2EPRen aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENDepartment2EPRenShortList result = new ENDepartment2EPRenShortList();
		ENDepartment2EPRenShort anObject;
		result.list = new Vector<ENDepartment2EPRenShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDEPARTMENT2EPREN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENDEPARTMENT2EPREN.CODE"+
			",ENDEPARTMENT2EPREN.BILLINGSERVERIP"+
			",ENDEPARTMENT2EPREN.BILLINGSERVERJNPPORT"+
			",ENDEPARTMENT2EPREN.BILLINGSERVERPORT"+
			",ENDEPARTMENT2EPREN.FINRENCODE"+
			",ENDEPARTMENT2EPREN.FINCFOCODE"+
			",ENDEPARTMENT2EPREN.FINSERVICESCODE"+
			",ENDEPARTMENT2EPREN.DOMAINCODE"+
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
			", EPREN.CODE " +
			", EPREN.NAME " +
		" FROM ENDEPARTMENT2EPREN " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENDEPARTMENT2EPREN.DEPARTMENTREFCODE "+
			" LEFT JOIN EPREN on EPREN.CODE = ENDEPARTMENT2EPREN.RENREFCODE "+
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
				anObject = new ENDepartment2EPRenShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.billingServerIp = set.getString(2);
				anObject.billingServerJnpPort = set.getString(3);
				anObject.billingServerPort = set.getString(4);
				anObject.finRenCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.finRenCode = Integer.MIN_VALUE;
				}
				anObject.finCFOCode = set.getString(6);
				anObject.finServicesCode = set.getString(7);
				anObject.domainCode = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.domainCode = Integer.MIN_VALUE;
				}

				anObject.departmentRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(10);
				anObject.departmentRefDateStart = set.getDate(11);
				anObject.departmentRefDateFinal = set.getDate(12);
				anObject.departmentRefRenCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(14);
				anObject.departmentRefKau_table_id_1884 = set.getInt(15);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(16);
				anObject.departmentRefName_1884 = set.getString(17);
				anObject.departmentRefHrmorganizationid = set.getString(18);
				anObject.renRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.renRefCode = Integer.MIN_VALUE;
				}
				anObject.renRefName = set.getString(20);

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
	
	public int[] getFilteredCodeArray(ENDepartment2EPRenFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENDepartment2EPRenFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENDepartment2EPRen aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENDEPARTMENT2EPREN.CODE FROM ENDEPARTMENT2EPREN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENDEPARTMENT2EPREN.CODE";
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


	public ENDepartment2EPRen getObject(int uid) throws PersistenceException {
		ENDepartment2EPRen result = new ENDepartment2EPRen();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENDepartment2EPRen anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENDEPARTMENT2EPREN.CODE, ENDEPARTMENT2EPREN.BILLINGSERVERIP, ENDEPARTMENT2EPREN.BILLINGSERVERJNPPORT, ENDEPARTMENT2EPREN.BILLINGSERVERPORT, ENDEPARTMENT2EPREN.FINRENCODE, ENDEPARTMENT2EPREN.FINCFOCODE, ENDEPARTMENT2EPREN.FINSERVICESCODE, ENDEPARTMENT2EPREN.DOMAINCODE, ENDEPARTMENT2EPREN.DEPARTMENTREFCODE, ENDEPARTMENT2EPREN.RENREFCODE "
			+" FROM ENDEPARTMENT2EPREN WHERE ENDEPARTMENT2EPREN.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.billingServerIp = set.getString(2);
				anObject.billingServerJnpPort = set.getString(3);
				anObject.billingServerPort = set.getString(4);
				anObject.finRenCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.finRenCode = Integer.MIN_VALUE;
				}
				anObject.finCFOCode = set.getString(6);
				anObject.finServicesCode = set.getString(7);
				anObject.domainCode = set.getInt(8);
				if (set.wasNull()) {
					anObject.domainCode = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.renRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.renRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENDepartment2EPRenRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENDepartment2EPRenRef ref = new com.ksoe.energynet.valueobject.references.ENDepartment2EPRenRef();
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

		selectStr = "DELETE FROM  ENDEPARTMENT2EPREN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENDepartment2EPRen object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENDepartment2EPRen.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment2EPRen.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENDepartment2EPRen.remove%} access denied");
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
	
	public long count(ENDepartment2EPRenFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENDepartment2EPRenFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENDepartment2EPRenFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENDEPARTMENT2EPREN", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENDEPARTMENT2EPREN WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENDepartment2EPRenFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENDEPARTMENT2EPREN");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENDepartment2EPRen.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENDepartment2EPRen.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENDEPARTMENT2EPREN.CODE FROM  ENDEPARTMENT2EPREN WHERE  ENDEPARTMENT2EPREN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENDEPARTMENT2EPREN.CODE");
		_checkConditionToken(condition,"billingserverip","ENDEPARTMENT2EPREN.BILLINGSERVERIP");
		_checkConditionToken(condition,"billingserverjnpport","ENDEPARTMENT2EPREN.BILLINGSERVERJNPPORT");
		_checkConditionToken(condition,"billingserverport","ENDEPARTMENT2EPREN.BILLINGSERVERPORT");
		_checkConditionToken(condition,"finrencode","ENDEPARTMENT2EPREN.FINRENCODE");
		_checkConditionToken(condition,"fincfocode","ENDEPARTMENT2EPREN.FINCFOCODE");
		_checkConditionToken(condition,"finservicescode","ENDEPARTMENT2EPREN.FINSERVICESCODE");
		_checkConditionToken(condition,"domaincode","ENDEPARTMENT2EPREN.DOMAINCODE");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"renref","RENREFCODE");
		_checkConditionToken(condition,"renref.code","RENREFCODE");
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
	
	private void _collectAutoIncrementFields(ENDepartment2EPRen anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENDEPARTMENT2EPREN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENDEPARTMENT2EPREN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENDEPARTMENT2EPREN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENDEPARTMENT2EPREN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENDepartment2EPRenDAO
