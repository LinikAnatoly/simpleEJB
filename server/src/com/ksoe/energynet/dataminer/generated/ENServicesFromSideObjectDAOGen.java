
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
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
import com.ksoe.lla.persistence.sql.SegregationQueryBuilder;
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
import com.ksoe.energynet.valueobject.ENServicesFromSideObject;
import com.ksoe.energynet.valueobject.filter.ENServicesFromSideObjectFilter;
import com.ksoe.energynet.valueobject.brief.ENServicesFromSideObjectShort;
import com.ksoe.energynet.valueobject.lists.ENServicesFromSideObjectShortList;


/**
 * DAO Object for ENServicesFromSideObject;
 *
 */

public class ENServicesFromSideObjectDAOGen extends GenericDataMiner {

	public ENServicesFromSideObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENServicesFromSideObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENServicesFromSideObject inObject) throws PersistenceException {
		ENServicesFromSideObject obj = new ENServicesFromSideObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.numberProject == null && obj.numberProject == null){}
		else
			if(inObject.numberProject == null || obj.numberProject == null) return false;
			else
				if ( ! inObject.numberProject.equals(obj.numberProject)){
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

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
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
		if (inObject.department.code != obj.department.code){
			return false;
		}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.generalContractRef.code != obj.generalContractRef.code){
			return false;
		}
		if (inObject.statusRef.code != obj.statusRef.code){
			return false;
		}
		return true;
	}

	public int add(ENServicesFromSideObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENServicesFromSideObject anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENSERVICESFROMSIDEBJCT (CODE,NUMBERPROJECT,CONTRACTNUMBER,CONTRACTDATE,NAME,PARTNERCODE,FINDOCCODE,FINDOCID,COMMENTGEN,USERGEN,DATEEDIT,DOMAIN_INFO,MODIFY_TIME,DEPARTMENTCODE,ELEMENTCODE,GENERALCONTRACTREFCODE,STATUSREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.numberProject);
			statement.setString(3, anObject.contractNumber);
			if (anObject.contractDate == null) {
				statement.setDate(4, null);
			} else {
				statement.setDate(4, new java.sql.Date(anObject.contractDate.getTime()));
			}
			statement.setString(5, anObject.name);
			statement.setString(6, anObject.partnerCode);
			statement.setString(7, anObject.finDocCode);
			if (anObject.finDocID != Integer.MIN_VALUE ) {
				statement.setInt(8, anObject.finDocID);
			} else {
				statement.setNull(8, java.sql.Types.INTEGER);
			}
			statement.setString(9, anObject.commentGen);
			statement.setString(10, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setDate(11, null);
			} else {
				statement.setDate(11, new java.sql.Date(anObject.dateEdit.getTime()));
			}
			statement.setString(12, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(13, null);
			} else {
				statement.setBigDecimal(13, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.department.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.department.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(15,anObject.element.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}
			if (anObject.generalContractRef.code != Integer.MIN_VALUE){
				statement.setInt(16,anObject.generalContractRef.code);
			} else {
				statement.setNull(16,java.sql.Types.INTEGER);
			}
			if (anObject.statusRef.code != Integer.MIN_VALUE){
				statement.setInt(17,anObject.statusRef.code);
			} else {
				statement.setNull(17,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENServicesFromSideObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENServicesFromSideObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENServicesFromSideObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENServicesFromSideObject oldObject = new ENServicesFromSideObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENServicesFromSideObject.modify_time_Field + "," + ENServicesFromSideObject.domain_info_Field+" FROM  ENSERVICESFROMSIDEBJCT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("NUMBERPROJECT") == 0) {
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
					if(fieldNameStr.compareTo("NAME") == 0) {
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
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSERVICESFROMSIDEBJCT SET  NUMBERPROJECT = ? , CONTRACTNUMBER = ? , CONTRACTDATE = ? , NAME = ? , PARTNERCODE = ? , FINDOCCODE = ? , FINDOCID = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , DEPARTMENTCODE = ? , ELEMENTCODE = ? , GENERALCONTRACTREFCODE = ? , STATUSREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSERVICESFROMSIDEOBJECT SET ";
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
					statement.setString(1, anObject.numberProject);
					statement.setString(2, anObject.contractNumber);
					if (anObject.contractDate == null) {
						statement.setDate(3, null);
					} else {
						statement.setDate(3, new java.sql.Date(anObject.contractDate.getTime()));
					}
					statement.setString(4, anObject.name);
					statement.setString(5, anObject.partnerCode);
					statement.setString(6, anObject.finDocCode);
					if (anObject.finDocID != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.finDocID);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					statement.setString(8, anObject.commentGen);
					statement.setString(9, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(10, null);
					} else {
						statement.setDate(10, new java.sql.Date(anObject.dateEdit.getTime()));
					}
					statement.setString(11, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(12, null);
					} else {
						statement.setBigDecimal(12, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.department.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.department.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.element.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
						statement.setInt(15, anObject.generalContractRef.code);
					} else {
						statement.setNull(15, java.sql.Types.INTEGER);
					}
					if (anObject.statusRef.code != Integer.MIN_VALUE) {
						statement.setInt(16, anObject.statusRef.code);
					} else {
						statement.setNull(16, java.sql.Types.INTEGER);
					}
					statement.setInt(17, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NUMBERPROJECT".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.numberProject);
							continue;
						}
						if("CONTRACTNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.contractNumber);
							continue;
						}
						if("CONTRACTDATE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.contractDate == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.contractDate.getTime()));
							}
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("PARTNERCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.partnerCode);
							continue;
						}
						if("FINDOCCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.finDocCode);
							continue;
						}
						if("FINDOCID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.finDocID);
							continue;
						}
						if("COMMENTGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.commentGen);
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("DOMAIN_INFO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.domain_info);
							continue;
						}
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("DEPARTMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.department.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.department.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.element.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GENERALCONTRACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.generalContractRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.generalContractRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("STATUSREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.statusRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.statusRef.code);
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

	} // end of save(ENServicesFromSideObject anObject,String[] anAttributes)


	public ENServicesFromSideObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENServicesFromSideObject filterObject = new ENServicesFromSideObject();
		Vector<ENServicesFromSideObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENServicesFromSideObjectShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENServicesFromSideObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.numberProject, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.contractNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.contractDate, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.partnerCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.finDocCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finDocID, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.department.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.generalContractRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENServicesFromSideObjectFilter filter) {
		String out = buildCondition((ENServicesFromSideObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENServicesFromSideObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENServicesFromSideObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.numberProject, ENServicesFromSideObject.numberProject_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.contractNumber, ENServicesFromSideObject.contractNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.contractDate, ENServicesFromSideObject.contractDate_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENServicesFromSideObject.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.partnerCode, ENServicesFromSideObject.partnerCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.finDocCode, ENServicesFromSideObject.finDocCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finDocID, ENServicesFromSideObject.finDocID_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENServicesFromSideObject.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENServicesFromSideObject.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENServicesFromSideObject.dateEdit_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENServicesFromSideObject.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENServicesFromSideObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.department.code, ENServicesFromSideObject.department_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENServicesFromSideObject.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.generalContractRef.code, ENServicesFromSideObject.generalContractRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusRef.code, ENServicesFromSideObject.statusRef_QFielld, out);
		}
		return out;
	}

	public ENServicesFromSideObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENServicesFromSideObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENServicesFromSideObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENServicesFromSideObjectShortList getFilteredList(ENServicesFromSideObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENServicesFromSideObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENServicesFromSideObjectShortList getScrollableFilteredList(ENServicesFromSideObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesFromSideObjectShortList result = new ENServicesFromSideObjectShortList();
		ENServicesFromSideObjectShort anObject;
		result.list = new Vector<ENServicesFromSideObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESFROMSIDEBJCT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESFROMSIDEBJCT.CODE"+
			",ENSERVICESFROMSIDEBJCT.NUMBERPROJECT"+
			",ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER"+
			",ENSERVICESFROMSIDEBJCT.CONTRACTDATE"+
			",ENSERVICESFROMSIDEBJCT.NAME"+
			",ENSERVICESFROMSIDEBJCT.PARTNERCODE"+
			",ENSERVICESFROMSIDEBJCT.FINDOCCODE"+
			",ENSERVICESFROMSIDEBJCT.FINDOCID"+
			",ENSERVICESFROMSIDEBJCT.COMMENTGEN"+
			",ENSERVICESFROMSIDEBJCT.USERGEN"+
			",ENSERVICESFROMSIDEBJCT.DATEEDIT"+
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
			", ENSERVFROMSIDESTATUS.CODE " +
			", ENSERVFROMSIDESTATUS.NAME " +
		" FROM ENSERVICESFROMSIDEBJCT " +
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSERVICESFROMSIDEBJCT.ELEMENTCODE "+
			" LEFT JOIN ENGENERALCONTRACTS on ENGENERALCONTRACTS.CODE = ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE "+
			" LEFT JOIN ENSERVFROMSIDESTATUS on ENSERVFROMSIDESTATUS.CODE = ENSERVICESFROMSIDEBJCT.STATUSREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesFromSideObject.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());
		if (domainWhereStr.length() != 0){
			if (whereStr.length() == 0) {
				whereStr = domainWhereStr;
			} else {
				whereStr = " "+whereStr + " AND " +domainWhereStr;
			}
		}

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
				anObject = new ENServicesFromSideObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.numberProject = set.getString(2);
				anObject.contractNumber = set.getString(3);
				anObject.contractDate = set.getDate(4);
				anObject.name = set.getString(5);
				anObject.partnerCode = set.getString(6);
				anObject.finDocCode = set.getString(7);
				anObject.finDocID = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(9);
				anObject.userGen = set.getString(10);
				anObject.dateEdit = set.getDate(11);

				anObject.departmentCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.departmentCode = Integer.MIN_VALUE;
				}
				anObject.departmentShortName = set.getString(13);
				anObject.departmentDateStart = set.getDate(14);
				anObject.departmentDateFinal = set.getDate(15);
				anObject.departmentRenCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.departmentRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentShpzBalans = set.getString(17);
				anObject.departmentKau_table_id_1884 = set.getInt(18);
				if(set.wasNull()) {
					anObject.departmentKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentKau_1884 = set.getString(19);
				anObject.departmentName_1884 = set.getString(20);
				anObject.departmentHrmorganizationid = set.getString(21);
				anObject.elementCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
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
				anObject.statusRefCode = set.getInt(45);
				if(set.wasNull()) {
					anObject.statusRefCode = Integer.MIN_VALUE;
				}
				anObject.statusRefName = set.getString(46);

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
	
	public int[] getFilteredCodeArray(ENServicesFromSideObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENServicesFromSideObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENServicesFromSideObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSERVICESFROMSIDEBJCT.CODE FROM ENSERVICESFROMSIDEBJCT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESFROMSIDEBJCT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesFromSideObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENSERVICESFROMSIDEBJCT.DOMAIN_INFO IS NOT NULL) ";
		} else {
			whereStr = " "+whereStr;
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


	public ENServicesFromSideObject getObject(int uid) throws PersistenceException {
		ENServicesFromSideObject result = new ENServicesFromSideObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENServicesFromSideObject anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENServicesFromSideObject anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENServicesFromSideObject anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

        SegregationInfo segregationInfo = null;
        String segregationWhereStr = null;
        
        if (!noSegregation) {
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENServicesFromSideObject.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENSERVICESFROMSIDEBJCT.CODE, ENSERVICESFROMSIDEBJCT.NUMBERPROJECT, ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER, ENSERVICESFROMSIDEBJCT.CONTRACTDATE, ENSERVICESFROMSIDEBJCT.NAME, ENSERVICESFROMSIDEBJCT.PARTNERCODE, ENSERVICESFROMSIDEBJCT.FINDOCCODE, ENSERVICESFROMSIDEBJCT.FINDOCID, ENSERVICESFROMSIDEBJCT.COMMENTGEN, ENSERVICESFROMSIDEBJCT.USERGEN, ENSERVICESFROMSIDEBJCT.DATEEDIT, ENSERVICESFROMSIDEBJCT.DOMAIN_INFO, ENSERVICESFROMSIDEBJCT.MODIFY_TIME, ENSERVICESFROMSIDEBJCT.DEPARTMENTCODE, ENSERVICESFROMSIDEBJCT.ELEMENTCODE, ENSERVICESFROMSIDEBJCT.GENERALCONTRACTREFCODE, ENSERVICESFROMSIDEBJCT.STATUSREFCODE "
			+" FROM ENSERVICESFROMSIDEBJCT WHERE ENSERVICESFROMSIDEBJCT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());
            if (segregationWhereStr.length() > 0) {
                selectStr = selectStr + " AND " + segregationWhereStr;
            }
        }

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.numberProject = set.getString(2);
				anObject.contractNumber = set.getString(3);
				anObject.contractDate = set.getDate(4);
				anObject.name = set.getString(5);
				anObject.partnerCode = set.getString(6);
				anObject.finDocCode = set.getString(7);
				anObject.finDocID = set.getInt(8);
				if (set.wasNull()) {
					anObject.finDocID = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(9);
				anObject.userGen = set.getString(10);
				anObject.dateEdit = set.getDate(11);
				anObject.domain_info = set.getString(12);
				anObject.modify_time = set.getLong(13);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.department.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.department.code = Integer.MIN_VALUE;
				}
				anObject.element.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.generalContractRef.code = set.getInt(16);
				if (set.wasNull()) {
					anObject.generalContractRef.code = Integer.MIN_VALUE;
				}
				anObject.statusRef.code = set.getInt(17);
				if (set.wasNull()) {
					anObject.statusRef.code = Integer.MIN_VALUE;
				}
				if(anObject.department.code != Integer.MIN_VALUE) {
					anObject.setDepartment(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getObject(anObject.department.code));
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
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


	public com.ksoe.energynet.valueobject.references.ENServicesFromSideObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENServicesFromSideObjectRef ref = new com.ksoe.energynet.valueobject.references.ENServicesFromSideObjectRef();
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

		selectStr = "DELETE FROM  ENSERVICESFROMSIDEBJCT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENServicesFromSideObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENServicesFromSideObject.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENServicesFromSideObject.remove%} access denied");
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
	
	public long count(ENServicesFromSideObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENServicesFromSideObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENServicesFromSideObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSERVICESFROMSIDEBJCT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesFromSideObject.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENSERVICESFROMSIDEBJCT.DOMAIN_INFO IS NOT NULL) ";
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
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENSERVICESFROMSIDEBJCT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesFromSideObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENServicesFromSideObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSERVICESFROMSIDEBJCT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENServicesFromSideObject.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENSERVICESFROMSIDEBJCT.DOMAIN_INFO IS NOT NULL) ";
			} else {
				whereStr = " "+whereStr;
			}		
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENServicesFromSideObject.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENServicesFromSideObject.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENSERVICESFROMSIDEBJCT.CODE FROM  ENSERVICESFROMSIDEBJCT WHERE  ENSERVICESFROMSIDEBJCT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENSERVICESFROMSIDEBJCT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENSERVICESFROMSIDEBJCT.CODE");
		_checkConditionToken(condition,"numberproject","ENSERVICESFROMSIDEBJCT.NUMBERPROJECT");
		_checkConditionToken(condition,"contractnumber","ENSERVICESFROMSIDEBJCT.CONTRACTNUMBER");
		_checkConditionToken(condition,"contractdate","ENSERVICESFROMSIDEBJCT.CONTRACTDATE");
		_checkConditionToken(condition,"name","ENSERVICESFROMSIDEBJCT.NAME");
		_checkConditionToken(condition,"partnercode","ENSERVICESFROMSIDEBJCT.PARTNERCODE");
		_checkConditionToken(condition,"findoccode","ENSERVICESFROMSIDEBJCT.FINDOCCODE");
		_checkConditionToken(condition,"findocid","ENSERVICESFROMSIDEBJCT.FINDOCID");
		_checkConditionToken(condition,"commentgen","ENSERVICESFROMSIDEBJCT.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENSERVICESFROMSIDEBJCT.USERGEN");
		_checkConditionToken(condition,"dateedit","ENSERVICESFROMSIDEBJCT.DATEEDIT");
		_checkConditionToken(condition,"domain_info","ENSERVICESFROMSIDEBJCT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENSERVICESFROMSIDEBJCT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"department","DEPARTMENTCODE");
		_checkConditionToken(condition,"department.code","DEPARTMENTCODE");
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"generalcontractref","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"generalcontractref.code","GENERALCONTRACTREFCODE");
		_checkConditionToken(condition,"statusref","STATUSREFCODE");
		_checkConditionToken(condition,"statusref.code","STATUSREFCODE");
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
	
	private void _collectAutoIncrementFields(ENServicesFromSideObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSERVICESFROMSIDEBJCT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSERVICESFROMSIDEBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSERVICESFROMSIDEBJCT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSERVICESFROMSIDEBJCT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENServicesFromSideObjectDAO
