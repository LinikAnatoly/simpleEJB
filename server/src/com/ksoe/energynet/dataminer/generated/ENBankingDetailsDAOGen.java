
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
import com.ksoe.energynet.valueobject.ENBankingDetails;
import com.ksoe.energynet.valueobject.filter.ENBankingDetailsFilter;
import com.ksoe.energynet.valueobject.brief.ENBankingDetailsShort;
import com.ksoe.energynet.valueobject.lists.ENBankingDetailsShortList;


/**
 * DAO Object for ENBankingDetails;
 *
 */

public class ENBankingDetailsDAOGen extends GenericDataMiner {

	public ENBankingDetailsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBankingDetailsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBankingDetails inObject) throws PersistenceException {
		ENBankingDetails obj = new ENBankingDetails();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.bankname == null && obj.bankname == null){}
		else
			if(inObject.bankname == null || obj.bankname == null) return false;
			else
				if ( ! inObject.bankname.equals(obj.bankname)){
					return false;
				}

		if(inObject.bankokpo == null && obj.bankokpo == null){}
		else
			if(inObject.bankokpo == null || obj.bankokpo == null) return false;
			else
				if ( ! inObject.bankokpo.equals(obj.bankokpo)){
					return false;
				}

		if (inObject.bankmfo != obj.bankmfo){
					return false;
				}

		if(inObject.bankaccount == null && obj.bankaccount == null){}
		else
			if(inObject.bankaccount == null || obj.bankaccount == null) return false;
			else
				if ( ! inObject.bankaccount.equals(obj.bankaccount)){
					return false;
				}

		if(inObject.partnercode == null && obj.partnercode == null){}
		else
			if(inObject.partnercode == null || obj.partnercode == null) return false;
			else
				if ( ! inObject.partnercode.equals(obj.partnercode)){
					return false;
				}

		if(inObject.contract == null && obj.contract == null){}
		else
			if(inObject.contract == null || obj.contract == null) return false;
			else
				if ( ! inObject.contract.equals(obj.contract)){
					return false;
				}

		if (inObject.useDefault != obj.useDefault){
					return false;
				}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		if (inObject.billTypeRef.code != obj.billTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBankingDetails anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBankingDetails anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBANKINGDETAILS (CODE,BANKNAME,BANKOKPO,BANKMFO,BANKACCOUNT,PARTNERCODE,CONTRACT,USEDEFAULT,DEPARTMENTREFCODE,BILLTYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.bankname);
			statement.setString(3, anObject.bankokpo);
			if (anObject.bankmfo != Integer.MIN_VALUE ) {
				statement.setInt(4, anObject.bankmfo);
			} else {
				statement.setNull(4, java.sql.Types.INTEGER);
			}
			statement.setString(5, anObject.bankaccount);
			statement.setString(6, anObject.partnercode);
			statement.setString(7, anObject.contract);
			if (anObject.useDefault != Integer.MIN_VALUE ) {
				statement.setInt(8, anObject.useDefault);
			} else {
				statement.setNull(8, java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBankingDetails.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(9,anObject.departmentRef.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.billTypeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENBankingBillTypeDAOGen(connection,getUserProfile()).exists(anObject.billTypeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENBankingDetails.billTypeRef.code%} = {%"+anObject.billTypeRef.code+"%}");
				}
				statement.setInt(10,anObject.billTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENBankingDetailsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBankingDetails anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBankingDetails anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("BANKNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKOKPO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKMFO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BANKACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USEDEFAULT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BILLTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBANKINGDETAILS SET  BANKNAME = ? , BANKOKPO = ? , BANKMFO = ? , BANKACCOUNT = ? , PARTNERCODE = ? , CONTRACT = ? , USEDEFAULT = ? , DEPARTMENTREFCODE = ? , BILLTYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBANKINGDETAILS SET ";
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
					statement.setString(1, anObject.bankname);
					statement.setString(2, anObject.bankokpo);
					if (anObject.bankmfo != Integer.MIN_VALUE) {
						statement.setInt(3, anObject.bankmfo);
					} else {
						statement.setNull(3, java.sql.Types.INTEGER);
					}
					statement.setString(4, anObject.bankaccount);
					statement.setString(5, anObject.partnercode);
					statement.setString(6, anObject.contract);
					if (anObject.useDefault != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.useDefault);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.departmentRef.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.billTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.billTypeRef.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("BANKNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.bankname);
							continue;
						}
						if("BANKOKPO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.bankokpo);
							continue;
						}
						if("BANKMFO".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.bankmfo);
							continue;
						}
						if("BANKACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.bankaccount);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnercode);
							continue;
						}
						if("CONTRACT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contract);
							continue;
						}
						if("USEDEFAULT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.useDefault);
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
						if("BILLTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.billTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.billTypeRef.code);
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

	} // end of save(ENBankingDetails anObject,String[] anAttributes)


	public ENBankingDetailsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBankingDetails filterObject = new ENBankingDetails();
		Vector<ENBankingDetailsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBankingDetailsShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBankingDetails filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankname, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankokpo, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.bankmfo, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.bankaccount, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnercode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contract, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.useDefault, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.billTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBankingDetailsFilter filter) {
		String out = buildCondition((ENBankingDetails)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBankingDetails filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBankingDetails.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankname, ENBankingDetails.bankname_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankokpo, ENBankingDetails.bankokpo_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.bankmfo, ENBankingDetails.bankmfo_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.bankaccount, ENBankingDetails.bankaccount_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnercode, ENBankingDetails.partnercode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contract, ENBankingDetails.contract_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.useDefault, ENBankingDetails.useDefault_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENBankingDetails.departmentRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.billTypeRef.code, ENBankingDetails.billTypeRef_QFielld, out);
		}
		return out;
	}

	public ENBankingDetailsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBankingDetailsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBankingDetailsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBankingDetailsShortList getFilteredList(ENBankingDetails filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBankingDetailsShortList getScrollableFilteredList(ENBankingDetails aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBankingDetailsShortList getScrollableFilteredList(ENBankingDetails aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBankingDetailsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBankingDetailsShortList getScrollableFilteredList(ENBankingDetailsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBankingDetailsShortList getScrollableFilteredList(ENBankingDetailsFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBankingDetailsShortList getScrollableFilteredList(ENBankingDetails aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBankingDetailsShortList result = new ENBankingDetailsShortList();
		ENBankingDetailsShort anObject;
		result.list = new Vector<ENBankingDetailsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBANKINGDETAILS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBANKINGDETAILS.CODE"+
			",ENBANKINGDETAILS.BANKNAME"+
			",ENBANKINGDETAILS.BANKOKPO"+
			",ENBANKINGDETAILS.BANKMFO"+
			",ENBANKINGDETAILS.BANKACCOUNT"+
			",ENBANKINGDETAILS.PARTNERCODE"+
			",ENBANKINGDETAILS.CONTRACT"+
			",ENBANKINGDETAILS.USEDEFAULT"+
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
			", ENBANKINGBILLTYPE.CODE " +
			", ENBANKINGBILLTYPE.NAME " +
		" FROM ENBANKINGDETAILS " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENBANKINGDETAILS.DEPARTMENTREFCODE "+
			" LEFT JOIN ENBANKINGBILLTYPE on ENBANKINGBILLTYPE.CODE = ENBANKINGDETAILS.BILLTYPEREFCODE "+
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
				anObject = new ENBankingDetailsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.bankname = set.getString(2);
				anObject.bankokpo = set.getString(3);
				anObject.bankmfo = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.bankmfo = Integer.MIN_VALUE;
				}
				anObject.bankaccount = set.getString(5);
				anObject.partnercode = set.getString(6);
				anObject.contract = set.getString(7);
				anObject.useDefault = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.useDefault = Integer.MIN_VALUE;
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
				anObject.billTypeRefCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.billTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.billTypeRefName = set.getString(20);

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
	
	public int[] getFilteredCodeArray(ENBankingDetailsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBankingDetailsFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBankingDetails aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBANKINGDETAILS.CODE FROM ENBANKINGDETAILS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBANKINGDETAILS.CODE";
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


	public ENBankingDetails getObject(int uid) throws PersistenceException {
		ENBankingDetails result = new ENBankingDetails();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBankingDetails anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBANKINGDETAILS.CODE, ENBANKINGDETAILS.BANKNAME, ENBANKINGDETAILS.BANKOKPO, ENBANKINGDETAILS.BANKMFO, ENBANKINGDETAILS.BANKACCOUNT, ENBANKINGDETAILS.PARTNERCODE, ENBANKINGDETAILS.CONTRACT, ENBANKINGDETAILS.USEDEFAULT, ENBANKINGDETAILS.DEPARTMENTREFCODE, ENBANKINGDETAILS.BILLTYPEREFCODE "
			+" FROM ENBANKINGDETAILS WHERE ENBANKINGDETAILS.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.bankname = set.getString(2);
				anObject.bankokpo = set.getString(3);
				anObject.bankmfo = set.getInt(4);
				if (set.wasNull()) {
					anObject.bankmfo = Integer.MIN_VALUE;
				}
				anObject.bankaccount = set.getString(5);
				anObject.partnercode = set.getString(6);
				anObject.contract = set.getString(7);
				anObject.useDefault = set.getInt(8);
				if (set.wasNull()) {
					anObject.useDefault = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				anObject.billTypeRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.billTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBankingDetailsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBankingDetailsRef ref = new com.ksoe.energynet.valueobject.references.ENBankingDetailsRef();
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

		selectStr = "DELETE FROM  ENBANKINGDETAILS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBankingDetails object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBankingDetails.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENBankingDetails.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENBankingDetails.remove%} access denied");
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
	
	public long count(ENBankingDetailsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBankingDetailsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBankingDetailsFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBANKINGDETAILS", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENBANKINGDETAILS WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBankingDetailsFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBANKINGDETAILS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENBankingDetails.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENBankingDetails.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENBANKINGDETAILS.CODE FROM  ENBANKINGDETAILS WHERE  ENBANKINGDETAILS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBANKINGDETAILS.CODE");
		_checkConditionToken(condition,"bankname","ENBANKINGDETAILS.BANKNAME");
		_checkConditionToken(condition,"bankokpo","ENBANKINGDETAILS.BANKOKPO");
		_checkConditionToken(condition,"bankmfo","ENBANKINGDETAILS.BANKMFO");
		_checkConditionToken(condition,"bankaccount","ENBANKINGDETAILS.BANKACCOUNT");
		_checkConditionToken(condition,"partnercode","ENBANKINGDETAILS.PARTNERCODE");
		_checkConditionToken(condition,"contract","ENBANKINGDETAILS.CONTRACT");
		_checkConditionToken(condition,"usedefault","ENBANKINGDETAILS.USEDEFAULT");
		// relationship conditions
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"billtyperef","BILLTYPEREFCODE");
		_checkConditionToken(condition,"billtyperef.code","BILLTYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENBankingDetails anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBANKINGDETAILS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBANKINGDETAILS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBANKINGDETAILS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBANKINGDETAILS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBankingDetailsDAO
