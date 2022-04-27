
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
import com.ksoe.energynet.valueobject.ENEstimateItem2Contract;
import com.ksoe.energynet.valueobject.brief.ENEstimateItem2ContractShort;
import com.ksoe.energynet.valueobject.filter.ENEstimateItem2ContractFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItem2ContractShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENEstimateItem2Contract;
 *
 */

public class ENEstimateItem2ContractDAOGen extends GenericDataMiner {

	public ENEstimateItem2ContractDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENEstimateItem2ContractDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENEstimateItem2Contract inObject) throws PersistenceException {
		ENEstimateItem2Contract obj = new ENEstimateItem2Contract();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countFact == null && obj.countFact == null){}
		else
			if(inObject.countFact == null || obj.countFact == null) return false;
			else
				if ( ! inObject.countFact.equals(obj.countFact)){
					return false;
				}

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
		if (inObject.estimateItem.code != obj.estimateItem.code){
			return false;
		}
		if (inObject.org.code != obj.org.code){
			return false;
		}
		if (inObject.rqPurchItm2Estimate.code != obj.rqPurchItm2Estimate.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENEstimateItem2Contract anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENEstimateItem2Contract anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENESTIMATEITEM2CONTRCT (CODE,COUNTFACT,CONTRACTNUMBER,CONTRACTDATE,FINDOCCODE,FINDOCID,USERGEN,DATEEDIT,ESTIMATEITEMCODE,ORGCODE,RQPURCHITM2ESTIMATECOD,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.countFact != null) {
				anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.countFact);
			statement.setString(3,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(4,null);
			} else {
				statement.setDate(4,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(5,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(6,anObject.finDocID);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			statement.setString(7,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(8,null);
			} else {
				statement.setTimestamp(8,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.estimateItem.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).exists(anObject.estimateItem.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem2Contract.estimateItem.code%} = {%"+anObject.estimateItem.code+"%}");
				}
				statement.setInt(9,anObject.estimateItem.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.org.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQOrgDAOGen(connection,getUserProfile()).exists(anObject.org.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem2Contract.org.code%} = {%"+anObject.org.code+"%}");
				}
				statement.setInt(10,anObject.org.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.rqPurchItm2Estimate.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQPurchaseItem2EstimateItemDAOGen(connection,getUserProfile()).exists(anObject.rqPurchItm2Estimate.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENEstimateItem2Contract.rqPurchItm2Estimate.code%} = {%"+anObject.rqPurchItm2Estimate.code+"%}");
				}
				statement.setInt(11,anObject.rqPurchItm2Estimate.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENEstimateItem2Contract.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(12,anObject.generalContractRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENEstimateItem2ContractDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENEstimateItem2Contract anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENEstimateItem2Contract anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("COUNTFACT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
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
					if(fieldNameStr.compareTo("ESTIMATEITEM") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORG") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RQPURCHITM2ESTIMATE") == 0) {
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
				selectStr = "UPDATE ENESTIMATEITEM2CONTRCT SET  COUNTFACT = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , FINDOCCODE = ? , FINDOCID = ? , USERGEN = ? , DATEEDIT = ? , ESTIMATEITEMCODE = ? , ORGCODE = ? , RQPURCHITM2ESTIMATECOD = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENESTIMATEITEM2CONTRACT SET ";
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
					if (anObject.countFact != null) {
						anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.countFact);
					statement.setString(2,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(3,null);
					} else {
						statement.setDate(3,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(4,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.finDocID);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setString(6,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(7,null);
					} else {
						statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.estimateItem.code != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.estimateItem.code);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					if (anObject.org.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.org.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.rqPurchItm2Estimate.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.rqPurchItm2Estimate.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.generalContractRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTFACT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countFact != null) {
								anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countFact);
							continue;
						}
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
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("ESTIMATEITEM".compareTo((String)fields.get(i)) == 0) {
							if (anObject.estimateItem.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.estimateItem.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ORG".compareTo((String)fields.get(i)) == 0) {
							if (anObject.org.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.org.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("RQPURCHITM2ESTIMATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.rqPurchItm2Estimate.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.rqPurchItm2Estimate.code);
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

	} // end of save(ENEstimateItem2Contract anObject,String[] anAttributes)


	public ENEstimateItem2ContractShort getShortObject(int anObjectCode) throws PersistenceException {
		ENEstimateItem2Contract filterObject = new ENEstimateItem2Contract();
		Vector<ENEstimateItem2ContractShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENEstimateItem2ContractShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENEstimateItem2Contract filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countFact, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.estimateItem.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.org.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.rqPurchItm2Estimate.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENEstimateItem2ContractFilter filter) {
		String out = buildCondition((ENEstimateItem2Contract)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENEstimateItem2Contract filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENEstimateItem2Contract.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countFact, ENEstimateItem2Contract.countFact_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENEstimateItem2Contract.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENEstimateItem2Contract.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENEstimateItem2Contract.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENEstimateItem2Contract.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENEstimateItem2Contract.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENEstimateItem2Contract.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.estimateItem.code, ENEstimateItem2Contract.estimateItem_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.org.code, ENEstimateItem2Contract.org_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.rqPurchItm2Estimate.code, ENEstimateItem2Contract.rqPurchItm2Estimate_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENEstimateItem2Contract.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENEstimateItem2ContractShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENEstimateItem2ContractShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENEstimateItem2ContractShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENEstimateItem2ContractShortList getFilteredList(ENEstimateItem2Contract filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2Contract aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2Contract aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2ContractFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2ContractFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENEstimateItem2ContractShortList getScrollableFilteredList(ENEstimateItem2Contract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENEstimateItem2ContractShortList result = new ENEstimateItem2ContractShortList();
		ENEstimateItem2ContractShort anObject;
		result.list = new Vector<ENEstimateItem2ContractShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENESTIMATEITEM2CONTRCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENESTIMATEITEM2CONTRCT.CODE"+
			",ENESTIMATEITEM2CONTRCT.COUNTFACT"+
			",ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER"+
			",ENESTIMATEITEM2CONTRCT.CONTRACTDATE"+
			",ENESTIMATEITEM2CONTRCT.FINDOCCODE"+
			",ENESTIMATEITEM2CONTRCT.FINDOCID"+
			",ENESTIMATEITEM2CONTRCT.USERGEN"+
			",ENESTIMATEITEM2CONTRCT.DATEEDIT"+
			", ENESTIMATEITEM.CODE " +
			", ENESTIMATEITEM.COUNTGEN " +
			", ENESTIMATEITEM.COUNTFACT " +
			", ENESTIMATEITEM.PRICE " +
			", ENESTIMATEITEM.COST " +
			", ENESTIMATEITEM.ISUSEVAT " +
			", ENESTIMATEITEM.DELIVERYTIME " +
			", ENESTIMATEITEM.USEWORKTIME " +
			", ENESTIMATEITEM.USERGEN " +
			", ENESTIMATEITEM.DATEEDIT " +
			", ENESTIMATEITEM2CONTRCT.ORGCODE" +
			", RQPURCHASEITEM2ESTMTTM.CODE " +
			", RQPURCHASEITEM2ESTMTTM.COUNTGEN " +
			", RQPURCHASEITEM2ESTMTTM.COUNTPURCHASE " +
			", RQPURCHASEITEM2ESTMTTM.STATUSCOMMENT " +
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
		" FROM ENESTIMATEITEM2CONTRCT " +
			", ENESTIMATEITEM " +
			", RQPURCHASEITEM2ESTMTTM " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENESTIMATEITEM.CODE = ENESTIMATEITEM2CONTRCT.ESTIMATEITEMCODE" ; //+
		whereStr += " AND RQPURCHASEITEM2ESTMTTM.CODE = ENESTIMATEITEM2CONTRCT.RQPURCHITM2ESTIMATECOD" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENESTIMATEITEM2CONTRCT.GENERALCONTRACTREFCODE" ; //+


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
				anObject = new ENEstimateItem2ContractShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countFact = set.getBigDecimal(2);
				if(anObject.countFact != null) {
					anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.contractNumber = set.getString(3);
				anObject.contractDate = set.getDate(4);
				anObject.finDocCode = set.getString(5);
				anObject.finDocID = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);

				anObject.estimateItemCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.estimateItemCode = Integer.MIN_VALUE;
				}
				anObject.estimateItemCountGen = set.getBigDecimal(10);
				if(anObject.estimateItemCountGen != null) {
					anObject.estimateItemCountGen = anObject.estimateItemCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemCountFact = set.getBigDecimal(11);
				if(anObject.estimateItemCountFact != null) {
					anObject.estimateItemCountFact = anObject.estimateItemCountFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemPrice = set.getBigDecimal(12);
				if(anObject.estimateItemPrice != null) {
					anObject.estimateItemPrice = anObject.estimateItemPrice.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemCost = set.getBigDecimal(13);
				if(anObject.estimateItemCost != null) {
					anObject.estimateItemCost = anObject.estimateItemCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.estimateItemIsUseVAT = set.getInt(14);
				if(set.wasNull()) {
					anObject.estimateItemIsUseVAT = Integer.MIN_VALUE;
				}
				anObject.estimateItemDeliveryTime = set.getInt(15);
				if(set.wasNull()) {
					anObject.estimateItemDeliveryTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemUseWorkTime = set.getInt(16);
				if(set.wasNull()) {
					anObject.estimateItemUseWorkTime = Integer.MIN_VALUE;
				}
				anObject.estimateItemUserGen = set.getString(17);
				anObject.estimateItemDateEdit = set.getDate(18);
				anObject.orgCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.orgCode = Integer.MIN_VALUE;
				}
				anObject.rqPurchItm2EstimateCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.rqPurchItm2EstimateCode = Integer.MIN_VALUE;
				}
				anObject.rqPurchItm2EstimateCountGen = set.getBigDecimal(21);
				if(anObject.rqPurchItm2EstimateCountGen != null) {
					anObject.rqPurchItm2EstimateCountGen = anObject.rqPurchItm2EstimateCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rqPurchItm2EstimateCountPurchase = set.getBigDecimal(22);
				if(anObject.rqPurchItm2EstimateCountPurchase != null) {
					anObject.rqPurchItm2EstimateCountPurchase = anObject.rqPurchItm2EstimateCountPurchase.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.rqPurchItm2EstimateStatusComment = set.getString(23);
				anObject.generalContractRefCode = set.getInt(24);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(25);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(26);
				anObject.generalContractRefContractNumber = set.getString(27);
				anObject.generalContractRefContractDate = set.getDate(28);
				anObject.generalContractRefCommentGen = set.getString(29);
				anObject.generalContractRefPartnerId = set.getInt(30);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(31);
				anObject.generalContractRefPartnerName = set.getString(32);
				anObject.generalContractRefContractRegDate = set.getDate(33);
				anObject.generalContractRefContractStartDate = set.getDate(34);
				anObject.generalContractRefContractEndDate = set.getDate(35);
				anObject.generalContractRefAxContractId = set.getString(36);
				anObject.generalContractRefAxContractCode = set.getString(37);
				anObject.generalContractRefAxContractNumber = set.getString(38);
				anObject.generalContractRefAxContractAccount = set.getString(39);
				anObject.generalContractRefAxContractDate = set.getDate(40);
				anObject.generalContractRefAxContractCommentGen = set.getString(41);
				anObject.generalContractRefAxContractGroupCode = set.getString(42);
				anObject.generalContractRefAxPartnerCode = set.getString(43);
				anObject.generalContractRefAxPartnerName = set.getString(44);
				anObject.generalContractRefUserGen = set.getString(45);

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

	public int[] getFilteredCodeArray(ENEstimateItem2ContractFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENEstimateItem2Contract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENESTIMATEITEM2CONTRCT.CODE FROM ENESTIMATEITEM2CONTRCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENESTIMATEITEM2CONTRCT.CODE";
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

	public ENEstimateItem2Contract getObject(int uid) throws PersistenceException {
		ENEstimateItem2Contract result = new ENEstimateItem2Contract();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENEstimateItem2Contract anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENESTIMATEITEM2CONTRCT.CODE, ENESTIMATEITEM2CONTRCT.COUNTFACT, ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER, ENESTIMATEITEM2CONTRCT.CONTRACTDATE, ENESTIMATEITEM2CONTRCT.FINDOCCODE, ENESTIMATEITEM2CONTRCT.FINDOCID, ENESTIMATEITEM2CONTRCT.USERGEN, ENESTIMATEITEM2CONTRCT.DATEEDIT, ENESTIMATEITEM2CONTRCT.ESTIMATEITEMCODE, ENESTIMATEITEM2CONTRCT.ORGCODE, ENESTIMATEITEM2CONTRCT.RQPURCHITM2ESTIMATECOD, ENESTIMATEITEM2CONTRCT.GENERALCONTRACTREFCODE "
			+" FROM ENESTIMATEITEM2CONTRCT WHERE ENESTIMATEITEM2CONTRCT.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.countFact = set.getBigDecimal(2);
			if(anObject.countFact != null) {
				anObject.countFact = anObject.countFact.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
			}
			anObject.contractNumber = set.getString(3);
			anObject.contractDate = set.getDate(4);
			anObject.finDocCode = set.getString(5);
			anObject.finDocID = set.getInt(6);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.userGen = set.getString(7);
			anObject.dateEdit = set.getTimestamp(8);
			anObject.estimateItem.code = set.getInt(9);
			if (set.wasNull()) {
				anObject.estimateItem.code = Integer.MIN_VALUE;
			}
			anObject.org.code = set.getInt(10);
			if (set.wasNull()) {
				anObject.org.code = Integer.MIN_VALUE;
			}
			anObject.rqPurchItm2Estimate.code = set.getInt(11);
			if (set.wasNull()) {
				anObject.rqPurchItm2Estimate.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(12);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.estimateItem.code != Integer.MIN_VALUE) {
				anObject.setEstimateItem(
					new com.ksoe.energynet.dataminer.generated.ENEstimateItemDAOGen(connection,getUserProfile()).getObject(anObject.estimateItem.code));
			}
			if(anObject.org.code != Integer.MIN_VALUE) {
				anObject.setOrg(
					new com.ksoe.rqorder.dataminer.generated.RQOrgDAOGen(connection,getUserProfile()).getObject(anObject.org.code));
			}
			if(anObject.rqPurchItm2Estimate.code != Integer.MIN_VALUE) {
				anObject.setRqPurchItm2Estimate(
					new com.ksoe.rqorder.dataminer.generated.RQPurchaseItem2EstimateItemDAOGen(connection,getUserProfile()).getObject(anObject.rqPurchItm2Estimate.code));
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


	public com.ksoe.energynet.valueobject.references.ENEstimateItem2ContractRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENEstimateItem2ContractRef ref = new com.ksoe.energynet.valueobject.references.ENEstimateItem2ContractRef();
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

		selectStr = "DELETE FROM  ENESTIMATEITEM2CONTRCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENEstimateItem2Contract object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENEstimateItem2Contract.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItem2Contract.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENEstimateItem2Contract.remove%} access denied");
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

	public long count(ENEstimateItem2ContractFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENEstimateItem2ContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENEstimateItem2ContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENESTIMATEITEM2CONTRCT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENEstimateItem2ContractFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENESTIMATEITEM2CONTRCT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENEstimateItem2Contract.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENEstimateItem2Contract.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENESTIMATEITEM2CONTRCT.CODE FROM  ENESTIMATEITEM2CONTRCT WHERE  ENESTIMATEITEM2CONTRCT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENESTIMATEITEM2CONTRCT.CODE");
		_checkConditionToken(condition,"countfact","ENESTIMATEITEM2CONTRCT.COUNTFACT");
		_checkConditionToken(condition,"contractnumber","ENESTIMATEITEM2CONTRCT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENESTIMATEITEM2CONTRCT.CONTRACTDATE");
		_checkConditionToken(condition,"findoccode","ENESTIMATEITEM2CONTRCT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENESTIMATEITEM2CONTRCT.FINDOCID");
		_checkConditionToken(condition,"usergen","ENESTIMATEITEM2CONTRCT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENESTIMATEITEM2CONTRCT.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"estimateitem","ESTIMATEITEMCODE");
		_checkConditionToken(condition,"estimateitem.code","ESTIMATEITEMCODE");
		_checkConditionToken(condition,"org","ORGCODE");
		_checkConditionToken(condition,"org.code","ORGCODE");
		_checkConditionToken(condition,"rqpurchitm2estimate","RQPURCHITM2ESTIMATECOD");
		_checkConditionToken(condition,"rqpurchitm2estimate.code","RQPURCHITM2ESTIMATECOD");
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

	private void _collectAutoIncrementFields(ENEstimateItem2Contract anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENESTIMATEITEM2CONTRCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENESTIMATEITEM2CONTRCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENESTIMATEITEM2CONTRCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENESTIMATEITEM2CONTRCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENEstimateItem2ContractDAO
