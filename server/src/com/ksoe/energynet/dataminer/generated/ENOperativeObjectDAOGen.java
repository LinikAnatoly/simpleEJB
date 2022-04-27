
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
import com.ksoe.energynet.valueobject.ENOperativeObject;
import com.ksoe.energynet.valueobject.brief.ENOperativeObjectShort;
import com.ksoe.energynet.valueobject.filter.ENOperativeObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENOperativeObjectShortList;
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
 * DAO Object for ENOperativeObject;
 *
 */

public class ENOperativeObjectDAOGen extends GenericDataMiner {

	public ENOperativeObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENOperativeObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENOperativeObject inObject) throws PersistenceException {
		ENOperativeObject obj = new ENOperativeObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
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
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		return true;
	}

	public int add(ENOperativeObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENOperativeObject anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENOPERATIVEOBJECT (CODE,NAME,COMMENTGEN,CONTRACTNUMBER,CONTRACTDATE,PARTNERCODE,PARTNERNAME,FINDOCCODE,FINDOCID,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTCODE,ELEMENTCODE,GENERALCONTRACTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.name);
			statement.setString(3,anObject.commentGen);
			statement.setString(4,anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(5,null);
			} else {
				statement.setDate(5,new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(6,anObject.partnerCode);
			statement.setString(7,anObject.partnerName);
			statement.setString(8,anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.finDocID);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			statement.setString(10,anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(11,null);
			} else {
				statement.setBigDecimal(11,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.department.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.department.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENOperativeObject.department.code%} = {%"+anObject.department.code+"%}");
				}
				statement.setInt(12,anObject.department.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENOperativeObject.element.code%} = {%"+anObject.element.code+"%}");
				}
				statement.setInt(13,anObject.element.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENGeneralContractsDAOGen(connection,getUserProfile()).exists(anObject.generalContractRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENOperativeObject.generalContractRef.code%} = {%"+anObject.generalContractRef.code+"%}");
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
			throw new PersistenceException("Error in method {%ENOperativeObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENOperativeObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENOperativeObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENOperativeObject oldObject = new ENOperativeObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENOperativeObject.modify_time_Field + "," + ENOperativeObject.domain_info_Field+" FROM  ENOPERATIVEOBJECT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NAME") == 0) {
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
					if(fieldNameStr.compareTo("DEPARTMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
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
				selectStr = "UPDATE ENOPERATIVEOBJECT SET  NAME = ? , COMMENTGEN = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , PARTNERCODE = ? , PARTNERNAME = ? , FINDOCCODE = ? , FINDOCID = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , ELEMENTCODE = ? , GENERALCONTRACTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENOPERATIVEOBJECT SET ";
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
					statement.setString(1,anObject.name);
					statement.setString(2,anObject.commentGen);
					statement.setString(3,anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(4,null);
					} else {
						statement.setDate(4,new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(5,anObject.partnerCode);
					statement.setString(6,anObject.partnerName);
					statement.setString(7,anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.finDocID);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					statement.setString(9,anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(10,null);
					} else {
						statement.setBigDecimal(10,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.department.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(12,anObject.element.code);
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
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
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
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerCode);
							continue;
						}
						if("PARTNERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.partnerName);
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
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.department.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.element.code);
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

	} // end of save(ENOperativeObject anObject,String[] anAttributes)


	public ENOperativeObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENOperativeObject filterObject = new ENOperativeObject();
		Vector<ENOperativeObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENOperativeObjectShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENOperativeObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENOperativeObjectFilter filter) {
		String out = buildCondition((ENOperativeObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENOperativeObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENOperativeObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENOperativeObject.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENOperativeObject.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENOperativeObject.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENOperativeObject.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENOperativeObject.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerName, ENOperativeObject.partnerName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENOperativeObject.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENOperativeObject.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENOperativeObject.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENOperativeObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, ENOperativeObject.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENOperativeObject.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENOperativeObject.generalContractRef_QFielld, out);
		}
		return out;
	}

	public ENOperativeObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENOperativeObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENOperativeObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENOperativeObjectShortList getFilteredList(ENOperativeObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObjectFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENOperativeObjectShortList getScrollableFilteredList(ENOperativeObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENOperativeObjectShortList result = new ENOperativeObjectShortList();
		ENOperativeObjectShort anObject;
		result.list = new Vector<ENOperativeObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENOPERATIVEOBJECT.CODE"+
			",ENOPERATIVEOBJECT.NAME"+
			",ENOPERATIVEOBJECT.CONTRACTNUMBER"+
			",ENOPERATIVEOBJECT.CONTRACTDATE"+
			",ENOPERATIVEOBJECT.PARTNERCODE"+
			",ENOPERATIVEOBJECT.PARTNERNAME"+
			",ENOPERATIVEOBJECT.FINDOCCODE"+
			",ENOPERATIVEOBJECT.FINDOCID"+
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
			", ENELEMENT.CODE " +
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
		" FROM ENOPERATIVEOBJECT " +
			", ENDEPARTMENT " +
			", ENELEMENT " +
			", ENGENERALCONTRACTS " +
		"";
		whereStr = " ENDEPARTMENT.CODE = ENOPERATIVEOBJECT.DEPARTMENTCODE" ; //+
		whereStr += " AND ENELEMENT.CODE = ENOPERATIVEOBJECT.ELEMENTCODE" ; //+
		whereStr += " AND ENGENERALCONTRACTS.CODE = ENOPERATIVEOBJECT.GENERALCONTRACTREFCODE" ; //+


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENOperativeObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.name = set.getString(2);
				anObject.contractNumber = set.getString(3);
				anObject.contractDate = set.getDate(4);
				anObject.partnerCode = set.getString(5);
				anObject.partnerName = set.getString(6);
				anObject.finDocCode = set.getString(7);
				anObject.finDocID = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}

				anObject.departmentCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(10);
				anObject.departmentDateStart = set.getDate(11);
				anObject.departmentDateFinal = set.getDate(12);
				anObject.departmentRenCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(14);
				anObject.departmentKau_table_id_1884 = set.getInt(15);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(16);
				anObject.departmentName_1884 = set.getString(17);
				anObject.departmentHrmorganizationid = set.getString(18);
				anObject.elementCode = set.getInt(19);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefCode = set.getInt(20);
				if(set.wasNull()) {
					anObject.generalContractRefCode = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocID = set.getInt(21);
				if(set.wasNull()) {
					anObject.generalContractRefFinDocID = Integer.MIN_VALUE;
				}
				anObject.generalContractRefFinDocCode = set.getString(22);
				anObject.generalContractRefContractNumber = set.getString(23);
				anObject.generalContractRefContractDate = set.getDate(24);
				anObject.generalContractRefCommentGen = set.getString(25);
				anObject.generalContractRefPartnerId = set.getInt(26);
				if(set.wasNull()) {
					anObject.generalContractRefPartnerId = Integer.MIN_VALUE;
				}
				anObject.generalContractRefPartnerCode = set.getString(27);
				anObject.generalContractRefPartnerName = set.getString(28);
				anObject.generalContractRefContractRegDate = set.getDate(29);
				anObject.generalContractRefContractStartDate = set.getDate(30);
				anObject.generalContractRefContractEndDate = set.getDate(31);
				anObject.generalContractRefAxContractId = set.getString(32);
				anObject.generalContractRefAxContractCode = set.getString(33);
				anObject.generalContractRefAxContractNumber = set.getString(34);
				anObject.generalContractRefAxContractAccount = set.getString(35);
				anObject.generalContractRefAxContractDate = set.getDate(36);
				anObject.generalContractRefAxContractCommentGen = set.getString(37);
				anObject.generalContractRefAxContractGroupCode = set.getString(38);
				anObject.generalContractRefAxPartnerCode = set.getString(39);
				anObject.generalContractRefAxPartnerName = set.getString(40);
				anObject.generalContractRefUserGen = set.getString(41);

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

	public int[] getFilteredCodeArray(ENOperativeObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENOperativeObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENOPERATIVEOBJECT.CODE FROM ENOPERATIVEOBJECT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENOPERATIVEOBJECT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENOPERATIVEOBJECT.DOMAIN_INFO IS NOT NULL) ";
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

	public ENOperativeObject getObject(int uid) throws PersistenceException {
		ENOperativeObject result = new ENOperativeObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENOperativeObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getObject%} access denied");
		}


		selectStr = "SELECT  ENOPERATIVEOBJECT.CODE, ENOPERATIVEOBJECT.NAME, ENOPERATIVEOBJECT.COMMENTGEN, ENOPERATIVEOBJECT.CONTRACTNUMBER, ENOPERATIVEOBJECT.CONTRACTDATE, ENOPERATIVEOBJECT.PARTNERCODE, ENOPERATIVEOBJECT.PARTNERNAME, ENOPERATIVEOBJECT.FINDOCCODE, ENOPERATIVEOBJECT.FINDOCID, ENOPERATIVEOBJECT.DOMAIN_INFO, ENOPERATIVEOBJECT.MODIFY_TIME, ENOPERATIVEOBJECT.DEPARTMENTCODE, ENOPERATIVEOBJECT.ELEMENTCODE, ENOPERATIVEOBJECT.GENERALCONTRACTREFCODE "
			+" FROM ENOPERATIVEOBJECT WHERE ENOPERATIVEOBJECT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
			anObject.name = set.getString(2);
			anObject.commentGen = set.getString(3);
			anObject.contractNumber = set.getString(4);
			anObject.contractDate = set.getDate(5);
			anObject.partnerCode = set.getString(6);
			anObject.partnerName = set.getString(7);
			anObject.finDocCode = set.getString(8);
			anObject.finDocID = set.getInt(9);
			if (set.wasNull()) {
				anObject.finDocID = Integer.MIN_VALUE;
			}
			anObject.domain_info = set.getString(10);
			anObject.modify_time = set.getLong(11);
			if(set.wasNull()) {
				anObject.modify_time = Long.MIN_VALUE;
			}
			anObject.department.code = set.getInt(12);
			if (set.wasNull()) {
				anObject.department.code = Integer.MIN_VALUE;
			}
			anObject.element.code = set.getInt(13);
			if (set.wasNull()) {
				anObject.element.code = Integer.MIN_VALUE;
			}
			anObject.generalContractRef.code = set.getInt(14);
			if (set.wasNull()) {
				anObject.generalContractRef.code = Integer.MIN_VALUE;
			}
			if(anObject.department.code != Integer.MIN_VALUE) {
				anObject.setDepartment(
					new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
			}
			if(anObject.element.code != Integer.MIN_VALUE) {
				anObject.setElement(
					new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


	public com.ksoe.energynet.valueobject.references.ENOperativeObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENOperativeObjectRef ref = new com.ksoe.energynet.valueobject.references.ENOperativeObjectRef();
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

		selectStr = "DELETE FROM  ENOPERATIVEOBJECT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENOperativeObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENOperativeObject.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.remove%} access denied");
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

	public long count(ENOperativeObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENOperativeObjectFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENOperativeObjectFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENOPERATIVEOBJECT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENOPERATIVEOBJECT.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENOperativeObjectFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENOPERATIVEOBJECT");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENOperativeObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENOperativeObject.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENOPERATIVEOBJECT.CODE FROM  ENOPERATIVEOBJECT WHERE  ENOPERATIVEOBJECT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENOPERATIVEOBJECT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENOPERATIVEOBJECT.CODE");
		_checkConditionToken(condition,"name","ENOPERATIVEOBJECT.NAME");
		_checkConditionToken(condition,"commentgen","ENOPERATIVEOBJECT.COMMENTGEN");
		_checkConditionToken(condition,"contractnumber","ENOPERATIVEOBJECT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENOPERATIVEOBJECT.CONTRACTDATE");
		_checkConditionToken(condition,"partnercode","ENOPERATIVEOBJECT.PARTNERCODE");
		_checkConditionToken(condition,"partnername","ENOPERATIVEOBJECT.PARTNERNAME");
		_checkConditionToken(condition,"findoccode","ENOPERATIVEOBJECT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENOPERATIVEOBJECT.FINDOCID");
		_checkConditionToken(condition,"domain_info","ENOPERATIVEOBJECT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENOPERATIVEOBJECT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
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

	private void _collectAutoIncrementFields(ENOperativeObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENOPERATIVEOBJECT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENOPERATIVEOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENOPERATIVEOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENOPERATIVEOBJECT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENOperativeObjectDAO
