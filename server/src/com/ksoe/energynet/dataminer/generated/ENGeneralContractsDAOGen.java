
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
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.authorization.valueobject.DataAccessType;
import com.ksoe.energynet.valueobject.ENGeneralContracts;
import com.ksoe.energynet.valueobject.brief.ENGeneralContractsShort;
import com.ksoe.energynet.valueobject.filter.ENGeneralContractsFilter;
import com.ksoe.energynet.valueobject.lists.ENGeneralContractsShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENGeneralContracts;
 *
 */

public class ENGeneralContractsDAOGen extends GenericDataMiner {

	public ENGeneralContractsDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENGeneralContractsDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENGeneralContracts inObject) throws PersistenceException {
		ENGeneralContracts obj = new ENGeneralContracts();
		obj.code = inObject.code;
		loadObject(obj);

		if (inObject.finDocID != obj.finDocID){
					return false;
				}

		if(inObject.finDocCode == null && obj.finDocCode == null){}
		else
			if(inObject.finDocCode == null || obj.finDocCode == null) return false;
			else
				if ( ! inObject.finDocCode.equals(obj.finDocCode)){
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

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
					return false;
				}

		if (inObject.partnerId != obj.partnerId){
					return false;
				}

		if(inObject.partnerCode == null && obj.partnerCode == null){}
		else
			if(inObject.partnerCode == null || obj.partnerCode == null) return false;
			else
				if ( ! inObject.partnerCode.equals(obj.partnerCode)){
					return false;
				}

		if(inObject.partnerName == null && obj.partnerName == null){}
		else
			if(inObject.partnerName == null || obj.partnerName == null) return false;
			else
				if ( ! inObject.partnerName.equals(obj.partnerName)){
					return false;
				}

		if(inObject.contractRegDate == null && obj.contractRegDate == null){} else
			if(inObject.contractRegDate == null || obj.contractRegDate == null) return false;
			else
				if (inObject.contractRegDate.compareTo(obj.contractRegDate) != 0){
					return false;
				}

		if(inObject.contractStartDate == null && obj.contractStartDate == null){} else
			if(inObject.contractStartDate == null || obj.contractStartDate == null) return false;
			else
				if (inObject.contractStartDate.compareTo(obj.contractStartDate) != 0){
					return false;
				}

		if(inObject.contractEndDate == null && obj.contractEndDate == null){} else
			if(inObject.contractEndDate == null || obj.contractEndDate == null) return false;
			else
				if (inObject.contractEndDate.compareTo(obj.contractEndDate) != 0){
					return false;
				}

		if(inObject.axContractId == null && obj.axContractId == null){}
		else
			if(inObject.axContractId == null || obj.axContractId == null) return false;
			else
				if ( ! inObject.axContractId.equals(obj.axContractId)){
					return false;
				}

		if(inObject.axContractCode == null && obj.axContractCode == null){}
		else
			if(inObject.axContractCode == null || obj.axContractCode == null) return false;
			else
				if ( ! inObject.axContractCode.equals(obj.axContractCode)){
					return false;
				}

		if(inObject.axContractNumber == null && obj.axContractNumber == null){}
		else
			if(inObject.axContractNumber == null || obj.axContractNumber == null) return false;
			else
				if ( ! inObject.axContractNumber.equals(obj.axContractNumber)){
					return false;
				}

		if(inObject.axContractAccount == null && obj.axContractAccount == null){}
		else
			if(inObject.axContractAccount == null || obj.axContractAccount == null) return false;
			else
				if ( ! inObject.axContractAccount.equals(obj.axContractAccount)){
					return false;
				}

		if(inObject.axContractDate == null && obj.axContractDate == null){} else
			if(inObject.axContractDate == null || obj.axContractDate == null) return false;
			else
				if (inObject.axContractDate.compareTo(obj.axContractDate) != 0){
					return false;
				}

		if(inObject.axContractCommentGen == null && obj.axContractCommentGen == null){}
		else
			if(inObject.axContractCommentGen == null || obj.axContractCommentGen == null) return false;
			else
				if ( ! inObject.axContractCommentGen.equals(obj.axContractCommentGen)){
					return false;
				}

		if(inObject.axContractGroupCode == null && obj.axContractGroupCode == null){}
		else
			if(inObject.axContractGroupCode == null || obj.axContractGroupCode == null) return false;
			else
				if ( ! inObject.axContractGroupCode.equals(obj.axContractGroupCode)){
					return false;
				}

		if(inObject.axPartnerCode == null && obj.axPartnerCode == null){}
		else
			if(inObject.axPartnerCode == null || obj.axPartnerCode == null) return false;
			else
				if ( ! inObject.axPartnerCode.equals(obj.axPartnerCode)){
					return false;
				}

		if(inObject.axPartnerName == null && obj.axPartnerName == null){}
		else
			if(inObject.axPartnerName == null || obj.axPartnerName == null) return false;
			else
				if ( ! inObject.axPartnerName.equals(obj.axPartnerName)){
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
		return true;
	}

	public int add(ENGeneralContracts anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENGeneralContracts anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENGENERALCONTRACTS (CODE,FINDOCID,FINDOCCODE,CONTRACTNUMBER,CONTRACTDATE,COMMENTGEN,PARTNERID,PARTNERCODE,PARTNERNAME,CONTRACTREGDATE,CONTRACTSTARTDATE,CONTRACTENDDATE,AXCONTRACTID,AXCONTRACTCODE,AXCONTRACTNUMBER,AXCONTRACTACCOUNT,AXCONTRACTDATE,AXCONTRACTCOMMENTGEN,AXCONTRACTGROUPCODE,AXPARTNERCODE,AXPARTNERNAME,USERGEN,DATEEDIT,MODIFY_TIME) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(2,anObject.finDocID);
			} else {
				statement.setNull(2,java.sql.Types.INTEGER);
			}
			statement.setString(3,anObject.finDocCode);
			statement.setString(4,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(6,anObject.commentGen);
			if (anObject.partnerId != Integer.MIN_VALUE ) {
				statement.setInt(7,anObject.partnerId);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			statement.setString(8,anObject.partnerCode);
			statement.setString(9,anObject.partnerName);
			if (anObject.contractRegDate == null) {
				statement.setDate(10,null);
			} else {
				statement.setDate(10,new java.sql.Date(anObject.contractRegDate.getTime()));
			}
			if (anObject.contractStartDate == null) {
				statement.setDate(11,null);
			} else {
				statement.setDate(11,new java.sql.Date(anObject.contractStartDate.getTime()));
			}
			if (anObject.contractEndDate == null) {
				statement.setDate(12,null);
			} else {
				statement.setDate(12,new java.sql.Date(anObject.contractEndDate.getTime()));
			}
			statement.setString(13,anObject.axContractId);
			statement.setString(14,anObject.axContractCode);
			statement.setString(15,anObject.axContractNumber);
			statement.setString(16,anObject.axContractAccount);
			if (anObject.axContractDate == null) {
				statement.setDate(17,null);
			} else {
				statement.setDate(17,new java.sql.Date(anObject.axContractDate.getTime()));
			}
			statement.setString(18,anObject.axContractCommentGen);
			statement.setString(19,anObject.axContractGroupCode);
			statement.setString(20,anObject.axPartnerCode);
			statement.setString(21,anObject.axPartnerName);
			statement.setString(22,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(23,null);
			} else {
				statement.setDate(23,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(24,null);
			} else {
				statement.setBigDecimal(24,new java.math.BigDecimal(anObject.modify_time));
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENGeneralContractsDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENGeneralContracts anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENGeneralContracts anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENGeneralContracts oldObject = new ENGeneralContracts();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENGeneralContracts.modify_time_Field+" FROM  ENGENERALCONTRACTS WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("FINDOCID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINDOCCODE") == 0) {
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
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTREGDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTSTARTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTENDDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTACCOUNT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTDATE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTCOMMENTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXCONTRACTGROUPCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXPARTNERCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("AXPARTNERNAME") == 0) {
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENGENERALCONTRACTS SET  FINDOCID = ? , FINDOCCODE = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , COMMENTGEN = ? , PARTNERID = ? , PARTNERCODE = ? , PARTNERNAME = ? , CONTRACTREGDATE = ? , CONTRACTSTARTDATE = ? , CONTRACTENDDATE = ? , AXCONTRACTID = ? , AXCONTRACTCODE = ? , AXCONTRACTNUMBER = ? , AXCONTRACTACCOUNT = ? , AXCONTRACTDATE = ? , AXCONTRACTCOMMENTGEN = ? , AXCONTRACTGROUPCODE = ? , AXPARTNERCODE = ? , AXPARTNERNAME = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENGENERALCONTRACTS SET ";
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
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(1,anObject.finDocID);
					} else {
						statement.setNull(1,java.sql.Types.INTEGER);
					}
					statement.setString(2,anObject.finDocCode);
					statement.setString(3,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(5,anObject.commentGen);
					if (anObject.partnerId != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.partnerId);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					statement.setString(7,anObject.partnerCode);
					statement.setString(8,anObject.partnerName);
					if (anObject.contractRegDate == null) {
						statement.setDate(9,null);
					} else {
						statement.setDate(9,new java.sql.Date(anObject.contractRegDate.getTime()));
					}
					if (anObject.contractStartDate == null) {
						statement.setDate(10,null);
					} else {
						statement.setDate(10,new java.sql.Date(anObject.contractStartDate.getTime()));
					}
					if (anObject.contractEndDate == null) {
						statement.setDate(11,null);
					} else {
						statement.setDate(11,new java.sql.Date(anObject.contractEndDate.getTime()));
					}
					statement.setString(12,anObject.axContractId);
					statement.setString(13,anObject.axContractCode);
					statement.setString(14,anObject.axContractNumber);
					statement.setString(15,anObject.axContractAccount);
					if (anObject.axContractDate == null) {
						statement.setDate(16,null);
					} else {
						statement.setDate(16,new java.sql.Date(anObject.axContractDate.getTime()));
					}
					statement.setString(17,anObject.axContractCommentGen);
					statement.setString(18,anObject.axContractGroupCode);
					statement.setString(19,anObject.axPartnerCode);
					statement.setString(20,anObject.axPartnerName);
					statement.setString(21,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(22,null);
					} else {
						statement.setDate(22,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(23,null);
					} else {
						statement.setBigDecimal(23,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setInt(24,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.finDocID);
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.finDocCode);
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
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
							continue;
						}
						if("PARTNERID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.partnerId);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
							continue;
						}
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerName);
							continue;
						}
						if("CONTRACTREGDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractRegDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractRegDate.getTime()));
							}
							continue;
						}
						if("CONTRACTSTARTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractStartDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractStartDate.getTime()));
							}
							continue;
						}
						if("CONTRACTENDDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractEndDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractEndDate.getTime()));
							}
							continue;
						}
						if("AXCONTRACTID".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractId);
							continue;
						}
						if("AXCONTRACTCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractCode);
							continue;
						}
						if("AXCONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractNumber);
							continue;
						}
						if("AXCONTRACTACCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractAccount);
							continue;
						}
						if("AXCONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.axContractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.axContractDate.getTime()));
							}
							continue;
						}
						if("AXCONTRACTCOMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractCommentGen);
							continue;
						}
						if("AXCONTRACTGROUPCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axContractGroupCode);
							continue;
						}
						if("AXPARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axPartnerCode);
							continue;
						}
						if("AXPARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.axPartnerName);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dateEdit.getTime()));
							}
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

	} // end of save(ENGeneralContracts anObject,String[] anAttributes)


	public ENGeneralContractsShort getShortObject(int anObjectCode) throws PersistenceException {
		ENGeneralContracts filterObject = new ENGeneralContracts();
		Vector<ENGeneralContractsShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENGeneralContractsShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENGeneralContracts filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.partnerId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractRegDate, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractStartDate, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractEndDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractId, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractAccount, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.axContractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractCommentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axContractGroupCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axPartnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.axPartnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENGeneralContractsFilter filter) {
		String out = buildCondition((ENGeneralContracts)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENGeneralContracts filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENGeneralContracts.code_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENGeneralContracts.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENGeneralContracts.finDocCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENGeneralContracts.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENGeneralContracts.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENGeneralContracts.commentGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.partnerId, ENGeneralContracts.partnerId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENGeneralContracts.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENGeneralContracts.partnerName_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractRegDate, ENGeneralContracts.contractRegDate_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractStartDate, ENGeneralContracts.contractStartDate_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractEndDate, ENGeneralContracts.contractEndDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractId, ENGeneralContracts.axContractId_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractCode, ENGeneralContracts.axContractCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractNumber, ENGeneralContracts.axContractNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractAccount, ENGeneralContracts.axContractAccount_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.axContractDate, ENGeneralContracts.axContractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractCommentGen, ENGeneralContracts.axContractCommentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axContractGroupCode, ENGeneralContracts.axContractGroupCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axPartnerCode, ENGeneralContracts.axPartnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.axPartnerName, ENGeneralContracts.axPartnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENGeneralContracts.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENGeneralContracts.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENGeneralContracts.modify_time_QFielld, out);
		}
		return out;
	}

	public ENGeneralContractsShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENGeneralContractsShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENGeneralContractsShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENGeneralContractsShortList getFilteredList(ENGeneralContracts filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(ENGeneralContracts aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(ENGeneralContracts aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(ENGeneralContractsFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(ENGeneralContractsFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENGeneralContractsShortList getScrollableFilteredList(ENGeneralContracts aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENGeneralContractsShortList result = new ENGeneralContractsShortList();
		ENGeneralContractsShort anObject;
		result.list = new Vector<ENGeneralContractsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGENERALCONTRACTS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENGENERALCONTRACTS.CODE"+
			",ENGENERALCONTRACTS.FINDOCID"+
			",ENGENERALCONTRACTS.FINDOCCODE"+
			",ENGENERALCONTRACTS.CONTRACTNUMBER"+
			",ENGENERALCONTRACTS.CONTRACTDATE"+
			",ENGENERALCONTRACTS.COMMENTGEN"+
			",ENGENERALCONTRACTS.PARTNERID"+
			",ENGENERALCONTRACTS.PARTNERCODE"+
			",ENGENERALCONTRACTS.PARTNERNAME"+
			",ENGENERALCONTRACTS.CONTRACTREGDATE"+
			",ENGENERALCONTRACTS.CONTRACTSTARTDATE"+
			",ENGENERALCONTRACTS.CONTRACTENDDATE"+
			",ENGENERALCONTRACTS.AXCONTRACTID"+
			",ENGENERALCONTRACTS.AXCONTRACTCODE"+
			",ENGENERALCONTRACTS.AXCONTRACTNUMBER"+
			",ENGENERALCONTRACTS.AXCONTRACTACCOUNT"+
			",ENGENERALCONTRACTS.AXCONTRACTDATE"+
			",ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN"+
			",ENGENERALCONTRACTS.AXCONTRACTGROUPCODE"+
			",ENGENERALCONTRACTS.AXPARTNERCODE"+
			",ENGENERALCONTRACTS.AXPARTNERNAME"+
			",ENGENERALCONTRACTS.USERGEN"+
		" FROM ENGENERALCONTRACTS " +
		"";


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
				anObject = new ENGeneralContractsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.finDocID = set.getInt(2);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.finDocCode = set.getString(3);
				anObject.contractNumber = set.getString(4);
				anObject.contractDate = set.getDate(5);
				anObject.commentGen = set.getString(6);
				anObject.partnerId = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.partnerId = Integer.MIN_VALUE;
				}
				anObject.partnerCode = set.getString(8);
				anObject.partnerName = set.getString(9);
				anObject.contractRegDate = set.getDate(10);
				anObject.contractStartDate = set.getDate(11);
				anObject.contractEndDate = set.getDate(12);
				anObject.axContractId = set.getString(13);
				anObject.axContractCode = set.getString(14);
				anObject.axContractNumber = set.getString(15);
				anObject.axContractAccount = set.getString(16);
				anObject.axContractDate = set.getDate(17);
				anObject.axContractCommentGen = set.getString(18);
				anObject.axContractGroupCode = set.getString(19);
				anObject.axPartnerCode = set.getString(20);
				anObject.axPartnerName = set.getString(21);
				anObject.userGen = set.getString(22);


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

	public int[] getFilteredCodeArray(ENGeneralContractsFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENGeneralContracts aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENGENERALCONTRACTS.CODE FROM ENGENERALCONTRACTS";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENGENERALCONTRACTS.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		if (whereStr.length() > 0) {
			whereStr += " AND " + buildCondition(aFilterObject);}
		else {
			whereStr = buildCondition(aFilterObject);
		}

		if(condition.length() != 0) {
			if(whereStr.length() != 0) {
				whereStr = whereStr + " AND ";
			}
			whereStr = whereStr + " (" + condition + ")";
		}

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

	public ENGeneralContracts getObject(int uid) throws PersistenceException {
		ENGeneralContracts result = new ENGeneralContracts();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENGeneralContracts anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENGENERALCONTRACTS.CODE, ENGENERALCONTRACTS.FINDOCID, ENGENERALCONTRACTS.FINDOCCODE, ENGENERALCONTRACTS.CONTRACTNUMBER, ENGENERALCONTRACTS.CONTRACTDATE, ENGENERALCONTRACTS.COMMENTGEN, ENGENERALCONTRACTS.PARTNERID, ENGENERALCONTRACTS.PARTNERCODE, ENGENERALCONTRACTS.PARTNERNAME, ENGENERALCONTRACTS.CONTRACTREGDATE, ENGENERALCONTRACTS.CONTRACTSTARTDATE, ENGENERALCONTRACTS.CONTRACTENDDATE, ENGENERALCONTRACTS.AXCONTRACTID, ENGENERALCONTRACTS.AXCONTRACTCODE, ENGENERALCONTRACTS.AXCONTRACTNUMBER, ENGENERALCONTRACTS.AXCONTRACTACCOUNT, ENGENERALCONTRACTS.AXCONTRACTDATE, ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN, ENGENERALCONTRACTS.AXCONTRACTGROUPCODE, ENGENERALCONTRACTS.AXPARTNERCODE, ENGENERALCONTRACTS.AXPARTNERNAME, ENGENERALCONTRACTS.USERGEN, ENGENERALCONTRACTS.DATEEDIT, ENGENERALCONTRACTS.MODIFY_TIME "
			+" FROM ENGENERALCONTRACTS WHERE ENGENERALCONTRACTS.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
				anObject.finDocID = set.getInt(2);
				if (set.wasNull()) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.finDocCode = set.getString(3);
				anObject.contractNumber = set.getString(4);
				anObject.contractDate = set.getDate(5);
				anObject.commentGen = set.getString(6);
				anObject.partnerId = set.getInt(7);
				if (set.wasNull()) {
					anObject.partnerId = Integer.MIN_VALUE;
				}
				anObject.partnerCode = set.getString(8);
				anObject.partnerName = set.getString(9);
				anObject.contractRegDate = set.getDate(10);
				anObject.contractStartDate = set.getDate(11);
				anObject.contractEndDate = set.getDate(12);
				anObject.axContractId = set.getString(13);
				anObject.axContractCode = set.getString(14);
				anObject.axContractNumber = set.getString(15);
				anObject.axContractAccount = set.getString(16);
				anObject.axContractDate = set.getDate(17);
				anObject.axContractCommentGen = set.getString(18);
				anObject.axContractGroupCode = set.getString(19);
				anObject.axPartnerCode = set.getString(20);
				anObject.axPartnerName = set.getString(21);
				anObject.userGen = set.getString(22);
				anObject.dateEdit = set.getDate(23);
				anObject.modify_time = set.getLong(24);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENGeneralContractsRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENGeneralContractsRef ref = new com.ksoe.energynet.valueobject.references.ENGeneralContractsRef();
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

		selectStr = "DELETE FROM  ENGENERALCONTRACTS WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENGeneralContracts object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENGeneralContracts.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENGeneralContracts.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENGeneralContracts.remove%} access denied");
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

	public long count(ENGeneralContractsFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENGeneralContractsFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENGeneralContractsFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENGENERALCONTRACTS", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		whereStr += buildCondition(filter);

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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENGeneralContractsFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENGENERALCONTRACTS");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENGeneralContracts.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENGeneralContracts.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENGENERALCONTRACTS.CODE FROM  ENGENERALCONTRACTS WHERE  ENGENERALCONTRACTS.CODE = ?";
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
		_checkConditionToken(condition,"code","ENGENERALCONTRACTS.CODE");
		_checkConditionToken(condition,"findocid","ENGENERALCONTRACTS.FINDOCID");
		_checkConditionToken(condition,"findoccode","ENGENERALCONTRACTS.FINDOCCODE");
		_checkConditionToken(condition,"contractnumber","ENGENERALCONTRACTS.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENGENERALCONTRACTS.CONTRACTDATE");
		_checkConditionToken(condition,"commentgen","ENGENERALCONTRACTS.COMMENTGEN");
		_checkConditionToken(condition,"partnerid","ENGENERALCONTRACTS.PARTNERID");
		_checkConditionToken(condition,"partnercode","ENGENERALCONTRACTS.PARTNERCODE");
		_checkConditionToken(condition,"partnername","ENGENERALCONTRACTS.PARTNERNAME");
		_checkConditionToken(condition,"contractregdate","ENGENERALCONTRACTS.CONTRACTREGDATE");
		_checkConditionToken(condition,"contractstartdate","ENGENERALCONTRACTS.CONTRACTSTARTDATE");
		_checkConditionToken(condition,"contractenddate","ENGENERALCONTRACTS.CONTRACTENDDATE");
		_checkConditionToken(condition,"axcontractid","ENGENERALCONTRACTS.AXCONTRACTID");
		_checkConditionToken(condition,"axcontractcode","ENGENERALCONTRACTS.AXCONTRACTCODE");
		_checkConditionToken(condition,"axcontractnumber","ENGENERALCONTRACTS.AXCONTRACTNUMBER");
		_checkConditionToken(condition,"axcontractaccount","ENGENERALCONTRACTS.AXCONTRACTACCOUNT");
		_checkConditionToken(condition,"axcontractdate","ENGENERALCONTRACTS.AXCONTRACTDATE");
		_checkConditionToken(condition,"axcontractcommentgen","ENGENERALCONTRACTS.AXCONTRACTCOMMENTGEN");
		_checkConditionToken(condition,"axcontractgroupcode","ENGENERALCONTRACTS.AXCONTRACTGROUPCODE");
		_checkConditionToken(condition,"axpartnercode","ENGENERALCONTRACTS.AXPARTNERCODE");
		_checkConditionToken(condition,"axpartnername","ENGENERALCONTRACTS.AXPARTNERNAME");
		_checkConditionToken(condition,"usergen","ENGENERALCONTRACTS.USERGEN");
		_checkConditionToken(condition,"dateedit","ENGENERALCONTRACTS.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENGENERALCONTRACTS.MODIFY_TIME");
		// relationship conditions
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

	private void _collectAutoIncrementFields(ENGeneralContracts anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENGENERALCONTRACTS", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENGENERALCONTRACTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENGENERALCONTRACTS", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENGENERALCONTRACTS");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENGeneralContractsDAO
