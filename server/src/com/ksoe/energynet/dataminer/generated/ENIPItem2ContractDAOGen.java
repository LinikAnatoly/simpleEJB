
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENIPItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENIPItem2ContractShort;
import com.ksoe.energynet.valueobject.filter.ENIPItem2ContractFilter;
import com.ksoe.energynet.valueobject.lists.ENIPItem2ContractShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENIPItem2Contract;
 *
 */

public class ENIPItem2ContractDAOGen extends GenericDataMiner {

	public ENIPItem2ContractDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENIPItem2ContractDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENIPItem2Contract inObject) throws PersistenceException {
		ENIPItem2Contract obj = new ENIPItem2Contract();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.contractNumber == null && obj.contractNumber == null){}
		else
			if(inObject.contractNumber == null || obj.contractNumber == null) return false;
			else
				if ( ! inObject.contractNumber.equals(obj.contractNumber)){
					return false;
				}

		if(inObject.contractDate == null && obj.contractDate == null){} else
			if(inObject.contractDate == null || obj.contractDate == null) return false;
			else
				if (inObject.contractDate.compareTo(obj.contractDate) != 0){
					return false;
				}

		if(inObject.finDocCode == null && obj.finDocCode == null){}
		else
			if(inObject.finDocCode == null || obj.finDocCode == null) return false;
			else
				if ( ! inObject.finDocCode.equals(obj.finDocCode)){
					return false;
				}

		if (inObject.finDocID != obj.finDocID){
					return false;
				}

		if (inObject.orgId != obj.orgId){
					return false;
				}

		if(inObject.orgName == null && obj.orgName == null){}
		else
			if(inObject.orgName == null || obj.orgName == null) return false;
			else
				if ( ! inObject.orgName.equals(obj.orgName)){
					return false;
				}

		if(inObject.orgUkrName == null && obj.orgUkrName == null){}
		else
			if(inObject.orgUkrName == null || obj.orgUkrName == null) return false;
			else
				if ( ! inObject.orgUkrName.equals(obj.orgUkrName)){
					return false;
				}

		if(inObject.orgCode == null && obj.orgCode == null){}
		else
			if(inObject.orgCode == null || obj.orgCode == null) return false;
			else
				if ( ! inObject.orgCode.equals(obj.orgCode)){
					return false;
				}
		if (inObject.ipItemRef.code != obj.ipItemRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENIPItem2Contract anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENIPItem2Contract anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENIPITEM2CONTRACT (CODE,CONTRACTNUMBER,CONTRACTDATE,FINDOCCODE,FINDOCID,ORGID,ORGNAME,ORGUKRNAME,ORGCODE,IPITEMREFCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(4,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.finDocID);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.orgId != Integer.MIN_VALUE ) {
				statement.setInt(6,anObject.orgId);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			statement.setString(7,anObject.orgName);
			statement.setString(8,anObject.orgUkrName);
			statement.setString(9,anObject.orgCode);
			if (anObject.ipItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).exists(anObject.ipItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2Contract.ipItemRef.code%} = {%"+anObject.ipItemRef.code+"%}");
				}
				statement.setInt(10,anObject.ipItemRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2Contract.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(11,anObject.generalContractRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENIPItem2ContractDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENIPItem2Contract anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENIPItem2Contract anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("CONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORGID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORGNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORGUKRNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORGCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("IPITEMREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENERALCONTRACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENIPITEM2CONTRACT SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , FINDOCCODE = ? , FINDOCID = ? , ORGID = ? , ORGNAME = ? , ORGUKRNAME = ? , ORGCODE = ? , IPITEMREFCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENIPITEM2CONTRACT SET ";
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
					statement.setString(1,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(3,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.finDocID);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					if (anObject.orgId != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.orgId);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setString(6,anObject.orgName);
					statement.setString(7,anObject.orgUkrName);
					statement.setString(8,anObject.orgCode);
					if (anObject.ipItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.ipItemRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.generalContractRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setInt(11,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocID);
							continue;
						}
						if("ORGID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.orgId);
							continue;
						}
						if("ORGNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.orgName);
							continue;
						}
						if("ORGUKRNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.orgUkrName);
							continue;
						}
						if("ORGCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.orgCode);
							continue;
						}
						if("IPITEMREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ipItemRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.ipItemRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GENERALCONTRACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.generalContractRef.code);
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

	} // end of save(ENIPItem2Contract anObject,String[] anAttributes)


	public ENIPItem2ContractShort getShortObject(int anObjectCode) throws PersistenceException {
		ENIPItem2Contract filterObject = new ENIPItem2Contract();
		Vector<ENIPItem2ContractShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENIPItem2ContractShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENIPItem2Contract filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.orgId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.orgName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.orgUkrName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.orgCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ipItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENIPItem2ContractFilter filter) {
		String out = buildCondition((ENIPItem2Contract)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENIPItem2Contract filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENIPItem2Contract.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENIPItem2Contract.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENIPItem2Contract.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENIPItem2Contract.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENIPItem2Contract.finDocID_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.orgId, ENIPItem2Contract.orgId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.orgName, ENIPItem2Contract.orgName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.orgUkrName, ENIPItem2Contract.orgUkrName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.orgCode, ENIPItem2Contract.orgCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ipItemRef.code, ENIPItem2Contract.ipItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENIPItem2Contract.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENIPItem2ContractShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENIPItem2ContractShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENIPItem2ContractShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENIPItem2ContractShortList getFilteredList(ENIPItem2Contract filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2Contract aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2Contract aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2ContractFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2ContractFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENIPItem2ContractShortList getScrollableFilteredList(ENIPItem2Contract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENIPItem2ContractShortList result = new ENIPItem2ContractShortList();
		ENIPItem2ContractShort anObject;
		result.list = new Vector<ENIPItem2ContractShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM2CONTRACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENIPITEM2CONTRACT.CODE"+
			",ENIPITEM2CONTRACT.CONTRACTNUMBER"+
			",ENIPITEM2CONTRACT.CONTRACTDATE"+
			",ENIPITEM2CONTRACT.FINDOCCODE"+
			",ENIPITEM2CONTRACT.FINDOCID"+
			",ENIPITEM2CONTRACT.ORGID"+
			",ENIPITEM2CONTRACT.ORGNAME"+
			",ENIPITEM2CONTRACT.ORGUKRNAME"+
			",ENIPITEM2CONTRACT.ORGCODE"+
			", ENIPITEM.CODE " +
			", ENIPITEM.NAME " +
			", ENIPITEM.BUHNAME " +
			", ENIPITEM.ITEMNUMBER " +
			", ENIPITEM.INVNUMBER " +
			", ENIPITEM.ISPROJECTDOCUMENT " +
			", ENIPITEM.FINANCING " +
			", ENIPITEM.COMMENTGEN " +
			", ENIPITEM.COUNTGEN " +
			", ENIPITEM.PRICE " +
			", ENIPITEM.SUMGEN " +
			", ENIPITEM.QUARTER1COUNT " +
			", ENIPITEM.QUARTER1SUM " +
			", ENIPITEM.QUARTER2COUNT " +
			", ENIPITEM.QUARTER2SUM " +
			", ENIPITEM.QUARTER3COUNT " +
			", ENIPITEM.QUARTER3SUM " +
			", ENIPITEM.QUARTER4COUNT " +
			", ENIPITEM.QUARTER4SUM " +
			", ENIPITEM.COUNTGENINSIDE " +
			", ENIPITEM.PRICEINSIDE " +
			", ENIPITEM.SUMGENINSIDE " +
			", ENIPITEM.MM1COUNTINSIDE " +
			", ENIPITEM.MM1SUMINSIDE " +
			", ENIPITEM.MM2COUNTINSIDE " +
			", ENIPITEM.MM2SUMINSIDE " +
			", ENIPITEM.MM3COUNTINSIDE " +
			", ENIPITEM.MM3SUMINSIDE " +
			", ENIPITEM.MM4COUNTINSIDE " +
			", ENIPITEM.MM4SUMINSIDE " +
			", ENIPITEM.MM5COUNTINSIDE " +
			", ENIPITEM.MM5SUMINSIDE " +
			", ENIPITEM.MM6COUNTINSIDE " +
			", ENIPITEM.MM6SUMINSIDE " +
			", ENIPITEM.MM7COUNTINSIDE " +
			", ENIPITEM.MM7SUMINSIDE " +
			", ENIPITEM.MM8COUNTINSIDE " +
			", ENIPITEM.MM8SUMINSIDE " +
			", ENIPITEM.MM9COUNTINSIDE " +
			", ENIPITEM.MM9SUMINSIDE " +
			", ENIPITEM.MM10COUNTINSIDE " +
			", ENIPITEM.MM10SUMINSIDE " +
			", ENIPITEM.MM11COUNTINSIDE " +
			", ENIPITEM.MM11SUMINSIDE " +
			", ENIPITEM.MM12COUNTINSIDE " +
			", ENIPITEM.MM12SUMINSIDE " +
			", ENIPITEM.INFOTENDERS " +
			", ENIPITEM.USERADD " +
			", ENIPITEM.DATEADD " +
			", ENIPITEM.USERGEN " +
			", ENIPITEM.DATEEDIT " +
			", ENGENERALCONTRACTS.CODE " +
			", ENGENERALCONTRACTS.FINDOCID " +
			", ENGENERALCONTRACTS.FINDOCCODE " +
			", ENGENERALCONTRACTS.CONTRACTNUMBER " +
			", ENGENERALCONTRACTS.CONTRACTDATE " +
			", ENGENERALCONTRACTS.COMMENTGEN " +
			", ENGENERALCONTRACTS.PARTNERID " +
			", ENGENERALCONTRACTS.PARTNERCODE " +
			", ENGENERALCONTRACTS.PARTNERNAME " +
			", ENGENERALCONTRACTS.CONTRACTREGDATE " +
			", ENGENERALCONTRACTS.CONTRACTSTARTDATE " +
			", ENGENERALCONTRACTS.CONTRACTENDDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTID " +
			", ENGENERALCONTRACTS.AXCONTRACTCODE " +
			", ENGENERALCONTRACTS.AXCONTRACTNUMBER " +
			", ENGENERALCONTRACTS.AXCONTRACTACCOUNT " +
			", ENGENERALCONTRACTS.AXCONTRACTDATE " +
			", ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN " +
			", ENGENERALCONTRACTS.AXCONTRACTGROUPCODE " +
			", ENGENERALCONTRACTS.AXPARTNERCODE " +
			", ENGENERALCONTRACTS.AXPARTNERNAME " +
			", ENGENERALCONTRACTS.USERGEN " +
		" FROM ENIPITEM2CONTRACT " +
			", ENIPITEM " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENIPITEM.CODE = ENIPITEM2CONTRACT.IPITEMREFCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENIPITEM2CONTRACT.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);
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
				anObject = new ENIPItem2ContractShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.finDocCode = set.getString(4);
				anObject.finDocID = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.orgId = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.orgId = Integer.MIN_VALUE;
				}
				anObject.orgName = set.getString(7);
				anObject.orgUkrName = set.getString(8);
				anObject.orgCode = set.getString(9);

				anObject.ipItemRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.ipItemRefCode = Integer.MIN_VALUE;
				}
				anObject.ipItemRefName = set.getString(11);
				anObject.ipItemRefBuhName = set.getString(12);
				anObject.ipItemRefItemNumber = set.getString(13);
				anObject.ipItemRefInvNumber = set.getString(14);
				anObject.ipItemRefIsProjectDocument = set.getInt(15);
				if(set.wasNull()) {
					anObject.ipItemRefIsProjectDocument = Integer.MIN_VALUE;
				}
				anObject.ipItemRefFinancing = set.getString(16);
				anObject.ipItemRefCommentGen = set.getString(17);
				anObject.ipItemRefCountGen = set.getBigDecimal(18);
				if(anObject.ipItemRefCountGen != null) {
					anObject.ipItemRefCountGen = anObject.ipItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPrice = set.getBigDecimal(19);
				if(anObject.ipItemRefPrice != null) {
					anObject.ipItemRefPrice = anObject.ipItemRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGen = set.getBigDecimal(20);
				if(anObject.ipItemRefSumGen != null) {
					anObject.ipItemRefSumGen = anObject.ipItemRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1count = set.getBigDecimal(21);
				if(anObject.ipItemRefQuarter1count != null) {
					anObject.ipItemRefQuarter1count = anObject.ipItemRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1sum = set.getBigDecimal(22);
				if(anObject.ipItemRefQuarter1sum != null) {
					anObject.ipItemRefQuarter1sum = anObject.ipItemRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2count = set.getBigDecimal(23);
				if(anObject.ipItemRefQuarter2count != null) {
					anObject.ipItemRefQuarter2count = anObject.ipItemRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2sum = set.getBigDecimal(24);
				if(anObject.ipItemRefQuarter2sum != null) {
					anObject.ipItemRefQuarter2sum = anObject.ipItemRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3count = set.getBigDecimal(25);
				if(anObject.ipItemRefQuarter3count != null) {
					anObject.ipItemRefQuarter3count = anObject.ipItemRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3sum = set.getBigDecimal(26);
				if(anObject.ipItemRefQuarter3sum != null) {
					anObject.ipItemRefQuarter3sum = anObject.ipItemRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4count = set.getBigDecimal(27);
				if(anObject.ipItemRefQuarter4count != null) {
					anObject.ipItemRefQuarter4count = anObject.ipItemRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4sum = set.getBigDecimal(28);
				if(anObject.ipItemRefQuarter4sum != null) {
					anObject.ipItemRefQuarter4sum = anObject.ipItemRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefCountGenInside = set.getBigDecimal(29);
				if(anObject.ipItemRefCountGenInside != null) {
					anObject.ipItemRefCountGenInside = anObject.ipItemRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPriceInside = set.getBigDecimal(30);
				if(anObject.ipItemRefPriceInside != null) {
					anObject.ipItemRefPriceInside = anObject.ipItemRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGenInside = set.getBigDecimal(31);
				if(anObject.ipItemRefSumGenInside != null) {
					anObject.ipItemRefSumGenInside = anObject.ipItemRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1countInside = set.getBigDecimal(32);
				if(anObject.ipItemRefMm1countInside != null) {
					anObject.ipItemRefMm1countInside = anObject.ipItemRefMm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1sumInside = set.getBigDecimal(33);
				if(anObject.ipItemRefMm1sumInside != null) {
					anObject.ipItemRefMm1sumInside = anObject.ipItemRefMm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2countInside = set.getBigDecimal(34);
				if(anObject.ipItemRefMm2countInside != null) {
					anObject.ipItemRefMm2countInside = anObject.ipItemRefMm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2sumInside = set.getBigDecimal(35);
				if(anObject.ipItemRefMm2sumInside != null) {
					anObject.ipItemRefMm2sumInside = anObject.ipItemRefMm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3countInside = set.getBigDecimal(36);
				if(anObject.ipItemRefMm3countInside != null) {
					anObject.ipItemRefMm3countInside = anObject.ipItemRefMm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3sumInside = set.getBigDecimal(37);
				if(anObject.ipItemRefMm3sumInside != null) {
					anObject.ipItemRefMm3sumInside = anObject.ipItemRefMm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4countInside = set.getBigDecimal(38);
				if(anObject.ipItemRefMm4countInside != null) {
					anObject.ipItemRefMm4countInside = anObject.ipItemRefMm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4sumInside = set.getBigDecimal(39);
				if(anObject.ipItemRefMm4sumInside != null) {
					anObject.ipItemRefMm4sumInside = anObject.ipItemRefMm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5countInside = set.getBigDecimal(40);
				if(anObject.ipItemRefMm5countInside != null) {
					anObject.ipItemRefMm5countInside = anObject.ipItemRefMm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5sumInside = set.getBigDecimal(41);
				if(anObject.ipItemRefMm5sumInside != null) {
					anObject.ipItemRefMm5sumInside = anObject.ipItemRefMm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6countInside = set.getBigDecimal(42);
				if(anObject.ipItemRefMm6countInside != null) {
					anObject.ipItemRefMm6countInside = anObject.ipItemRefMm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6sumInside = set.getBigDecimal(43);
				if(anObject.ipItemRefMm6sumInside != null) {
					anObject.ipItemRefMm6sumInside = anObject.ipItemRefMm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7countInside = set.getBigDecimal(44);
				if(anObject.ipItemRefMm7countInside != null) {
					anObject.ipItemRefMm7countInside = anObject.ipItemRefMm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7sumInside = set.getBigDecimal(45);
				if(anObject.ipItemRefMm7sumInside != null) {
					anObject.ipItemRefMm7sumInside = anObject.ipItemRefMm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8countInside = set.getBigDecimal(46);
				if(anObject.ipItemRefMm8countInside != null) {
					anObject.ipItemRefMm8countInside = anObject.ipItemRefMm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8sumInside = set.getBigDecimal(47);
				if(anObject.ipItemRefMm8sumInside != null) {
					anObject.ipItemRefMm8sumInside = anObject.ipItemRefMm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9countInside = set.getBigDecimal(48);
				if(anObject.ipItemRefMm9countInside != null) {
					anObject.ipItemRefMm9countInside = anObject.ipItemRefMm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9sumInside = set.getBigDecimal(49);
				if(anObject.ipItemRefMm9sumInside != null) {
					anObject.ipItemRefMm9sumInside = anObject.ipItemRefMm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10countInside = set.getBigDecimal(50);
				if(anObject.ipItemRefMm10countInside != null) {
					anObject.ipItemRefMm10countInside = anObject.ipItemRefMm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10sumInside = set.getBigDecimal(51);
				if(anObject.ipItemRefMm10sumInside != null) {
					anObject.ipItemRefMm10sumInside = anObject.ipItemRefMm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11countInside = set.getBigDecimal(52);
				if(anObject.ipItemRefMm11countInside != null) {
					anObject.ipItemRefMm11countInside = anObject.ipItemRefMm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11sumInside = set.getBigDecimal(53);
				if(anObject.ipItemRefMm11sumInside != null) {
					anObject.ipItemRefMm11sumInside = anObject.ipItemRefMm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12countInside = set.getBigDecimal(54);
				if(anObject.ipItemRefMm12countInside != null) {
					anObject.ipItemRefMm12countInside = anObject.ipItemRefMm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12sumInside = set.getBigDecimal(55);
				if(anObject.ipItemRefMm12sumInside != null) {
					anObject.ipItemRefMm12sumInside = anObject.ipItemRefMm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefInfoTenders = set.getString(56);
				anObject.ipItemRefUserAdd = set.getString(57);
				anObject.ipItemRefDateAdd = set.getTimestamp(58);
				anObject.ipItemRefUserGen = set.getString(59);
				anObject.ipItemRefDateEdit = set.getTimestamp(60);
				anObject.generalContractRefCode = set.getInt(61);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(62);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(63);
				anObject.generalContractRefContractNumber = set.getString(64);
				anObject.generalContractRefContractDate = set.getDate(65);
				anObject.generalContractRefCommentGen = set.getString(66);
				anObject.generalContractRefPartnerId = set.getInt(67);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(68);
				anObject.generalContractRefPartnerName = set.getString(69);
				anObject.generalContractRefContractRegDate = set.getDate(70);
				anObject.generalContractRefContractStartDate = set.getDate(71);
				anObject.generalContractRefContractEndDate = set.getDate(72);
				anObject.generalContractRefAxContractId = set.getString(73);
				anObject.generalContractRefAxContractCode = set.getString(74);
				anObject.generalContractRefAxContractNumber = set.getString(75);
				anObject.generalContractRefAxContractAccount = set.getString(76);
				anObject.generalContractRefAxContractDate = set.getDate(77);
				anObject.generalContractRefAxContractCommentGen = set.getString(78);
				anObject.generalContractRefAxContractGroupCode = set.getString(79);
				anObject.generalContractRefAxPartnerCode = set.getString(80);
				anObject.generalContractRefAxPartnerName = set.getString(81);
				anObject.generalContractRefUserGen = set.getString(82);

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

	public int[] getFilteredCodeArray(ENIPItem2ContractFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENIPItem2Contract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENIPITEM2CONTRACT.CODE FROM ENIPITEM2CONTRACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM2CONTRACT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		whereStr = BaseDAOUtils.addToCondition(condition, whereStr);

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
				result.add(new Integer(set.getInt(1)));
			}

			int[] array = new int[result.size()];
			for(int j = 0;j < result.size();j++) {
				array[j] = ((Integer)result.get(j)).intValue();
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

	public ENIPItem2Contract getObject(int uid) throws PersistenceException {
		ENIPItem2Contract result = new ENIPItem2Contract();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENIPItem2Contract anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENIPITEM2CONTRACT.CODE, ENIPITEM2CONTRACT.CONTRACTNUMBER, ENIPITEM2CONTRACT.CONTRACTDATE, ENIPITEM2CONTRACT.FINDOCCODE, ENIPITEM2CONTRACT.FINDOCID, ENIPITEM2CONTRACT.ORGID, ENIPITEM2CONTRACT.ORGNAME, ENIPITEM2CONTRACT.ORGUKRNAME, ENIPITEM2CONTRACT.ORGCODE, ENIPITEM2CONTRACT.IPITEMREFCODE, ENIPITEM2CONTRACT.GENERALCONTRACTREFCODE "
			+" FROM ENIPITEM2CONTRACT WHERE ENIPITEM2CONTRACT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.contractNumber = set.getString(2);
			anObject.contractDate = set.getDate(3);
			anObject.finDocCode = set.getString(4);
			anObject.finDocID = set.getInt(5);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.orgId = set.getInt(6);
			if (set.wasNull()) {
				anObject.orgId = Integer.MIN_VALUE;
			}
			anObject.orgName = set.getString(7);
			anObject.orgUkrName = set.getString(8);
			anObject.orgCode = set.getString(9);
			anObject.ipItemRef.code = set.getInt(10);
			if (set.wasNull()) {
				anObject.ipItemRef.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(11);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.ipItemRef.code != Integer.MIN_VALUE) {
				anObject.setIpItemRef(
					new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).getRef(anObject.ipItemRef.code));
			}
			if(anObject.generalContractRef.code != Integer.MIN_VALUE) {
				anObject.setGeneralContractRef(
					new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).getRef(anObject.generalContractRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENIPItem2ContractRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENIPItem2ContractRef ref = new com.ksoe.energynet.valueobject.references.ENIPItem2ContractRef();
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

		selectStr = "DELETE FROM  ENIPITEM2CONTRACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENIPItem2Contract object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENIPItem2Contract.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2Contract.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem2Contract.remove%} access denied");
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

	public long count(ENIPItem2ContractFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENIPItem2ContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENIPItem2ContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENIPITEM2CONTRACT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENIPItem2ContractFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENIPITEM2CONTRACT");
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
				_bindObjectsToPreparedStatement(statement,bindObjects,number);
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2Contract.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem2Contract.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENIPITEM2CONTRACT.CODE FROM  ENIPITEM2CONTRACT WHERE  ENIPITEM2CONTRACT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENIPITEM2CONTRACT.CODE");
		_checkConditionToken(condition,"contractnumber","ENIPITEM2CONTRACT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENIPITEM2CONTRACT.CONTRACTDATE");
		_checkConditionToken(condition,"findoccode","ENIPITEM2CONTRACT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENIPITEM2CONTRACT.FINDOCID");
		_checkConditionToken(condition,"orgid","ENIPITEM2CONTRACT.ORGID");
		_checkConditionToken(condition,"orgname","ENIPITEM2CONTRACT.ORGNAME");
		_checkConditionToken(condition,"orgukrname","ENIPITEM2CONTRACT.ORGUKRNAME");
		_checkConditionToken(condition,"orgcode","ENIPITEM2CONTRACT.ORGCODE");
		// relationship conditions
		_checkConditionToken(condition,"ipitemref","IPITEMREFCODE");
		_checkConditionToken(condition,"ipitemref.code","IPITEMREFCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
		return condition.toString();
	}

	@Override
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

	private void _collectAutoIncrementFields(ENIPItem2Contract anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENIPITEM2CONTRACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENIPITEM2CONTRACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENIPITEM2CONTRACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENIPITEM2CONTRACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENIPItem2ContractDAO
