
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
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
import com.ksoe.energynet.valueobject.ENPlanInformCustomer;
import com.ksoe.energynet.valueobject.filter.ENPlanInformCustomerFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanInformCustomerShort;
import com.ksoe.energynet.valueobject.lists.ENPlanInformCustomerShortList;


/**
 * DAO Object for ENPlanInformCustomer;
 *
 */

public class ENPlanInformCustomerDAOGen extends GenericDataMiner {

	public ENPlanInformCustomerDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPlanInformCustomerDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPlanInformCustomer inObject) throws PersistenceException {
		ENPlanInformCustomer obj = new ENPlanInformCustomer();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.timeStart == null && obj.timeStart == null){} else 
			if(inObject.timeStart == null || obj.timeStart == null) return false;
			else
				if (inObject.timeStart.compareTo(obj.timeStart) != 0){
					return false;
				}

		if(inObject.timeFinal == null && obj.timeFinal == null){} else 
			if(inObject.timeFinal == null || obj.timeFinal == null) return false;
			else
				if (inObject.timeFinal.compareTo(obj.timeFinal) != 0){
					return false;
				}

		if(inObject.userAdd == null && obj.userAdd == null){}
		else
			if(inObject.userAdd == null || obj.userAdd == null) return false;
			else
				if ( ! inObject.userAdd.equals(obj.userAdd)){
					return false;
				}

		if(inObject.dateAdd == null && obj.dateAdd == null){} else 
			if(inObject.dateAdd == null || obj.dateAdd == null) return false;
			else
				if (inObject.dateAdd.compareTo(obj.dateAdd) != 0){
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

		if (inObject.isSent != obj.isSent){
					return false;
				}
		if (inObject.workOrderBytRef.code != obj.workOrderBytRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPlanInformCustomer anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPlanInformCustomer anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPLANINFORMCUSTOMER (CODE,TIMESTART,TIMEFINAL,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,ISSENT,WORKORDERBYTREFCODE,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.timeStart == null) {
				statement.setTimestamp(2,null);
			} else {
				statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeStart.getTime()));
			}
			if (anObject.timeFinal == null) {
				statement.setTimestamp(3,null);
			} else {
				statement.setTimestamp(3,new java.sql.Timestamp(anObject.timeFinal.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(4,null);
			} else {
				statement.setBigDecimal(4,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(5,anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(6,null);
			} else {
				statement.setTimestamp(6,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(7,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(8,null);
			} else {
				statement.setTimestamp(8,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.isSent != Integer.MIN_VALUE ) {
				statement.setInt(9,anObject.isSent);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.workOrderBytRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).exists(anObject.workOrderBytRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanInformCustomer.workOrderBytRef.code%} = {%"+anObject.workOrderBytRef.code+"%}");
				}
				statement.setInt(10,anObject.workOrderBytRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanInformCustomer.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(11,anObject.planRef.code);
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
			throw new PersistenceException("Error in method {%ENPlanInformCustomerDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPlanInformCustomer anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPlanInformCustomer anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENPlanInformCustomer oldObject = new ENPlanInformCustomer();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENPlanInformCustomer.modify_time_Field+" FROM  ENPLANINFORMCUSTOMER WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("TIMESTART") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEFINAL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("USERADD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEADD") == 0) {
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
					if(fieldNameStr.compareTo("ISSENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WORKORDERBYTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPLANINFORMCUSTOMER SET  TIMESTART = ? , TIMEFINAL = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , ISSENT = ? , WORKORDERBYTREFCODE = ? , PLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPLANINFORMCUSTOMER SET ";
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
					if (anObject.timeStart == null) {
						statement.setTimestamp(1,null);
					} else {
						statement.setTimestamp(1,new java.sql.Timestamp(anObject.timeStart.getTime()));
					}
					if (anObject.timeFinal == null) {
						statement.setTimestamp(2,null);
					} else {
						statement.setTimestamp(2,new java.sql.Timestamp(anObject.timeFinal.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(3,null);
					} else {
						statement.setBigDecimal(3,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(4,anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(5,null);
					} else {
						statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(6,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(7,null);
					} else {
						statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.isSent != Integer.MIN_VALUE) {
						statement.setInt(8,anObject.isSent);
					} else {
						statement.setNull(8,java.sql.Types.INTEGER);
					}
					if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.workOrderBytRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.planRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					statement.setInt(11,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TIMESTART".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeStart == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeStart.getTime()));
							}
							continue;
						}
						if("TIMEFINAL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeFinal == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.timeFinal.getTime()));
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
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1,new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
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
						if("ISSENT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.isSent);
							continue;
						}
						if("WORKORDERBYTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.workOrderBytRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
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

	} // end of save(ENPlanInformCustomer anObject,String[] anAttributes)


	public ENPlanInformCustomerShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPlanInformCustomer filterObject = new ENPlanInformCustomer();
		Vector<ENPlanInformCustomerShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPlanInformCustomerShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPlanInformCustomer filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.timeStart, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.timeFinal, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.isSent, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.workOrderBytRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPlanInformCustomerFilter filter) {
		String out = buildCondition((ENPlanInformCustomer)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPlanInformCustomer filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPlanInformCustomer.code_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeStart, ENPlanInformCustomer.timeStart_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.timeFinal, ENPlanInformCustomer.timeFinal_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENPlanInformCustomer.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENPlanInformCustomer.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENPlanInformCustomer.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPlanInformCustomer.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPlanInformCustomer.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.isSent, ENPlanInformCustomer.isSent_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.workOrderBytRef.code, ENPlanInformCustomer.workOrderBytRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENPlanInformCustomer.planRef_QFielld, out);
		}
		return out;
	}

	public ENPlanInformCustomerShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPlanInformCustomerShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPlanInformCustomerShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPlanInformCustomerShortList getFilteredList(ENPlanInformCustomer filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomer aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomer aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPlanInformCustomerShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomerFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomerFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomer aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENPlanInformCustomerShortList result = new ENPlanInformCustomerShortList();
		ENPlanInformCustomerShort anObject;
		result.list = new Vector<ENPlanInformCustomerShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANINFORMCUSTOMER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANINFORMCUSTOMER.CODE"+
			",ENPLANINFORMCUSTOMER.TIMESTART"+
			",ENPLANINFORMCUSTOMER.TIMEFINAL"+
			",ENPLANINFORMCUSTOMER.USERADD"+
			",ENPLANINFORMCUSTOMER.DATEADD"+
			",ENPLANINFORMCUSTOMER.USERGEN"+
			",ENPLANINFORMCUSTOMER.DATEEDIT"+
			",ENPLANINFORMCUSTOMER.ISSENT"+
			", ENWORKORDERBYT.CODE " +
			", ENWORKORDERBYT.NUMBERGEN " +
			", ENWORKORDERBYT.DATEGEN " +
			", ENWORKORDERBYT.COMMENTGEN " +
			", ENWORKORDERBYT.DATEADD " +
			", ENWORKORDERBYT.DATEEDIT " +
			", ENWORKORDERBYT.USERADD " +
			", ENWORKORDERBYT.USEREDIT " +
			", ENPLANWORK.CODE " +
			", ENPLANWORK.DATEGEN " +
			", ENPLANWORK.DATESTART " +
			", ENPLANWORK.DATEFINAL " +
			", ENPLANWORK.YEARGEN " +
			", ENPLANWORK.MONTHGEN " +
			", ENPLANWORK.YEARORIGINAL " +
			", ENPLANWORK.MONTHORIGINAL " +
			", ENPLANWORK.USERGEN " +
			", ENPLANWORK.DATEEDIT " +
			", ENPLANWORK.WORKORDERNUMBER " +
			", ENPLANWORK.DATEWORKORDER " +
			", ENPLANWORK.PRICONNECTIONNUMBER " +
			", ENPLANWORK.DATEENDPRICONNECTION " +
			", ENPLANWORK.INVESTWORKSDESCRIPTION " +
			", ENPLANWORK.SERVICESFSIDEFINID " +
			", ENPLANWORK.SERVICESFSIDECNNUM " +
			", ENPLANWORK.TOTALTIMEHOURS " +
			", ENPLANWORK.TOTALTIMEDAYS " +
			", ENPLANWORK.INVESTITEMNUMBER " +
		" FROM ENPLANINFORMCUSTOMER " +
			", ENWORKORDERBYT " +
			", ENPLANWORK " +
		"";
		whereStr = " ENWORKORDERBYT.CODE = ENPLANINFORMCUSTOMER.WORKORDERBYTREFCODE" ; //+
		whereStr += " AND ENPLANWORK.CODE = ENPLANINFORMCUSTOMER.PLANREFCODE" ; //+

	
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
				anObject = new ENPlanInformCustomerShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.timeStart = set.getTimestamp(2);
				anObject.timeFinal = set.getTimestamp(3);
				anObject.userAdd = set.getString(4);
				anObject.dateAdd = set.getTimestamp(5);
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.isSent = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.isSent = Integer.MIN_VALUE;
				}

				anObject.workOrderBytRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.workOrderBytRefCode = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRefNumberGen = set.getString(10);
				anObject.workOrderBytRefDateGen = set.getDate(11);
				anObject.workOrderBytRefCommentGen = set.getString(12);
				anObject.workOrderBytRefDateAdd = set.getTimestamp(13);
				anObject.workOrderBytRefDateEdit = set.getTimestamp(14);
				anObject.workOrderBytRefUserAdd = set.getString(15);
				anObject.workOrderBytRefUserEdit = set.getString(16);
				anObject.planRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(18);
				anObject.planRefDateStart = set.getDate(19);
				anObject.planRefDateFinal = set.getDate(20);
				anObject.planRefYearGen = set.getInt(21);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(22);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(23);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(24);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(25);
				anObject.planRefDateEdit = set.getDate(26);
				anObject.planRefWorkOrderNumber = set.getString(27);
				anObject.planRefDateWorkOrder = set.getDate(28);
				anObject.planRefPriConnectionNumber = set.getString(29);
				anObject.planRefDateEndPriConnection = set.getDate(30);
				anObject.planRefInvestWorksDescription = set.getString(31);
				anObject.planRefServicesFSideFinId = set.getInt(32);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(33);
				anObject.planRefTotalTimeHours = set.getBigDecimal(34);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(35);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(36);

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
	
	public int[] getFilteredCodeArray(ENPlanInformCustomerFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPlanInformCustomerFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPlanInformCustomer aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPLANINFORMCUSTOMER.CODE FROM ENPLANINFORMCUSTOMER";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANINFORMCUSTOMER.CODE";
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
				if(i < fromPosition) {
					continue;
				} else if(i >= fromPosition + quantity) {
					i++;
					break;
				}
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

	public ENPlanInformCustomer getObject(int uid) throws PersistenceException {
		ENPlanInformCustomer result = new ENPlanInformCustomer();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENPlanInformCustomer anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENPLANINFORMCUSTOMER.CODE, ENPLANINFORMCUSTOMER.TIMESTART, ENPLANINFORMCUSTOMER.TIMEFINAL, ENPLANINFORMCUSTOMER.MODIFY_TIME, ENPLANINFORMCUSTOMER.USERADD, ENPLANINFORMCUSTOMER.DATEADD, ENPLANINFORMCUSTOMER.USERGEN, ENPLANINFORMCUSTOMER.DATEEDIT, ENPLANINFORMCUSTOMER.ISSENT, ENPLANINFORMCUSTOMER.WORKORDERBYTREFCODE, ENPLANINFORMCUSTOMER.PLANREFCODE "
			+" FROM ENPLANINFORMCUSTOMER WHERE ENPLANINFORMCUSTOMER.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.timeStart = set.getTimestamp(2);
				anObject.timeFinal = set.getTimestamp(3);
				anObject.modify_time = set.getLong(4);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(5);
				anObject.dateAdd = set.getTimestamp(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getTimestamp(8);
				anObject.isSent = set.getInt(9);
				if (set.wasNull()) {
					anObject.isSent = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.workOrderBytRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				if(anObject.workOrderBytRef.code != Integer.MIN_VALUE) {
					anObject.setWorkOrderBytRef(
						new com.ksoe.energynet.dataminer.generated.ENWorkOrderBytDAOGen(connection,getUserProfile()).getRef(anObject.workOrderBytRef.code));
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENPlanInformCustomerRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPlanInformCustomerRef ref = new com.ksoe.energynet.valueobject.references.ENPlanInformCustomerRef();
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

		selectStr = "DELETE FROM  ENPLANINFORMCUSTOMER WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPlanInformCustomer object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPlanInformCustomer.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanInformCustomer.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPlanInformCustomer.remove%} access denied");
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
	
	public long count(ENPlanInformCustomerFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPlanInformCustomerFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPlanInformCustomerFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPLANINFORMCUSTOMER", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPlanInformCustomerFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPLANINFORMCUSTOMER");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanInformCustomer.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPlanInformCustomer.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPLANINFORMCUSTOMER.CODE FROM  ENPLANINFORMCUSTOMER WHERE  ENPLANINFORMCUSTOMER.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPLANINFORMCUSTOMER.CODE");
		_checkConditionToken(condition,"timestart","ENPLANINFORMCUSTOMER.TIMESTART");
		_checkConditionToken(condition,"timefinal","ENPLANINFORMCUSTOMER.TIMEFINAL");
		_checkConditionToken(condition,"modify_time","ENPLANINFORMCUSTOMER.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENPLANINFORMCUSTOMER.USERADD");
		_checkConditionToken(condition,"dateadd","ENPLANINFORMCUSTOMER.DATEADD");
		_checkConditionToken(condition,"usergen","ENPLANINFORMCUSTOMER.USERGEN");
		_checkConditionToken(condition,"dateedit","ENPLANINFORMCUSTOMER.DATEEDIT");
		_checkConditionToken(condition,"issent","ENPLANINFORMCUSTOMER.ISSENT");
		// relationship conditions
		_checkConditionToken(condition,"workorderbytref","WORKORDERBYTREFCODE");
		_checkConditionToken(condition,"workorderbytref.code","WORKORDERBYTREFCODE");
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPlanInformCustomer anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPLANINFORMCUSTOMER", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPLANINFORMCUSTOMER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPLANINFORMCUSTOMER", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPLANINFORMCUSTOMER");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPlanInformCustomerDAO
