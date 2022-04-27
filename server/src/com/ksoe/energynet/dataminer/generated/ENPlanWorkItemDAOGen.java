
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
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
import com.ksoe.energynet.valueobject.ENPlanWorkItem;
import com.ksoe.energynet.valueobject.filter.ENPlanWorkItemFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanWorkItemShort;
import com.ksoe.energynet.valueobject.lists.ENPlanWorkItemShortList;


/**
 * DAO Object for ENPlanWorkItem;
 *
 */

public class ENPlanWorkItemDAOGen extends GenericDataMiner {

	public ENPlanWorkItemDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPlanWorkItemDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPlanWorkItem inObject) throws PersistenceException {
		ENPlanWorkItem obj = new ENPlanWorkItem();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.countGen == null && obj.countGen == null){}
		else
			if(inObject.countGen == null || obj.countGen == null) return false;
			else
				if ( ! inObject.countGen.equals(obj.countGen)){
					return false;
				}

		if(inObject.timeGen == null && obj.timeGen == null){}
		else
			if(inObject.timeGen == null || obj.timeGen == null) return false;
			else
				if ( ! inObject.timeGen.equals(obj.timeGen)){
					return false;
				}

		if(inObject.costGen == null && obj.costGen == null){}
		else
			if(inObject.costGen == null || obj.costGen == null) return false;
			else
				if ( ! inObject.costGen.equals(obj.costGen)){
					return false;
				}

		if (inObject.workerCount != obj.workerCount){
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
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.kartaRef.code != obj.kartaRef.code){
			return false;
		}
		if (inObject.oldPlanRef.code != obj.oldPlanRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPlanWorkItem anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPlanWorkItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPLANWORKITEM (CODE,COUNTGEN,TIMEGEN,COSTGEN,WORKERCOUNT,COMMENTGEN,USERGEN,DATEEDIT,MODIFY_TIME,PLANREFCODE,KARTAREFCODE,OLDPLANREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			if (anObject.countGen != null) {
				anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2,anObject.countGen);
			if (anObject.timeGen != null) {
				anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(3,anObject.timeGen);
			if (anObject.costGen != null) {
				anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4,anObject.costGen);
			if (anObject.workerCount != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.workerCount);
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
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWorkItem.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(10,anObject.planRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}
			if (anObject.kartaRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.techcard.dataminer.generated.TKTechCardDAOGen(connection,getUserProfile()).exists(anObject.kartaRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.techcard.valueobject.ENPlanWorkItem.kartaRef.code%} = {%"+anObject.kartaRef.code+"%}");
				}
				statement.setInt(11,anObject.kartaRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.oldPlanRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.oldPlanRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENPlanWorkItem.oldPlanRef.code%} = {%"+anObject.oldPlanRef.code+"%}");
				}
				statement.setInt(12,anObject.oldPlanRef.code);
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
			throw new PersistenceException("Error in method {%ENPlanWorkItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPlanWorkItem anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPlanWorkItem anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENPlanWorkItem oldObject = new ENPlanWorkItem();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENPlanWorkItem.modify_time_Field+" FROM  ENPLANWORKITEM WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("COUNTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("COSTGEN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("WORKERCOUNT") == 0) {
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
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("KARTAREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("OLDPLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPLANWORKITEM SET  COUNTGEN = ? , TIMEGEN = ? , COSTGEN = ? , WORKERCOUNT = ? , COMMENTGEN = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , PLANREFCODE = ? , KARTAREFCODE = ? , OLDPLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPLANWORKITEM SET ";
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
					if (anObject.countGen != null) {
						anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1,anObject.countGen);
					if (anObject.timeGen != null) {
						anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(2,anObject.timeGen);
					if (anObject.costGen != null) {
						anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3,anObject.costGen);
					if (anObject.workerCount != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.workerCount);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					statement.setString(5,anObject.commentGen);
					statement.setString(6,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setDate(7,null);
					} else {
						statement.setDate(7,new java.sql.Date(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(8,null);
					} else {
						statement.setBigDecimal(8,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(9,anObject.planRef.code);
					} else {
						statement.setNull(9,java.sql.Types.INTEGER);
					}
					if (anObject.kartaRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.kartaRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.oldPlanRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.oldPlanRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					statement.setInt(12,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("COUNTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.countGen != null) {
								anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.countGen);
							continue;
						}
						if("TIMEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeGen != null) {
								anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.timeGen);
							continue;
						}
						if("COSTGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.costGen != null) {
								anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.costGen);
							continue;
						}
						if("WORKERCOUNT".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.workerCount);
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
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("KARTAREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.kartaRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.kartaRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("OLDPLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.oldPlanRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.oldPlanRef.code);
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

	} // end of save(ENPlanWorkItem anObject,String[] anAttributes)


	public ENPlanWorkItemShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPlanWorkItem filterObject = new ENPlanWorkItem();
		Vector<ENPlanWorkItemShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPlanWorkItemShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPlanWorkItem filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.countGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeGen, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.costGen, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.workerCount, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.commentGen, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.kartaRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.oldPlanRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPlanWorkItemFilter filter) {
		String out = buildCondition((ENPlanWorkItem)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPlanWorkItem filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPlanWorkItem.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.countGen, ENPlanWorkItem.countGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeGen, ENPlanWorkItem.timeGen_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.costGen, ENPlanWorkItem.costGen_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.workerCount, ENPlanWorkItem.workerCount_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.commentGen, ENPlanWorkItem.commentGen_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPlanWorkItem.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPlanWorkItem.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENPlanWorkItem.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENPlanWorkItem.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.kartaRef.code, ENPlanWorkItem.kartaRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.oldPlanRef.code, ENPlanWorkItem.oldPlanRef_QFielld, out);
		}
		return out;
	}

	public ENPlanWorkItemShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPlanWorkItemShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPlanWorkItemShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPlanWorkItemShortList getFilteredList(ENPlanWorkItem filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItem aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItem aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPlanWorkItemShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItemFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItemFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPlanWorkItemShortList getScrollableFilteredList(ENPlanWorkItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENPlanWorkItemShortList result = new ENPlanWorkItemShortList();
		ENPlanWorkItemShort anObject;
		result.list = new Vector<ENPlanWorkItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORKITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANWORKITEM.CODE"+
			",ENPLANWORKITEM.COUNTGEN"+
			",ENPLANWORKITEM.TIMEGEN"+
			",ENPLANWORKITEM.COSTGEN"+
			",ENPLANWORKITEM.USERGEN"+
			",ENPLANWORKITEM.DATEEDIT"+
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
			", TKTECHCARD.CODE " +
			", TKTECHCARD.TECHKARTNUMBER " +
			", TKTECHCARD.NAME " +
			", TKTECHCARD.SAFETY " +
			", TKTECHCARD.DATECREATION " +
			", TKTECHCARD.DATEFROM " +
			", TKTECHCARD.DATETO " +
			", TKTECHCARD.WORKCONDITIONS " +
			", p2.CODE " +
			", p2.DATEGEN " +
			", p2.DATESTART " +
			", p2.DATEFINAL " +
			", p2.YEARGEN " +
			", p2.MONTHGEN " +
			", p2.YEARORIGINAL " +
			", p2.MONTHORIGINAL " +
			", p2.USERGEN " +
			", p2.DATEEDIT " +
			", p2.WORKORDERNUMBER " +
			", p2.DATEWORKORDER " +
			", p2.PRICONNECTIONNUMBER " +
			", p2.DATEENDPRICONNECTION " +
			", p2.INVESTWORKSDESCRIPTION " +
			", p2.SERVICESFSIDEFINID " +
			", p2.SERVICESFSIDECNNUM " +
			", p2.TOTALTIMEHOURS " +
			", p2.TOTALTIMEDAYS " +
			", p2.INVESTITEMNUMBER " +
		" FROM ENPLANWORKITEM " +
			", ENPLANWORK " +
			", TKTECHCARD " +
			", ENPLANWORK p2 " +
		"";
		whereStr = " ENPLANWORK.CODE = ENPLANWORKITEM.PLANREFCODE" ; //+
		whereStr += " AND TKTECHCARD.CODE = ENPLANWORKITEM.KARTAREFCODE" ; //+
		whereStr += " AND p2.CODE = ENPLANWORKITEM.OLDPLANREFCODE" ; //+

	
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
				anObject = new ENPlanWorkItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeGen = set.getBigDecimal(3);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getDate(6);

				anObject.planRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(8);

				anObject.planRefYearGen = set.getInt(11);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(12);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}

				anObject.planRefUserGen = set.getString(15);
				anObject.planRefDateEdit = set.getDate(16);

				anObject.kartaRefCode = set.getInt(27);
				if(set.wasNull()) {
					anObject.kartaRefCode = Integer.MIN_VALUE;
				}

				anObject.kartaRefName = set.getString(29);

				anObject.oldPlanRefCode = set.getInt(35);
				if(set.wasNull()) {
					anObject.oldPlanRefCode = Integer.MIN_VALUE;
				}

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
	
	public int[] getFilteredCodeArray(ENPlanWorkItemFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENPlanWorkItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPLANWORKITEM.CODE FROM ENPLANWORKITEM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORKITEM.CODE";
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

	public ENPlanWorkItem getObject(int uid) throws PersistenceException {
		ENPlanWorkItem result = new ENPlanWorkItem();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENPlanWorkItem anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENPLANWORKITEM.CODE, ENPLANWORKITEM.COUNTGEN, ENPLANWORKITEM.TIMEGEN, ENPLANWORKITEM.COSTGEN, ENPLANWORKITEM.WORKERCOUNT, ENPLANWORKITEM.COMMENTGEN, ENPLANWORKITEM.USERGEN, ENPLANWORKITEM.DATEEDIT, ENPLANWORKITEM.MODIFY_TIME, ENPLANWORKITEM.PLANREFCODE, ENPLANWORKITEM.KARTAREFCODE, ENPLANWORKITEM.OLDPLANREFCODE "
			+" FROM ENPLANWORKITEM WHERE ENPLANWORKITEM.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.countGen = set.getBigDecimal(2);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeGen = set.getBigDecimal(3);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costGen = set.getBigDecimal(4);
				if(anObject.costGen != null) {
					anObject.costGen = anObject.costGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.workerCount = set.getInt(5);
				if (set.wasNull()) {
					anObject.workerCount = Integer.MIN_VALUE;
				}
				anObject.commentGen = set.getString(6);
				anObject.userGen = set.getString(7);
				anObject.dateEdit = set.getDate(8);
				anObject.modify_time = set.getLong(9);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.kartaRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.kartaRef.code = Integer.MIN_VALUE;
				}
				anObject.oldPlanRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.oldPlanRef.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.kartaRef.code != Integer.MIN_VALUE) {
					anObject.setKartaRef(
						new com.ksoe.techcard.dataminer.generated.TKTechCardDAOGen(connection,getUserProfile()).getRef(anObject.kartaRef.code));
				}
				if(anObject.oldPlanRef.code != Integer.MIN_VALUE) {
					anObject.setOldPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.oldPlanRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef ref = new com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef();
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

		selectStr = "DELETE FROM  ENPLANWORKITEM WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPlanWorkItem object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPlanWorkItem.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWorkItem.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENPlanWorkItem.remove%} access denied");
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
	
	public long count(ENPlanWorkItemFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPlanWorkItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPlanWorkItemFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPLANWORKITEM", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPlanWorkItemFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPLANWORKITEM");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENPlanWorkItem.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENPlanWorkItem.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENPLANWORKITEM.CODE FROM  ENPLANWORKITEM WHERE  ENPLANWORKITEM.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPLANWORKITEM.CODE");
		_checkConditionToken(condition,"countgen","ENPLANWORKITEM.COUNTGEN");
		_checkConditionToken(condition,"timegen","ENPLANWORKITEM.TIMEGEN");
		_checkConditionToken(condition,"costgen","ENPLANWORKITEM.COSTGEN");
		_checkConditionToken(condition,"workercount","ENPLANWORKITEM.WORKERCOUNT");
		_checkConditionToken(condition,"commentgen","ENPLANWORKITEM.COMMENTGEN");
		_checkConditionToken(condition,"usergen","ENPLANWORKITEM.USERGEN");
		_checkConditionToken(condition,"dateedit","ENPLANWORKITEM.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENPLANWORKITEM.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"kartaref","KARTAREFCODE");
		_checkConditionToken(condition,"kartaref.code","KARTAREFCODE");
		_checkConditionToken(condition,"oldplanref","OLDPLANREFCODE");
		_checkConditionToken(condition,"oldplanref.code","OLDPLANREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPlanWorkItem anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPLANWORKITEM", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPLANWORKITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPLANWORKITEM", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPLANWORKITEM");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPlanWorkItemDAO
