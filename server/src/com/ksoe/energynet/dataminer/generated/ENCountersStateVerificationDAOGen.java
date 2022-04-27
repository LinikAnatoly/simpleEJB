
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
import com.ksoe.energynet.valueobject.ENCountersStateVerification;
import com.ksoe.energynet.valueobject.filter.ENCountersStateVerificationFilter;
import com.ksoe.energynet.valueobject.brief.ENCountersStateVerificationShort;
import com.ksoe.energynet.valueobject.lists.ENCountersStateVerificationShortList;


/**
 * DAO Object for ENCountersStateVerification;
 *
 */

public class ENCountersStateVerificationDAOGen extends GenericDataMiner {

	public ENCountersStateVerificationDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENCountersStateVerificationDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENCountersStateVerification inObject) throws PersistenceException {
		ENCountersStateVerification obj = new ENCountersStateVerification();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.invNumber == null && obj.invNumber == null){}
		else
			if(inObject.invNumber == null || obj.invNumber == null) return false;
			else
				if ( ! inObject.invNumber.equals(obj.invNumber)){
					return false;
				}

		if(inObject.name == null && obj.name == null){}
		else
			if(inObject.name == null || obj.name == null) return false;
			else
				if ( ! inObject.name.equals(obj.name)){
					return false;
				}

		if(inObject.buildNumber == null && obj.buildNumber == null){}
		else
			if(inObject.buildNumber == null || obj.buildNumber == null) return false;
			else
				if ( ! inObject.buildNumber.equals(obj.buildNumber)){
					return false;
				}

		if(inObject.priceGen == null && obj.priceGen == null){}
		else
			if(inObject.priceGen == null || obj.priceGen == null) return false;
			else
				if ( ! inObject.priceGen.equals(obj.priceGen)){
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
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.fkOrderRef.code != obj.fkOrderRef.code){
			return false;
		}
		return true;
	}

	public int add(ENCountersStateVerification anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENCountersStateVerification anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENCOUNTERSSTATEVERFCTN (CODE,INVNUMBER,NAME,BUILDNUMBER,PRICEGEN,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,PLANREFCODE,ACTREFCODE,FKORDERREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.invNumber);
			statement.setString(3,anObject.name);
			statement.setString(4,anObject.buildNumber);
			if (anObject.priceGen != null) {
				anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5,anObject.priceGen);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(6,null);
			} else {
				statement.setBigDecimal(6,new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(7,anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(8,null);
			} else {
				statement.setTimestamp(8,new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(9,anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(10,null);
			} else {
				statement.setTimestamp(10,new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).exists(anObject.planRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCountersStateVerification.planRef.code%} = {%"+anObject.planRef.code+"%}");
				}
				statement.setInt(11,anObject.planRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).exists(anObject.actRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCountersStateVerification.actRef.code%} = {%"+anObject.actRef.code+"%}");
				}
				statement.setInt(12,anObject.actRef.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.fkOrderRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).exists(anObject.fkOrderRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.rqorder.valueobject.ENCountersStateVerification.fkOrderRef.code%} = {%"+anObject.fkOrderRef.code+"%}");
				}
				statement.setInt(13,anObject.fkOrderRef.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}

			statement.execute();
			return anObject.code;
		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENCountersStateVerificationDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENCountersStateVerification anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENCountersStateVerification anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENCountersStateVerification oldObject = new ENCountersStateVerification();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENCountersStateVerification.modify_time_Field+" FROM  ENCOUNTERSSTATEVERFCTN WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("INVNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("BUILDNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PRICEGEN") == 0) {
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
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FKORDERREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENCOUNTERSSTATEVERFCTN SET  INVNUMBER = ? , NAME = ? , BUILDNUMBER = ? , PRICEGEN = ? , MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , PLANREFCODE = ? , ACTREFCODE = ? , FKORDERREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENCOUNTERSSTATEVERIFICATION SET ";
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
					statement.setString(1,anObject.invNumber);
					statement.setString(2,anObject.name);
					statement.setString(3,anObject.buildNumber);
					if (anObject.priceGen != null) {
						anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4,anObject.priceGen);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(5,null);
					} else {
						statement.setBigDecimal(5,new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(6,anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(7,null);
					} else {
						statement.setTimestamp(7,new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(8,anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(9,null);
					} else {
						statement.setTimestamp(9,new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.planRef.code);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.actRef.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.fkOrderRef.code != Integer.MIN_VALUE) {
						statement.setInt(12,anObject.fkOrderRef.code);
					} else {
						statement.setNull(12,java.sql.Types.INTEGER);
					}
					statement.setInt(13,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.invNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.name);
							continue;
						}
						if("BUILDNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.buildNumber);
							continue;
						}
						if("PRICEGEN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.priceGen != null) {
								anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1,anObject.priceGen);
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
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.planRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.actRef.code);
							} else {
								statement.setNull(i+1,java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FKORDERREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.fkOrderRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.fkOrderRef.code);
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

	} // end of save(ENCountersStateVerification anObject,String[] anAttributes)


	public ENCountersStateVerificationShort getShortObject(int anObjectCode) throws PersistenceException {
		ENCountersStateVerification filterObject = new ENCountersStateVerification();
		Vector<ENCountersStateVerificationShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENCountersStateVerificationShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENCountersStateVerification filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.buildNumber, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.priceGen, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.fkOrderRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENCountersStateVerificationFilter filter) {
		String out = buildCondition((ENCountersStateVerification)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENCountersStateVerification filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENCountersStateVerification.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENCountersStateVerification.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENCountersStateVerification.name_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.buildNumber, ENCountersStateVerification.buildNumber_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.priceGen, ENCountersStateVerification.priceGen_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENCountersStateVerification.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENCountersStateVerification.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENCountersStateVerification.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENCountersStateVerification.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENCountersStateVerification.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENCountersStateVerification.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENCountersStateVerification.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.fkOrderRef.code, ENCountersStateVerification.fkOrderRef_QFielld, out);
		}
		return out;
	}

	public ENCountersStateVerificationShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENCountersStateVerificationShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENCountersStateVerificationShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENCountersStateVerificationShortList getFilteredList(ENCountersStateVerification filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENCountersStateVerificationShortList getScrollableFilteredList(ENCountersStateVerification aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENCountersStateVerificationShortList getScrollableFilteredList(ENCountersStateVerification aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENCountersStateVerificationShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENCountersStateVerificationShortList getScrollableFilteredList(ENCountersStateVerificationFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENCountersStateVerificationShortList getScrollableFilteredList(ENCountersStateVerificationFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENCountersStateVerificationShortList getScrollableFilteredList(ENCountersStateVerification aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENCountersStateVerificationShortList result = new ENCountersStateVerificationShortList();
		ENCountersStateVerificationShort anObject;
		result.list = new Vector<ENCountersStateVerificationShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCOUNTERSSTATEVERFCTN.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCOUNTERSSTATEVERFCTN.CODE"+
			",ENCOUNTERSSTATEVERFCTN.INVNUMBER"+
			",ENCOUNTERSSTATEVERFCTN.NAME"+
			",ENCOUNTERSSTATEVERFCTN.BUILDNUMBER"+
			",ENCOUNTERSSTATEVERFCTN.PRICEGEN"+
			",ENCOUNTERSSTATEVERFCTN.USERADD"+
			",ENCOUNTERSSTATEVERFCTN.DATEADD"+
			",ENCOUNTERSSTATEVERFCTN.USERGEN"+
			",ENCOUNTERSSTATEVERFCTN.DATEEDIT"+
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
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINDOCCODE " +
			", ENACT.FINDOCMECHANICCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", RQFKORDER.CODE " +
			", RQFKORDER.NUMBERDOC " +
			", RQFKORDER.DATEGEN " +
			", RQFKORDER.DATESHIPMENT " +
			", RQFKORDER.DATEPOSTING " +
			", RQFKORDER.MOLOUTCODE " +
			", RQFKORDER.MOLOUTNAME " +
			", RQFKORDER.MOLINCODE " +
			", RQFKORDER.MOLINNAME " +
			", RQFKORDER.EXPEDITORCODE " +
			", RQFKORDER.EXPEDITORNAME " +
			", RQFKORDER.WARRANTNUMBER " +
			", RQFKORDER.WARRANTDATE " +
			", RQFKORDER.WARRANTFIO " +
			", RQFKORDER.SUMWITHOUTNDS " +
			", RQFKORDER.SUMNDS " +
			", RQFKORDER.NDSPERCENT " +
			", RQFKORDER.DATEADD " +
			", RQFKORDER.USERADD " +
			", RQFKORDER.DATEEDIT " +
			", RQFKORDER.USERGEN " +
		" FROM ENCOUNTERSSTATEVERFCTN " +
			", ENPLANWORK " +
			", ENACT " +
			", RQFKORDER " +
		"";
		whereStr = " ENPLANWORK.CODE = ENCOUNTERSSTATEVERFCTN.PLANREFCODE" ; //+
		whereStr += " AND ENACT.CODE = ENCOUNTERSSTATEVERFCTN.ACTREFCODE" ; //+
		whereStr += " AND RQFKORDER.CODE = ENCOUNTERSSTATEVERFCTN.FKORDERREFCODE" ; //+

	
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
				anObject = new ENCountersStateVerificationShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.priceGen = set.getBigDecimal(5);
				if(anObject.priceGen != null) {
					anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.userAdd = set.getString(6);
				anObject.dateAdd = set.getTimestamp(7);
				anObject.userGen = set.getString(8);
				anObject.dateEdit = set.getTimestamp(9);

				anObject.planRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(11);
				anObject.planRefDateStart = set.getDate(12);
				anObject.planRefDateFinal = set.getDate(13);
				anObject.planRefYearGen = set.getInt(14);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(15);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(16);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(18);
				anObject.planRefDateEdit = set.getDate(19);
				anObject.planRefWorkOrderNumber = set.getString(20);
				anObject.planRefDateWorkOrder = set.getDate(21);
				anObject.planRefPriConnectionNumber = set.getString(22);
				anObject.planRefDateEndPriConnection = set.getDate(23);
				anObject.planRefInvestWorksDescription = set.getString(24);
				anObject.planRefServicesFSideFinId = set.getInt(25);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(26);
				anObject.planRefTotalTimeHours = set.getBigDecimal(27);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(28);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(29);
				anObject.actRefCode = set.getInt(30);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(31);
				anObject.actRefDateGen = set.getDate(32);
				anObject.actRefFinDocCode = set.getInt(33);
				if(set.wasNull()) {
					anObject.actRefFinDocCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinDocMechanicCode = set.getInt(34);
				if(set.wasNull()) {
					anObject.actRefFinDocMechanicCode = Integer.MIN_VALUE;
				}
				anObject.actRefFinMolName = set.getString(35);
				anObject.actRefFinMechanicName = set.getString(36);
				anObject.actRefInvNumber = set.getString(37);
				anObject.actRefUserGen = set.getString(38);
				anObject.actRefDateEdit = set.getDate(39);
				anObject.actRefDateAct = set.getDate(40);
				anObject.actRefMolCodeObject = set.getString(41);
				anObject.fkOrderRefCode = set.getInt(42);
				if(set.wasNull()) {
					anObject.fkOrderRefCode = Integer.MIN_VALUE;
				}
				anObject.fkOrderRefNumberDoc = set.getString(43);
				anObject.fkOrderRefDateGen = set.getDate(44);
				anObject.fkOrderRefDateShipment = set.getDate(45);
				anObject.fkOrderRefDatePosting = set.getDate(46);
				anObject.fkOrderRefMolOutCode = set.getString(47);
				anObject.fkOrderRefMolOutName = set.getString(48);
				anObject.fkOrderRefMolInCode = set.getString(49);
				anObject.fkOrderRefMolInName = set.getString(50);
				anObject.fkOrderRefExpeditorCode = set.getString(51);
				anObject.fkOrderRefExpeditorName = set.getString(52);
				anObject.fkOrderRefWarrantNumber = set.getString(53);
				anObject.fkOrderRefWarrantDate = set.getDate(54);
				anObject.fkOrderRefWarrantFIO = set.getString(55);
				anObject.fkOrderRefSumWithoutNds = set.getBigDecimal(56);
				if(anObject.fkOrderRefSumWithoutNds != null) {
					anObject.fkOrderRefSumWithoutNds = anObject.fkOrderRefSumWithoutNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fkOrderRefSumNds = set.getBigDecimal(57);
				if(anObject.fkOrderRefSumNds != null) {
					anObject.fkOrderRefSumNds = anObject.fkOrderRefSumNds.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.fkOrderRefNdsPercent = set.getInt(58);
				if(set.wasNull()) {
					anObject.fkOrderRefNdsPercent = Integer.MIN_VALUE;
				}
				anObject.fkOrderRefDateAdd = set.getTimestamp(59);
				anObject.fkOrderRefUserAdd = set.getString(60);
				anObject.fkOrderRefDateEdit = set.getTimestamp(61);
				anObject.fkOrderRefUserGen = set.getString(62);

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
	
	public int[] getFilteredCodeArray(ENCountersStateVerificationFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENCountersStateVerificationFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENCountersStateVerification aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENCOUNTERSSTATEVERFCTN.CODE FROM ENCOUNTERSSTATEVERFCTN";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCOUNTERSSTATEVERFCTN.CODE";
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

	public ENCountersStateVerification getObject(int uid) throws PersistenceException {
		ENCountersStateVerification result = new ENCountersStateVerification();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENCountersStateVerification anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENCOUNTERSSTATEVERFCTN.CODE, ENCOUNTERSSTATEVERFCTN.INVNUMBER, ENCOUNTERSSTATEVERFCTN.NAME, ENCOUNTERSSTATEVERFCTN.BUILDNUMBER, ENCOUNTERSSTATEVERFCTN.PRICEGEN, ENCOUNTERSSTATEVERFCTN.MODIFY_TIME, ENCOUNTERSSTATEVERFCTN.USERADD, ENCOUNTERSSTATEVERFCTN.DATEADD, ENCOUNTERSSTATEVERFCTN.USERGEN, ENCOUNTERSSTATEVERFCTN.DATEEDIT, ENCOUNTERSSTATEVERFCTN.PLANREFCODE, ENCOUNTERSSTATEVERFCTN.ACTREFCODE, ENCOUNTERSSTATEVERFCTN.FKORDERREFCODE "
			+" FROM ENCOUNTERSSTATEVERFCTN WHERE ENCOUNTERSSTATEVERFCTN.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.buildNumber = set.getString(4);
				anObject.priceGen = set.getBigDecimal(5);
				if(anObject.priceGen != null) {
					anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(6);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(7);
				anObject.dateAdd = set.getTimestamp(8);
				anObject.userGen = set.getString(9);
				anObject.dateEdit = set.getTimestamp(10);
				anObject.planRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.actRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				anObject.fkOrderRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.fkOrderRef.code = Integer.MIN_VALUE;
				}
				if(anObject.planRef.code != Integer.MIN_VALUE) {
					anObject.setPlanRef(
						new com.ksoe.energynet.dataminer.generated.ENPlanWorkDAOGen(connection,getUserProfile()).getRef(anObject.planRef.code));
				}
				if(anObject.actRef.code != Integer.MIN_VALUE) {
					anObject.setActRef(
						new com.ksoe.energynet.dataminer.generated.ENActDAOGen(connection,getUserProfile()).getRef(anObject.actRef.code));
				}
				if(anObject.fkOrderRef.code != Integer.MIN_VALUE) {
					anObject.setFkOrderRef(
						new com.ksoe.rqorder.dataminer.generated.RQFKOrderDAOGen(connection,getUserProfile()).getRef(anObject.fkOrderRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENCountersStateVerificationRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENCountersStateVerificationRef ref = new com.ksoe.energynet.valueobject.references.ENCountersStateVerificationRef();
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

		selectStr = "DELETE FROM  ENCOUNTERSSTATEVERFCTN WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENCountersStateVerification object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENCountersStateVerification.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENCountersStateVerification.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENCountersStateVerification.remove%} access denied");
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
	
	public long count(ENCountersStateVerificationFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENCountersStateVerificationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENCountersStateVerificationFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENCOUNTERSSTATEVERFCTN", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENCountersStateVerificationFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENCOUNTERSSTATEVERFCTN");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENCountersStateVerification.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENCountersStateVerification.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENCOUNTERSSTATEVERFCTN.CODE FROM  ENCOUNTERSSTATEVERFCTN WHERE  ENCOUNTERSSTATEVERFCTN.CODE = ?";
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
		_checkConditionToken(condition,"code","ENCOUNTERSSTATEVERFCTN.CODE");
		_checkConditionToken(condition,"invnumber","ENCOUNTERSSTATEVERFCTN.INVNUMBER");
		_checkConditionToken(condition,"name","ENCOUNTERSSTATEVERFCTN.NAME");
		_checkConditionToken(condition,"buildnumber","ENCOUNTERSSTATEVERFCTN.BUILDNUMBER");
		_checkConditionToken(condition,"pricegen","ENCOUNTERSSTATEVERFCTN.PRICEGEN");
		_checkConditionToken(condition,"modify_time","ENCOUNTERSSTATEVERFCTN.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENCOUNTERSSTATEVERFCTN.USERADD");
		_checkConditionToken(condition,"dateadd","ENCOUNTERSSTATEVERFCTN.DATEADD");
		_checkConditionToken(condition,"usergen","ENCOUNTERSSTATEVERFCTN.USERGEN");
		_checkConditionToken(condition,"dateedit","ENCOUNTERSSTATEVERFCTN.DATEEDIT");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"fkorderref","FKORDERREFCODE");
		_checkConditionToken(condition,"fkorderref.code","FKORDERREFCODE");
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
	
	private void _collectAutoIncrementFields(ENCountersStateVerification anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENCOUNTERSSTATEVERFCTN", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENCOUNTERSSTATEVERFCTN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENCOUNTERSSTATEVERFCTN", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENCOUNTERSSTATEVERFCTN");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENCountersStateVerificationDAO
