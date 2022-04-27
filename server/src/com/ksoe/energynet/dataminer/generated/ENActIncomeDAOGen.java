
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
import com.ksoe.energynet.valueobject.ENActIncome;
import com.ksoe.energynet.valueobject.brief.ENActIncomeShort;
import com.ksoe.energynet.valueobject.filter.ENActIncomeFilter;
import com.ksoe.energynet.valueobject.lists.ENActIncomeShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENActIncome;
 *
 */

public class ENActIncomeDAOGen extends GenericDataMiner {

	public ENActIncomeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENActIncomeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENActIncome inObject) throws PersistenceException {
		ENActIncome obj = new ENActIncome();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numbergen == null && obj.numbergen == null){}
		else
			if(inObject.numbergen == null || obj.numbergen == null) return false;
			else
				if ( ! inObject.numbergen.equals(obj.numbergen)){
					return false;
				}

		if(inObject.dategen == null && obj.dategen == null){} else
			if(inObject.dategen == null || obj.dategen == null) return false;
			else
				if (inObject.dategen.compareTo(obj.dategen) != 0){
					return false;
				}

		if(inObject.actDateStart == null && obj.actDateStart == null){} else
			if(inObject.actDateStart == null || obj.actDateStart == null) return false;
			else
				if (inObject.actDateStart.compareTo(obj.actDateStart) != 0){
					return false;
				}

		if(inObject.actDateEnd == null && obj.actDateEnd == null){} else
			if(inObject.actDateEnd == null || obj.actDateEnd == null) return false;
			else
				if (inObject.actDateEnd.compareTo(obj.actDateEnd) != 0){
					return false;
				}

		if(inObject.commentGen == null && obj.commentGen == null){}
		else
			if(inObject.commentGen == null || obj.commentGen == null) return false;
			else
				if ( ! inObject.commentGen.equals(obj.commentGen)){
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

		if(inObject.partnername == null && obj.partnername == null){}
		else
			if(inObject.partnername == null || obj.partnername == null) return false;
			else
				if ( ! inObject.partnername.equals(obj.partnername)){
					return false;
				}

		if(inObject.partnerCode == null && obj.partnerCode == null){}
		else
			if(inObject.partnerCode == null || obj.partnerCode == null) return false;
			else
				if ( ! inObject.partnerCode.equals(obj.partnerCode)){
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
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENActIncome anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENActIncome anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENACTINCOME (CODE,NUMBERGEN,DATEGEN,ACTDATESTART,ACTDATEEND,COMMENTGEN,CONTRACTNUMBER,CONTRACTDATE,PARTNERNAME,PARTNERCODE,FINDOCCODE,FINDOCID,DOMAIN_INFO,MODIFY_TIME,STATUSREFCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.numbergen);
			if (anObject.dategen == null) {
				statement.setDate(3,null);
			} else {
				statement.setDate(3,new java.sql.Date(anObject.dategen.getTime()));
			}
			if (anObject.actDateStart == null) {
				statement.setDate(4,null);
			} else {
				statement.setDate(4,new java.sql.Date(anObject.actDateStart.getTime()));
			}
			if (anObject.actDateEnd == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.actDateEnd.getTime()));
			}
			statement.setString(6,anObject.commentGen);
			statement.setString(7,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(8,null);
			} else {
				statement.setDate(8,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(9,anObject.partnername);
			statement.setString(10,anObject.partnerCode);
			statement.setString(11,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(12,anObject.finDocID);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			statement.setString(13,anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(14,null);
			} else {
				statement.setBigDecimal(14,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(connection,getUserProfile()).exists(anObject.statusRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncome.statusRef.code%} = {%"+anObject.statusRef.code+"%}");
				}
				statement.setInt(15,anObject.statusRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENActIncome.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
				}
				statement.setInt(16,anObject.generalContractRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENActIncomeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENActIncome anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENActIncome anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENActIncome oldObject = new ENActIncome();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENActIncome.modify_time_Field + "," + ENActIncome.domain_info_Field+" FROM  ENACTINCOME WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("DATEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTDATESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTDATEEND") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COMMENTGEN") == 0) {
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
					if(fieldNameStr.compareTo("PARTNERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PARTNERCODE") == 0) {
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
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
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
				selectStr = "UPDATE ENACTINCOME SET  NUMBERGEN = ? , DATEGEN = ? , ACTDATESTART = ? , ACTDATEEND = ? , COMMENTGEN = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , PARTNERNAME = ? , PARTNERCODE = ? , FINDOCCODE = ? , FINDOCID = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , STATUSREFCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACTINCOME SET ";
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
					statement.setString(1,anObject.numbergen);
					if (anObject.dategen == null) {
						statement.setDate(2,null);
					} else {
						statement.setDate(2,new java.sql.Date(anObject.dategen.getTime()));
					}
					if (anObject.actDateStart == null) {
						statement.setDate(3,null);
					} else {
						statement.setDate(3,new java.sql.Date(anObject.actDateStart.getTime()));
					}
					if (anObject.actDateEnd == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.actDateEnd.getTime()));
					}
					statement.setString(5,anObject.commentGen);
					statement.setString(6,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(7,null);
					} else {
						statement.setDate(7,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(8,anObject.partnername);
					statement.setString(9,anObject.partnerCode);
					statement.setString(10,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.finDocID);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setString(12,anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(13,null);
					} else {
						statement.setBigDecimal(13,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(14,anObject.statusRef.code);
					} else {
						statement.setNull(14,java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(15,anObject.generalContractRef.code);
					} else {
						statement.setNull(15,java.sql.Types.INTEGER);
					}
					statement.setInt(16,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.numbergen);
							continue;
						}
						if("DATEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dategen == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.dategen.getTime()));
							}
							continue;
						}
						if("ACTDATESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDateStart == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.actDateStart.getTime()));
							}
							continue;
						}
						if("ACTDATEEND".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actDateEnd == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1,new java.sql.Date(anObject.actDateEnd.getTime()));
							}
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.commentGen);
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
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnername);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
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
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.domain_info);
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
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.statusRef.code);
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

	} // end of save(ENActIncome anObject,String[] anAttributes)


	public ENActIncomeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENActIncome filterObject = new ENActIncome();
		Vector<ENActIncomeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENActIncomeShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENActIncome filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numbergen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dategen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actDateStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.actDateEnd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnername, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENActIncomeFilter filter) {
		String out = buildCondition((ENActIncome)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENActIncome filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENActIncome.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numbergen, ENActIncome.numbergen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dategen, ENActIncome.dategen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDateStart, ENActIncome.actDateStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.actDateEnd, ENActIncome.actDateEnd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENActIncome.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENActIncome.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENActIncome.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnername, ENActIncome.partnername_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENActIncome.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENActIncome.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENActIncome.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENActIncome.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENActIncome.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENActIncome.statusRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENActIncome.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENActIncomeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENActIncomeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENActIncomeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENActIncomeShortList getFilteredList(ENActIncome filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENActIncomeShortList getScrollableFilteredList(ENActIncome aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENActIncomeShortList getScrollableFilteredList(ENActIncome aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENActIncomeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENActIncomeShortList getScrollableFilteredList(ENActIncomeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENActIncomeShortList getScrollableFilteredList(ENActIncomeFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENActIncomeShortList getScrollableFilteredList(ENActIncome aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENActIncomeShortList result = new ENActIncomeShortList();
		ENActIncomeShort anObject;
		result.list = new Vector<ENActIncomeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOME.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACTINCOME.CODE"+
			",ENACTINCOME.NUMBERGEN"+
			",ENACTINCOME.DATEGEN"+
			",ENACTINCOME.ACTDATESTART"+
			",ENACTINCOME.ACTDATEEND"+
			",ENACTINCOME.CONTRACTNUMBER"+
			",ENACTINCOME.CONTRACTDATE"+
			",ENACTINCOME.PARTNERNAME"+
			",ENACTINCOME.PARTNERCODE"+
			",ENACTINCOME.FINDOCCODE"+
			",ENACTINCOME.FINDOCID"+
			", ENACTINCOMESTATUS.CODE " +
			", ENACTINCOMESTATUS.NAME " +
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
		" FROM ENACTINCOME " +
			", ENACTINCOMESTATUS " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENACTINCOMESTATUS.CODE = ENACTINCOME.STATUSREFCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENACTINCOME.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new ENActIncomeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numbergen = set.getString(2);
				anObject.dategen = set.getDate(3);
				anObject.actDateStart = set.getDate(4);
				anObject.actDateEnd = set.getDate(5);
				anObject.contractNumber = set.getString(6);
				anObject.contractDate = set.getDate(7);
				anObject.partnername = set.getString(8);
				anObject.partnerCode = set.getString(9);
				anObject.finDocCode = set.getString(10);
				anObject.finDocID = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}

				anObject.statusRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(13);
				anObject.generalContractRefCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(15);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(16);
				anObject.generalContractRefContractNumber = set.getString(17);
				anObject.generalContractRefContractDate = set.getDate(18);
				anObject.generalContractRefCommentGen = set.getString(19);
				anObject.generalContractRefPartnerId = set.getInt(20);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(21);
				anObject.generalContractRefPartnerName = set.getString(22);
				anObject.generalContractRefContractRegDate = set.getDate(23);
				anObject.generalContractRefContractStartDate = set.getDate(24);
				anObject.generalContractRefContractEndDate = set.getDate(25);
				anObject.generalContractRefAxContractId = set.getString(26);
				anObject.generalContractRefAxContractCode = set.getString(27);
				anObject.generalContractRefAxContractNumber = set.getString(28);
				anObject.generalContractRefAxContractAccount = set.getString(29);
				anObject.generalContractRefAxContractDate = set.getDate(30);
				anObject.generalContractRefAxContractCommentGen = set.getString(31);
				anObject.generalContractRefAxContractGroupCode = set.getString(32);
				anObject.generalContractRefAxPartnerCode = set.getString(33);
				anObject.generalContractRefAxPartnerName = set.getString(34);
				anObject.generalContractRefUserGen = set.getString(35);

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

	public int[] getFilteredCodeArray(ENActIncomeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENActIncome aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACTINCOME.CODE FROM ENACTINCOME";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACTINCOME.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENACTINCOME.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
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

	public ENActIncome getObject(int uid) throws PersistenceException {
		ENActIncome result = new ENActIncome();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENActIncome anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.getObject%} access denied");
		}


		selectStr = "SELECT  ENACTINCOME.CODE, ENACTINCOME.NUMBERGEN, ENACTINCOME.DATEGEN, ENACTINCOME.ACTDATESTART, ENACTINCOME.ACTDATEEND, ENACTINCOME.COMMENTGEN, ENACTINCOME.CONTRACTNUMBER, ENACTINCOME.CONTRACTDATE, ENACTINCOME.PARTNERNAME, ENACTINCOME.PARTNERCODE, ENACTINCOME.FINDOCCODE, ENACTINCOME.FINDOCID, ENACTINCOME.DOMAIN_INFO, ENACTINCOME.MODIFY_TIME, ENACTINCOME.STATUSREFCODE, ENACTINCOME.GENERALCONTRACTREFCODE "
			+" FROM ENACTINCOME WHERE ENACTINCOME.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());
		if(segregationWhereStr.length() > 0) {
			selectStr = selectStr + " AND " + segregationWhereStr;
		}

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			}
			anObject.numbergen = set.getString(2);
			anObject.dategen = set.getDate(3);
			anObject.actDateStart = set.getDate(4);
			anObject.actDateEnd = set.getDate(5);
			anObject.commentGen = set.getString(6);
			anObject.contractNumber = set.getString(7);
			anObject.contractDate = set.getDate(8);
			anObject.partnername = set.getString(9);
			anObject.partnerCode = set.getString(10);
			anObject.finDocCode = set.getString(11);
			anObject.finDocID = set.getInt(12);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.domain_info = set.getString(13);
			anObject.modify_time = set.getLong(14);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.statusRef.code = set.getInt(15);
			if (set.wasNull()) {
				anObject.statusRef.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(16);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.statusRef.code != Integer.MIN_VALUE) {
				anObject.setStatusRef(
					new com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen(connection,getUserProfile()).getRef(anObject.statusRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENActIncomeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENActIncomeRef ref = new com.ksoe.energynet.valueobject.references.ENActIncomeRef();
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

		selectStr = "DELETE FROM  ENACTINCOME WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENActIncome object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENActIncome.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.remove%} access denied");
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

	public long count(ENActIncomeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENActIncomeFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENActIncomeFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACTINCOME", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENACTINCOME.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENActIncomeFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACTINCOME");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENActIncome.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENActIncome.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENACTINCOME.CODE FROM  ENACTINCOME WHERE  ENACTINCOME.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENACTINCOME",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENACTINCOME.CODE");
		_checkConditionToken(condition,"numbergen","ENACTINCOME.NUMBERGEN");
		_checkConditionToken(condition,"dategen","ENACTINCOME.DATEGEN");
		_checkConditionToken(condition,"actdatestart","ENACTINCOME.ACTDATESTART");
		_checkConditionToken(condition,"actdateend","ENACTINCOME.ACTDATEEND");
		_checkConditionToken(condition,"commentgen","ENACTINCOME.COMMENTGEN");
		_checkConditionToken(condition,"contractnumber","ENACTINCOME.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENACTINCOME.CONTRACTDATE");
		_checkConditionToken(condition,"partnername","ENACTINCOME.PARTNERNAME");
		_checkConditionToken(condition,"partnercode","ENACTINCOME.PARTNERCODE");
		_checkConditionToken(condition,"findoccode","ENACTINCOME.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENACTINCOME.FINDOCID");
		_checkConditionToken(condition,"domain_info","ENACTINCOME.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENACTINCOME.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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

	private void _collectAutoIncrementFields(ENActIncome anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACTINCOME", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACTINCOME", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACTINCOME", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACTINCOME");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENActIncomeDAO
