
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
import com.ksoe.energynet.valueobject.ENContract;
import com.ksoe.energynet.valueobject.brief.ENContractShort;
import com.ksoe.energynet.valueobject.filter.ENContractFilter;
import com.ksoe.energynet.valueobject.lists.ENContractShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENContract;
 *
 */

public class ENContractDAOGen extends GenericDataMiner {

	public ENContractDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENContractDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENContract inObject) throws PersistenceException {
		ENContract obj = new ENContract();
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

		if(inObject.contractEndDate == null && obj.contractEndDate == null){} else
			if(inObject.contractEndDate == null || obj.contractEndDate == null) return false;
			else
				if (inObject.contractEndDate.compareTo(obj.contractEndDate) != 0){
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

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
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
		if (inObject.org.code != obj.org.code){
			return false;
		}
		if (inObject.contractType.code != obj.contractType.code){
			return false;
		}
		if (inObject.purchaseItemTender.code != obj.purchaseItemTender.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENContract anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENContract anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCONTRACT (CODE,CONTRACTNUMBER,CONTRACTDATE,CONTRACTENDDATE,FINDOCCODE,FINDOCID,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,ORGCODE,CONTRACTTYPECODE,PURCHASEITEMTENDERCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

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
			if (anObject.contractEndDate == null) {
				statement.setDate(4,null);
			} else {
				statement.setDate(4,new java.sql.Date(anObject.contractEndDate.getTime()));
			}
			statement.setString(5,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(6,anObject.finDocID);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			statement.setString(7,anObject.commentGen);
			statement.setString(8,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(9,null);
			} else {
				statement.setDate(9,new java.sql.Date(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(10,null);
			} else {
				statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.org.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQOrgDAOGen(connection,getUserProfile()).exists(anObject.org.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContract.org.code%} = {%"+anObject.org.code+"%}");
				}
				statement.setInt(11,anObject.org.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.contractType.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENContractTypeDAOGen(connection,getUserProfile()).exists(anObject.contractType.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContract.contractType.code%} = {%"+anObject.contractType.code+"%}");
				}
				statement.setInt(12,anObject.contractType.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.purchaseItemTender.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQPurchaseItemTenderDAOGen(connection,getUserProfile()).exists(anObject.purchaseItemTender.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENContract.purchaseItemTender.code%} = {%"+anObject.purchaseItemTender.code+"%}");
				}
				statement.setInt(13,anObject.purchaseItemTender.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENContract.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(14,anObject.generalContractRef.code);
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
			throw new PersistenceException("Error in method {%ENContractDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENContract anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENContract anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENContract oldObject = new ENContract();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENContract.modify_time_Field+" FROM  ENCONTRACT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CONTRACTENDDATE") == 0) {
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
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ORG") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CONTRACTTYPE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PURCHASEITEMTENDER") == 0) {
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
				selectStr = "UPDATE ENCONTRACT SET  CONTRACTNUMBER = ? , CONTRACTDATE = ? , CONTRACTENDDATE = ? , FINDOCCODE = ? , FINDOCID = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , ORGCODE = ? , CONTRACTTYPECODE = ? , PURCHASEITEMTENDERCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCONTRACT SET ";
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
					if (anObject.contractEndDate == null) {
						statement.setDate(3,null);
					} else {
						statement.setDate(3,new java.sql.Date(anObject.contractEndDate.getTime()));
					}
					statement.setString(4,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.finDocID);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					statement.setString(6,anObject.commentGen);
					statement.setString(7,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(8,null);
					} else {
						statement.setDate(8,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(9,null);
					} else {
						statement.setBigDecimal(9,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.org.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.org.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.contractType.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.contractType.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.purchaseItemTender.code != Integer.MIN_VALUE) {
						statement.setInt(12,anObject.purchaseItemTender.code);
					} else {
						statement.setNull(12,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(13,anObject.generalContractRef.code);
					} else {
						statement.setNull(13,java.sql.Types.INTEGER);
					}
					statement.setInt(14,anObject.code);
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
						if("CONTRACTENDDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractEndDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.contractEndDate.getTime()));
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
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
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
						if("ORG".compareTo((String)fields.get(i)) == 0) {
							if (anObject.org.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.org.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CONTRACTTYPE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractType.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.contractType.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PURCHASEITEMTENDER".compareTo((String)fields.get(i)) == 0) {
							if (anObject.purchaseItemTender.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.purchaseItemTender.code);
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

	} // end of save(ENContract anObject,String[] anAttributes)


	public ENContractShort getShortObject(int anObjectCode) throws PersistenceException {
		ENContract filterObject = new ENContract();
		Vector<ENContractShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENContractShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENContract filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractEndDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.org.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.contractType.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.purchaseItemTender.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENContractFilter filter) {
		String out = buildCondition((ENContract)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENContract filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENContract.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENContract.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENContract.contractDate_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractEndDate, ENContract.contractEndDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENContract.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENContract.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENContract.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENContract.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENContract.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENContract.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.org.code, ENContract.org_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.contractType.code, ENContract.contractType_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.purchaseItemTender.code, ENContract.purchaseItemTender_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENContract.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENContractShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENContractShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENContractShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENContractShortList getFilteredList(ENContract filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENContractShortList getScrollableFilteredList(ENContract aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENContractShortList getScrollableFilteredList(ENContract aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENContractShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENContractShortList getScrollableFilteredList(ENContractFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENContractShortList getScrollableFilteredList(ENContractFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENContractShortList getScrollableFilteredList(ENContract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENContractShortList result = new ENContractShortList();
		ENContractShort anObject;
		result.list = new Vector<ENContractShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCONTRACT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCONTRACT.CODE"+
			",ENCONTRACT.CONTRACTNUMBER"+
			",ENCONTRACT.CONTRACTDATE"+
			",ENCONTRACT.CONTRACTENDDATE"+
			",ENCONTRACT.FINDOCCODE"+
			",ENCONTRACT.FINDOCID"+
			",ENCONTRACT.USERGEN"+
			",ENCONTRACT.DATEEDIT"+
			", ENCONTRACT.ORGCODE" +
			", ENCONTRACTTYPE.CODE " +
			", ENCONTRACTTYPE.NAME " +
			", RQPURCHASEITEMTENDER.CODE " +
			", RQPURCHASEITEMTENDER.IDENTID " +
			", RQPURCHASEITEMTENDER.IDENTID2 " +
			", RQPURCHASEITEMTENDER.PURCHASENAME " +
			", RQPURCHASEITEMTENDER.FINANCINGSOURCE " +
			", RQPURCHASEITEMTENDER.SUMGENWITHNDS " +
			", RQPURCHASEITEMTENDER.SUMFACTWITHNDS " +
			", RQPURCHASEITEMTENDER.TENTATIVEYEARGEN " +
			", RQPURCHASEITEMTENDER.TENTATIVEMONTHGEN " +
			", RQPURCHASEITEMTENDER.COUNTSYMBOLFORGROUP " +
			", RQPURCHASEITEMTENDER.COMMENTGEN " +
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
		" FROM ENCONTRACT " +
			", ENCONTRACTTYPE " +
			", RQPURCHASEITEMTENDER " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENCONTRACTTYPE.CODE = ENCONTRACT.CONTRACTTYPECODE" ; //+
		whereStr += " AND RQPURCHASEITEMTENDER.CODE = ENCONTRACT.PURCHASEITEMTENDERCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENCONTRACT.GENERALCONTRACTREFCODE" ; //+


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
				anObject = new ENContractShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.contractNumber = set.getString(2);
				anObject.contractDate = set.getDate(3);
				anObject.contractEndDate = set.getDate(4);
				anObject.finDocCode = set.getString(5);
				anObject.finDocID = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getDate(8);

				anObject.orgCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.orgCode = Integer.MIN_VALUE;
				}
				anObject.contractTypeCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.contractTypeCode = Integer.MIN_VALUE;
				}
				anObject.contractTypeName = set.getString(11);
				anObject.purchaseItemTenderCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.purchaseItemTenderCode = Integer.MIN_VALUE;
				}
				anObject.purchaseItemTenderIdentid = set.getString(13);
				anObject.purchaseItemTenderIdentid2 = set.getString(14);
				anObject.purchaseItemTenderPurchaseName = set.getString(15);
				anObject.purchaseItemTenderFinancingSource = set.getString(16);
				anObject.purchaseItemTenderSumGenWithNds = set.getBigDecimal(17);
				if(anObject.purchaseItemTenderSumGenWithNds != null) {
					anObject.purchaseItemTenderSumGenWithNds = anObject.purchaseItemTenderSumGenWithNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemTenderSumFactWithNds = set.getBigDecimal(18);
				if(anObject.purchaseItemTenderSumFactWithNds != null) {
					anObject.purchaseItemTenderSumFactWithNds = anObject.purchaseItemTenderSumFactWithNds.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.purchaseItemTenderTentativeYearGen = set.getInt(19);
				if(set.wasNull()) {
					anObject.purchaseItemTenderTentativeYearGen = Integer.MIN_VALUE;
				}
				anObject.purchaseItemTenderTentativeMonthGen = set.getInt(20);
				if(set.wasNull()) {
					anObject.purchaseItemTenderTentativeMonthGen = Integer.MIN_VALUE;
				}
				anObject.purchaseItemTenderCountSymbolForGroup = set.getInt(21);
				if(set.wasNull()) {
					anObject.purchaseItemTenderCountSymbolForGroup = Integer.MIN_VALUE;
				}
				anObject.purchaseItemTenderCommentGen = set.getString(22);
				anObject.generalContractRefCode = set.getInt(23);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(24);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(25);
				anObject.generalContractRefContractNumber = set.getString(26);
				anObject.generalContractRefContractDate = set.getDate(27);
				anObject.generalContractRefCommentGen = set.getString(28);
				anObject.generalContractRefPartnerId = set.getInt(29);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(30);
				anObject.generalContractRefPartnerName = set.getString(31);
				anObject.generalContractRefContractRegDate = set.getDate(32);
				anObject.generalContractRefContractStartDate = set.getDate(33);
				anObject.generalContractRefContractEndDate = set.getDate(34);
				anObject.generalContractRefAxContractId = set.getString(35);
				anObject.generalContractRefAxContractCode = set.getString(36);
				anObject.generalContractRefAxContractNumber = set.getString(37);
				anObject.generalContractRefAxContractAccount = set.getString(38);
				anObject.generalContractRefAxContractDate = set.getDate(39);
				anObject.generalContractRefAxContractCommentGen = set.getString(40);
				anObject.generalContractRefAxContractGroupCode = set.getString(41);
				anObject.generalContractRefAxPartnerCode = set.getString(42);
				anObject.generalContractRefAxPartnerName = set.getString(43);
				anObject.generalContractRefUserGen = set.getString(44);

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

	public int[] getFilteredCodeArray(ENContractFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENContract aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCONTRACT.CODE FROM ENCONTRACT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCONTRACT.CODE";
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

	public ENContract getObject(int uid) throws PersistenceException {
		ENContract result = new ENContract();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENContract anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENCONTRACT.CODE, ENCONTRACT.CONTRACTNUMBER, ENCONTRACT.CONTRACTDATE, ENCONTRACT.CONTRACTENDDATE, ENCONTRACT.FINDOCCODE, ENCONTRACT.FINDOCID, ENCONTRACT.COMMENTGEN, ENCONTRACT.USERGEN, ENCONTRACT.DATEEDIT, ENCONTRACT.MODIFY_TIME, ENCONTRACT.ORGCODE, ENCONTRACT.CONTRACTTYPECODE, ENCONTRACT.PURCHASEITEMTENDERCODE, ENCONTRACT.GENERALCONTRACTREFCODE "
			+" FROM ENCONTRACT WHERE ENCONTRACT.CODE = ?";

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
			anObject.contractEndDate = set.getDate(4);
			anObject.finDocCode = set.getString(5);
			anObject.finDocID = set.getInt(6);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.commentGen = set.getString(7);
			anObject.userGen = set.getString(8);
			anObject.dateEdit = set.getDate(9);
			anObject.modify_time = set.getLong(10);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.org.code = set.getInt(11);
			if (set.wasNull()) {
				anObject.org.code = Integer.MIN_VALUE;
			}
			anObject.contractType.code = set.getInt(12);
			if (set.wasNull()) {
				anObject.contractType.code = Integer.MIN_VALUE;
			}
			anObject.purchaseItemTender.code = set.getInt(13);
			if (set.wasNull()) {
				anObject.purchaseItemTender.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(14);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.org.code != Integer.MIN_VALUE) {
				anObject.setOrg(
					new com.ksoe.rqorder.dataminer.generated.RQOrgDAOGen(connection,getUserProfile()).getObject(anObject.org.code));
			}
			if(anObject.contractType.code != Integer.MIN_VALUE) {
				anObject.setContractType(
					new com.ksoe.energynet.dataminer.generated.ENContractTypeDAOGen(connection,getUserProfile()).getObject(anObject.contractType.code));
			}
			if(anObject.purchaseItemTender.code != Integer.MIN_VALUE) {
				anObject.setPurchaseItemTender(
					new com.ksoe.rqorder.dataminer.generated.RQPurchaseItemTenderDAOGen(connection,getUserProfile()).getObject(anObject.purchaseItemTender.code));
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


	public com.ksoe.energynet.valueobject.references.ENContractRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENContractRef ref = new com.ksoe.energynet.valueobject.references.ENContractRef();
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

		selectStr = "DELETE FROM  ENCONTRACT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENContract object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENContract.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENContract.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENContract.remove%} access denied");
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

	public long count(ENContractFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENContractFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCONTRACT", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENContractFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCONTRACT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENContract.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENContract.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCONTRACT.CODE FROM  ENCONTRACT WHERE  ENCONTRACT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCONTRACT.CODE");
		_checkConditionToken(condition,"contractnumber","ENCONTRACT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENCONTRACT.CONTRACTDATE");
		_checkConditionToken(condition,"contractenddate","ENCONTRACT.CONTRACTENDDATE");
		_checkConditionToken(condition,"findoccode","ENCONTRACT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENCONTRACT.FINDOCID");
		_checkConditionToken(condition,"commentgen","ENCONTRACT.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENCONTRACT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENCONTRACT.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENCONTRACT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"org","ORGCODE");
		_checkConditionToken(condition,"org.code","ORGCODE");
		_checkConditionToken(condition,"contracttype","CONTRACTTYPECODE");
		_checkConditionToken(condition,"contracttype.code","CONTRACTTYPECODE");
		_checkConditionToken(condition,"purchaseitemtender","PURCHASEITEMTENDERCODE");
		_checkConditionToken(condition,"purchaseitemtender.code","PURCHASEITEMTENDERCODE");
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

	private void _collectAutoIncrementFields(ENContract anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCONTRACT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCONTRACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCONTRACT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCONTRACT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENContractDAO
