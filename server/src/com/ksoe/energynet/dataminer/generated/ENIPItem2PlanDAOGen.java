
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
import com.ksoe.energynet.valueobject.ENIPItem2Plan;
import com.ksoe.energynet.valueobject.filter.ENIPItem2PlanFilter;
import com.ksoe.energynet.valueobject.brief.ENIPItem2PlanShort;
import com.ksoe.energynet.valueobject.lists.ENIPItem2PlanShortList;


/**
 * DAO Object for ENIPItem2Plan;
 *
 */

public class ENIPItem2PlanDAOGen extends GenericDataMiner {

	public ENIPItem2PlanDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENIPItem2PlanDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENIPItem2Plan inObject) throws PersistenceException {
		ENIPItem2Plan obj = new ENIPItem2Plan();
		obj.code = inObject.code;
		loadObject(obj);

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
		if (inObject.ipItemRef.code != obj.ipItemRef.code){
			return false;
		}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		return true;
	}

	public int add(ENIPItem2Plan anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENIPItem2Plan anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENIPITEM2PLAN (CODE,USERADD,DATEADD,USERGEN,DATEEDIT,MODIFY_TIME,IPITEMREFCODE,PLANREFCODE) VALUES (?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(3,null);
			} else {
				statement.setTimestamp(3,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(4,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(5,null);
			} else {
				statement.setTimestamp(5,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(6,null);
			} else {
				statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.ipItemRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).exists(anObject.ipItemRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2Plan.ipItemRef.code%} = {%"+anObject.ipItemRef.code+"%}");
				}
				statement.setInt(7,anObject.ipItemRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENIPItem2Plan.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(8,anObject.planRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENIPItem2PlanDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENIPItem2Plan anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENIPItem2Plan anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENIPItem2Plan oldObject = new ENIPItem2Plan();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENIPItem2Plan.modify_time_Field+" FROM  ENIPITEM2PLAN WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("IPITEMREF") == 0) {
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
				selectStr = "UPDATE ENIPITEM2PLAN SET  USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , MODIFY_TIME = ? , IPITEMREFCODE = ? , PLANREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENIPITEM2PLAN SET ";
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
					statement.setString(1,anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(2,null);
					} else {
						statement.setTimestamp(2,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(3,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(4,null);
					} else {
						statement.setTimestamp(4,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(5,null);
					} else {
						statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.ipItemRef.code != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.ipItemRef.code);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.planRef.code);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					statement.setInt(8,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
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
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1,null);
							} else {
								statement.setBigDecimal(i+1,new java.math.BigDecimal(anObject.modify_time));
							}
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

	} // end of save(ENIPItem2Plan anObject,String[] anAttributes)


	public ENIPItem2PlanShort getShortObject(int anObjectCode) throws PersistenceException {
		ENIPItem2Plan filterObject = new ENIPItem2Plan();
		Vector<ENIPItem2PlanShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENIPItem2PlanShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENIPItem2Plan filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ipItemRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENIPItem2PlanFilter filter) {
		String out = buildCondition((ENIPItem2Plan)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENIPItem2Plan filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENIPItem2Plan.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENIPItem2Plan.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENIPItem2Plan.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENIPItem2Plan.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENIPItem2Plan.dateEdit_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENIPItem2Plan.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ipItemRef.code, ENIPItem2Plan.ipItemRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENIPItem2Plan.planRef_QFielld, out);
		}
		return out;
	}

	public ENIPItem2PlanShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENIPItem2PlanShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENIPItem2PlanShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENIPItem2PlanShortList getFilteredList(ENIPItem2Plan filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENIPItem2PlanShortList getScrollableFilteredList(ENIPItem2Plan aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENIPItem2PlanShortList getScrollableFilteredList(ENIPItem2Plan aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENIPItem2PlanShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENIPItem2PlanShortList getScrollableFilteredList(ENIPItem2PlanFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENIPItem2PlanShortList getScrollableFilteredList(ENIPItem2PlanFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENIPItem2PlanShortList getScrollableFilteredList(ENIPItem2Plan aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENIPItem2PlanShortList result = new ENIPItem2PlanShortList();
		ENIPItem2PlanShort anObject;
		result.list = new Vector<ENIPItem2PlanShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM2PLAN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENIPITEM2PLAN.CODE"+
			",ENIPITEM2PLAN.USERADD"+
			",ENIPITEM2PLAN.DATEADD"+
			",ENIPITEM2PLAN.USERGEN"+
			",ENIPITEM2PLAN.DATEEDIT"+
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
		" FROM ENIPITEM2PLAN " +
			", ENIPITEM " +
			", ENPLANWORK " +
		"";
		whereStr = " ENIPITEM.CODE = ENIPITEM2PLAN.IPITEMREFCODE" ; //+
		whereStr += " AND ENPLANWORK.CODE = ENIPITEM2PLAN.PLANREFCODE" ; //+

	
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
				anObject = new ENIPItem2PlanShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userAdd = set.getString(2);
				anObject.dateAdd = set.getTimestamp(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);

				anObject.ipItemRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.ipItemRefCode = Integer.MIN_VALUE;
				}
				anObject.ipItemRefName = set.getString(7);
				anObject.ipItemRefBuhName = set.getString(8);
				anObject.ipItemRefItemNumber = set.getString(9);
				anObject.ipItemRefInvNumber = set.getString(10);
				anObject.ipItemRefIsProjectDocument = set.getInt(11);
				if(set.wasNull()) {
					anObject.ipItemRefIsProjectDocument = Integer.MIN_VALUE;
				}
				anObject.ipItemRefFinancing = set.getString(12);
				anObject.ipItemRefCommentGen = set.getString(13);
				anObject.ipItemRefCountGen = set.getBigDecimal(14);
				if(anObject.ipItemRefCountGen != null) {
					anObject.ipItemRefCountGen = anObject.ipItemRefCountGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPrice = set.getBigDecimal(15);
				if(anObject.ipItemRefPrice != null) {
					anObject.ipItemRefPrice = anObject.ipItemRefPrice.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGen = set.getBigDecimal(16);
				if(anObject.ipItemRefSumGen != null) {
					anObject.ipItemRefSumGen = anObject.ipItemRefSumGen.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1count = set.getBigDecimal(17);
				if(anObject.ipItemRefQuarter1count != null) {
					anObject.ipItemRefQuarter1count = anObject.ipItemRefQuarter1count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter1sum = set.getBigDecimal(18);
				if(anObject.ipItemRefQuarter1sum != null) {
					anObject.ipItemRefQuarter1sum = anObject.ipItemRefQuarter1sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2count = set.getBigDecimal(19);
				if(anObject.ipItemRefQuarter2count != null) {
					anObject.ipItemRefQuarter2count = anObject.ipItemRefQuarter2count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter2sum = set.getBigDecimal(20);
				if(anObject.ipItemRefQuarter2sum != null) {
					anObject.ipItemRefQuarter2sum = anObject.ipItemRefQuarter2sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3count = set.getBigDecimal(21);
				if(anObject.ipItemRefQuarter3count != null) {
					anObject.ipItemRefQuarter3count = anObject.ipItemRefQuarter3count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter3sum = set.getBigDecimal(22);
				if(anObject.ipItemRefQuarter3sum != null) {
					anObject.ipItemRefQuarter3sum = anObject.ipItemRefQuarter3sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4count = set.getBigDecimal(23);
				if(anObject.ipItemRefQuarter4count != null) {
					anObject.ipItemRefQuarter4count = anObject.ipItemRefQuarter4count.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefQuarter4sum = set.getBigDecimal(24);
				if(anObject.ipItemRefQuarter4sum != null) {
					anObject.ipItemRefQuarter4sum = anObject.ipItemRefQuarter4sum.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefCountGenInside = set.getBigDecimal(25);
				if(anObject.ipItemRefCountGenInside != null) {
					anObject.ipItemRefCountGenInside = anObject.ipItemRefCountGenInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefPriceInside = set.getBigDecimal(26);
				if(anObject.ipItemRefPriceInside != null) {
					anObject.ipItemRefPriceInside = anObject.ipItemRefPriceInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefSumGenInside = set.getBigDecimal(27);
				if(anObject.ipItemRefSumGenInside != null) {
					anObject.ipItemRefSumGenInside = anObject.ipItemRefSumGenInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1countInside = set.getBigDecimal(28);
				if(anObject.ipItemRefMm1countInside != null) {
					anObject.ipItemRefMm1countInside = anObject.ipItemRefMm1countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm1sumInside = set.getBigDecimal(29);
				if(anObject.ipItemRefMm1sumInside != null) {
					anObject.ipItemRefMm1sumInside = anObject.ipItemRefMm1sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2countInside = set.getBigDecimal(30);
				if(anObject.ipItemRefMm2countInside != null) {
					anObject.ipItemRefMm2countInside = anObject.ipItemRefMm2countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm2sumInside = set.getBigDecimal(31);
				if(anObject.ipItemRefMm2sumInside != null) {
					anObject.ipItemRefMm2sumInside = anObject.ipItemRefMm2sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3countInside = set.getBigDecimal(32);
				if(anObject.ipItemRefMm3countInside != null) {
					anObject.ipItemRefMm3countInside = anObject.ipItemRefMm3countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm3sumInside = set.getBigDecimal(33);
				if(anObject.ipItemRefMm3sumInside != null) {
					anObject.ipItemRefMm3sumInside = anObject.ipItemRefMm3sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4countInside = set.getBigDecimal(34);
				if(anObject.ipItemRefMm4countInside != null) {
					anObject.ipItemRefMm4countInside = anObject.ipItemRefMm4countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm4sumInside = set.getBigDecimal(35);
				if(anObject.ipItemRefMm4sumInside != null) {
					anObject.ipItemRefMm4sumInside = anObject.ipItemRefMm4sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5countInside = set.getBigDecimal(36);
				if(anObject.ipItemRefMm5countInside != null) {
					anObject.ipItemRefMm5countInside = anObject.ipItemRefMm5countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm5sumInside = set.getBigDecimal(37);
				if(anObject.ipItemRefMm5sumInside != null) {
					anObject.ipItemRefMm5sumInside = anObject.ipItemRefMm5sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6countInside = set.getBigDecimal(38);
				if(anObject.ipItemRefMm6countInside != null) {
					anObject.ipItemRefMm6countInside = anObject.ipItemRefMm6countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm6sumInside = set.getBigDecimal(39);
				if(anObject.ipItemRefMm6sumInside != null) {
					anObject.ipItemRefMm6sumInside = anObject.ipItemRefMm6sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7countInside = set.getBigDecimal(40);
				if(anObject.ipItemRefMm7countInside != null) {
					anObject.ipItemRefMm7countInside = anObject.ipItemRefMm7countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm7sumInside = set.getBigDecimal(41);
				if(anObject.ipItemRefMm7sumInside != null) {
					anObject.ipItemRefMm7sumInside = anObject.ipItemRefMm7sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8countInside = set.getBigDecimal(42);
				if(anObject.ipItemRefMm8countInside != null) {
					anObject.ipItemRefMm8countInside = anObject.ipItemRefMm8countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm8sumInside = set.getBigDecimal(43);
				if(anObject.ipItemRefMm8sumInside != null) {
					anObject.ipItemRefMm8sumInside = anObject.ipItemRefMm8sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9countInside = set.getBigDecimal(44);
				if(anObject.ipItemRefMm9countInside != null) {
					anObject.ipItemRefMm9countInside = anObject.ipItemRefMm9countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm9sumInside = set.getBigDecimal(45);
				if(anObject.ipItemRefMm9sumInside != null) {
					anObject.ipItemRefMm9sumInside = anObject.ipItemRefMm9sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10countInside = set.getBigDecimal(46);
				if(anObject.ipItemRefMm10countInside != null) {
					anObject.ipItemRefMm10countInside = anObject.ipItemRefMm10countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm10sumInside = set.getBigDecimal(47);
				if(anObject.ipItemRefMm10sumInside != null) {
					anObject.ipItemRefMm10sumInside = anObject.ipItemRefMm10sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11countInside = set.getBigDecimal(48);
				if(anObject.ipItemRefMm11countInside != null) {
					anObject.ipItemRefMm11countInside = anObject.ipItemRefMm11countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm11sumInside = set.getBigDecimal(49);
				if(anObject.ipItemRefMm11sumInside != null) {
					anObject.ipItemRefMm11sumInside = anObject.ipItemRefMm11sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12countInside = set.getBigDecimal(50);
				if(anObject.ipItemRefMm12countInside != null) {
					anObject.ipItemRefMm12countInside = anObject.ipItemRefMm12countInside.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefMm12sumInside = set.getBigDecimal(51);
				if(anObject.ipItemRefMm12sumInside != null) {
					anObject.ipItemRefMm12sumInside = anObject.ipItemRefMm12sumInside.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ipItemRefInfoTenders = set.getString(52);
				anObject.ipItemRefUserAdd = set.getString(53);
				anObject.ipItemRefDateAdd = set.getTimestamp(54);
				anObject.ipItemRefUserGen = set.getString(55);
				anObject.ipItemRefDateEdit = set.getTimestamp(56);
				anObject.planRefCode = set.getInt(57);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(58);
				anObject.planRefDateStart = set.getDate(59);
				anObject.planRefDateFinal = set.getDate(60);
				anObject.planRefYearGen = set.getInt(61);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(62);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(63);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(64);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(65);
				anObject.planRefDateEdit = set.getDate(66);
				anObject.planRefWorkOrderNumber = set.getString(67);
				anObject.planRefDateWorkOrder = set.getDate(68);
				anObject.planRefPriConnectionNumber = set.getString(69);
				anObject.planRefDateEndPriConnection = set.getDate(70);
				anObject.planRefInvestWorksDescription = set.getString(71);
				anObject.planRefServicesFSideFinId = set.getInt(72);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(73);
				anObject.planRefTotalTimeHours = set.getBigDecimal(74);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(75);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(76);

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
	
	public int[] getFilteredCodeArray(ENIPItem2PlanFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENIPItem2PlanFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENIPItem2Plan aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENIPITEM2PLAN.CODE FROM ENIPITEM2PLAN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENIPITEM2PLAN.CODE";
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

	public ENIPItem2Plan getObject(int uid) throws PersistenceException {
		ENIPItem2Plan result = new ENIPItem2Plan();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENIPItem2Plan anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENIPITEM2PLAN.CODE, ENIPITEM2PLAN.USERADD, ENIPITEM2PLAN.DATEADD, ENIPITEM2PLAN.USERGEN, ENIPITEM2PLAN.DATEEDIT, ENIPITEM2PLAN.MODIFY_TIME, ENIPITEM2PLAN.IPITEMREFCODE, ENIPITEM2PLAN.PLANREFCODE "
			+" FROM ENIPITEM2PLAN WHERE ENIPITEM2PLAN.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.userAdd = set.getString(2);
				anObject.dateAdd = set.getTimestamp(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.modify_time = set.getLong(6);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.ipItemRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.ipItemRef.code = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				if(anObject.ipItemRef.code != Integer.MIN_VALUE) {
					anObject.setIpItemRef(
						new com.ksoe.energynet.dataminer.generated.ENIPItemDAOGen(connection,getUserProfile()).getRef(anObject.ipItemRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENIPItem2PlanRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENIPItem2PlanRef ref = new com.ksoe.energynet.valueobject.references.ENIPItem2PlanRef();
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

		selectStr = "DELETE FROM  ENIPITEM2PLAN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENIPItem2Plan object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENIPItem2Plan.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2Plan.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem2Plan.remove%} access denied");
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
	
	public long count(ENIPItem2PlanFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENIPItem2PlanFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENIPItem2PlanFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENIPITEM2PLAN", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENIPItem2PlanFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENIPITEM2PLAN");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENIPItem2Plan.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENIPItem2Plan.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENIPITEM2PLAN.CODE FROM  ENIPITEM2PLAN WHERE  ENIPITEM2PLAN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENIPITEM2PLAN.CODE");
		_checkConditionToken(condition,"useradd","ENIPITEM2PLAN.USERADD");
		_checkConditionToken(condition,"dateadd","ENIPITEM2PLAN.DATEADD");
		_checkConditionToken(condition,"usergen","ENIPITEM2PLAN.USERGEN");
		_checkConditionToken(condition,"dateedit","ENIPITEM2PLAN.DATEEDIT");
		_checkConditionToken(condition,"modify_time","ENIPITEM2PLAN.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"ipitemref","IPITEMREFCODE");
		_checkConditionToken(condition,"ipitemref.code","IPITEMREFCODE");
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
	
	private void _collectAutoIncrementFields(ENIPItem2Plan anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENIPITEM2PLAN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENIPITEM2PLAN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENIPITEM2PLAN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENIPITEM2PLAN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENIPItem2PlanDAO
