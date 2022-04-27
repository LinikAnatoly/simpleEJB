
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
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
import com.ksoe.energynet.valueobject.ENSzBrigade;
import com.ksoe.energynet.valueobject.brief.ENSzBrigadeShort;
import com.ksoe.energynet.valueobject.filter.ENSzBrigadeFilter;
import com.ksoe.energynet.valueobject.lists.ENSzBrigadeShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.lla.segregation.SegregationInfo;
import com.ksoe.lla.segregation.SegregationProcessor;


/**
 * DAO Object for ENSzBrigade;
 *
 */

public class ENSzBrigadeDAOGen extends GenericDataMiner {

	public ENSzBrigadeDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSzBrigadeDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSzBrigade inObject) throws PersistenceException {
		ENSzBrigade obj = new ENSzBrigade();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.nazv == null && obj.nazv == null){}
		else
			if(inObject.nazv == null || obj.nazv == null) return false;
			else
				if ( ! inObject.nazv.equals(obj.nazv)){
					return false;
				}

		if(inObject.ceh_nazv == null && obj.ceh_nazv == null){}
		else
			if(inObject.ceh_nazv == null || obj.ceh_nazv == null) return false;
			else
				if ( ! inObject.ceh_nazv.equals(obj.ceh_nazv)){
					return false;
				}

		if(inObject.main_podr_nazv == null && obj.main_podr_nazv == null){}
		else
			if(inObject.main_podr_nazv == null || obj.main_podr_nazv == null) return false;
			else
				if ( ! inObject.main_podr_nazv.equals(obj.main_podr_nazv)){
					return false;
				}

		if (inObject.sizCode != obj.sizCode){
					return false;
				}

		if (inObject.podrId != obj.podrId){
					return false;
				}

		if (inObject.cehId != obj.cehId){
					return false;
				}

		if (inObject.quantity != obj.quantity){
					return false;
				}

		if(inObject.molCode == null && obj.molCode == null){}
		else
			if(inObject.molCode == null || obj.molCode == null) return false;
			else
				if ( ! inObject.molCode.equals(obj.molCode)){
					return false;
				}

		if(inObject.molName == null && obj.molName == null){}
		else
			if(inObject.molName == null || obj.molName == null) return false;
			else
				if ( ! inObject.molName.equals(obj.molName)){
					return false;
				}

		if (inObject.statusCode != obj.statusCode){
					return false;
				}
		if (inObject.element.code != obj.element.code){
			return false;
		}
		if (inObject.departmentRef.code != obj.departmentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENSzBrigade anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSzBrigade anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSZBRIGADE (CODE,NAZV,CEH_NAZV,MAIN_PODR_NAZV,SIZCODE,PODRID,CEHID,QUANTITY,MOLCODE,MOLNAME,STATUSCODE,ELEMENTCODE,DEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1,anObject.code);
			} else {
				statement.setNull(1,java.sql.Types.INTEGER);
			}
			statement.setString(2,anObject.nazv);
			statement.setString(3,anObject.ceh_nazv);
			statement.setString(4,anObject.main_podr_nazv);
			if (anObject.sizCode != Integer.MIN_VALUE ) {
				statement.setInt(5,anObject.sizCode);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.podrId != Integer.MIN_VALUE ) {
				statement.setInt(6,anObject.podrId);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.cehId != Integer.MIN_VALUE ) {
				statement.setInt(7,anObject.cehId);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.quantity != Integer.MIN_VALUE ) {
				statement.setInt(8,anObject.quantity);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			statement.setString(9,anObject.molCode);
			statement.setString(10,anObject.molName);
			if (anObject.statusCode != Integer.MIN_VALUE ) {
				statement.setInt(11,anObject.statusCode);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).exists(anObject.element.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSzBrigade.element.code%} = {%"+anObject.element.code+"%}");
				}
				statement.setInt(12,anObject.element.code);
			} else {
				statement.setNull(12,java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).exists(anObject.departmentRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENSzBrigade.departmentRef.code%} = {%"+anObject.departmentRef.code+"%}");
				}
				statement.setInt(13,anObject.departmentRef.code);
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
			throw new PersistenceException("Error in method {%ENSzBrigadeDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSzBrigade anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSzBrigade anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("NAZV") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CEH_NAZV") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MAIN_PODR_NAZV") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PODRID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CEHID") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("QUANTITY") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MOLNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENT") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENSZBRIGADE SET  NAZV = ? , CEH_NAZV = ? , MAIN_PODR_NAZV = ? , SIZCODE = ? , PODRID = ? , CEHID = ? , QUANTITY = ? , MOLCODE = ? , MOLNAME = ? , STATUSCODE = ? , ELEMENTCODE = ? , DEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSZBRIGADE SET ";
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
					statement.setString(1,anObject.nazv);
					statement.setString(2,anObject.ceh_nazv);
					statement.setString(3,anObject.main_podr_nazv);
					if (anObject.sizCode != Integer.MIN_VALUE) {
						statement.setInt(4,anObject.sizCode);
					} else {
						statement.setNull(4,java.sql.Types.INTEGER);
					}
					if (anObject.podrId != Integer.MIN_VALUE) {
						statement.setInt(5,anObject.podrId);
					} else {
						statement.setNull(5,java.sql.Types.INTEGER);
					}
					if (anObject.cehId != Integer.MIN_VALUE) {
						statement.setInt(6,anObject.cehId);
					} else {
						statement.setNull(6,java.sql.Types.INTEGER);
					}
					if (anObject.quantity != Integer.MIN_VALUE) {
						statement.setInt(7,anObject.quantity);
					} else {
						statement.setNull(7,java.sql.Types.INTEGER);
					}
					statement.setString(8,anObject.molCode);
					statement.setString(9,anObject.molName);
					if (anObject.statusCode != Integer.MIN_VALUE) {
						statement.setInt(10,anObject.statusCode);
					} else {
						statement.setNull(10,java.sql.Types.INTEGER);
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(11,anObject.element.code);
					} else {
						statement.setNull(11,java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(12,anObject.departmentRef.code);
					} else {
						statement.setNull(12,java.sql.Types.INTEGER);
					}
					statement.setInt(13,anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("NAZV".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.nazv);
							continue;
						}
						if("CEH_NAZV".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.ceh_nazv);
							continue;
						}
						if("MAIN_PODR_NAZV".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.main_podr_nazv);
							continue;
						}
						if("SIZCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.sizCode);
							continue;
						}
						if("PODRID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.podrId);
							continue;
						}
						if("CEHID".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.cehId);
							continue;
						}
						if("QUANTITY".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.quantity);
							continue;
						}
						if("MOLCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molCode);
							continue;
						}
						if("MOLNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1,anObject.molName);
							continue;
						}
						if("STATUSCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1,anObject.statusCode);
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
						if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1,anObject.departmentRef.code);
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

	} // end of save(ENSzBrigade anObject,String[] anAttributes)


	public ENSzBrigadeShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSzBrigade filterObject = new ENSzBrigade();
		Vector<ENSzBrigadeShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSzBrigadeShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENSzBrigade filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.nazv, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.ceh_nazv, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.main_podr_nazv, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sizCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.podrId, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.cehId, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.quantity, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.molName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENSzBrigadeFilter filter) {
		String out = buildCondition((ENSzBrigade)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSzBrigade filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSzBrigade.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.nazv, ENSzBrigade.nazv_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.ceh_nazv, ENSzBrigade.ceh_nazv_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.main_podr_nazv, ENSzBrigade.main_podr_nazv_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sizCode, ENSzBrigade.sizCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.podrId, ENSzBrigade.podrId_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.cehId, ENSzBrigade.cehId_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.quantity, ENSzBrigade.quantity_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molCode, ENSzBrigade.molCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.molName, ENSzBrigade.molName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusCode, ENSzBrigade.statusCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENSzBrigade.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENSzBrigade.departmentRef_QFielld, out);
		}
		return out;
	}

	public ENSzBrigadeShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSzBrigadeShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSzBrigadeShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSzBrigadeShortList getFilteredList(ENSzBrigade filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigade aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigade aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigadeFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigadeFilter aFilterObject,int fromPosition,int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENSzBrigadeShortList getScrollableFilteredList(ENSzBrigade aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENSzBrigadeShortList result = new ENSzBrigadeShortList();
		ENSzBrigadeShort anObject;
		result.list = new Vector<ENSzBrigadeShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSZBRIGADE.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSZBRIGADE.CODE"+
			",ENSZBRIGADE.NAZV"+
			",ENSZBRIGADE.CEH_NAZV"+
			",ENSZBRIGADE.MAIN_PODR_NAZV"+
			",ENSZBRIGADE.SIZCODE"+
			",ENSZBRIGADE.PODRID"+
			",ENSZBRIGADE.CEHID"+
			",ENSZBRIGADE.QUANTITY"+
			",ENSZBRIGADE.MOLCODE"+
			",ENSZBRIGADE.MOLNAME"+
			",ENSZBRIGADE.STATUSCODE"+
			", ENELEMENT.CODE " +
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
		" FROM ENSZBRIGADE " +
			", ENELEMENT " +
			", ENDEPARTMENT " +
		"";
		whereStr = " ENELEMENT.CODE = ENSZBRIGADE.ELEMENTCODE" ; //+
		whereStr += " AND ENDEPARTMENT.CODE = ENSZBRIGADE.DEPARTMENTREFCODE" ; //+


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
				anObject = new ENSzBrigadeShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.nazv = set.getString(2);
				anObject.ceh_nazv = set.getString(3);
				anObject.main_podr_nazv = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.sizCode = Integer.MIN_VALUE;
				}
				anObject.podrId = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.podrId = Integer.MIN_VALUE;
				}
				anObject.cehId = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.cehId = Integer.MIN_VALUE;
				}
				anObject.quantity = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.quantity = Integer.MIN_VALUE;
				}
				anObject.molCode = set.getString(9);
				anObject.molName = set.getString(10);
				anObject.statusCode = set.getInt(11);
				if ( set.wasNull() ) {
					anObject.statusCode = Integer.MIN_VALUE;
				}

				anObject.elementCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.departmentRefCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShortName = set.getString(14);
				anObject.departmentRefDateStart = set.getDate(15);
				anObject.departmentRefDateFinal = set.getDate(16);
				anObject.departmentRefRenCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.departmentRefRenCode = Integer.MIN_VALUE;
				}
				anObject.departmentRefShpzBalans = set.getString(18);
				anObject.departmentRefKau_table_id_1884 = set.getInt(19);
				if(set.wasNull()) {
					anObject.departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
				}
				anObject.departmentRefKau_1884 = set.getString(20);
				anObject.departmentRefName_1884 = set.getString(21);
				anObject.departmentRefHrmorganizationid = set.getString(22);

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

	public int[] getFilteredCodeArray(ENSzBrigadeFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}


	public int[] getFilteredCodeArray(ENSzBrigade aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSZBRIGADE.CODE FROM ENSZBRIGADE";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSZBRIGADE.CODE";
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

	public ENSzBrigade getObject(int uid) throws PersistenceException {
		ENSzBrigade result = new ENSzBrigade();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public void loadObject(ENSzBrigade anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;



		selectStr = "SELECT  ENSZBRIGADE.CODE, ENSZBRIGADE.NAZV, ENSZBRIGADE.CEH_NAZV, ENSZBRIGADE.MAIN_PODR_NAZV, ENSZBRIGADE.SIZCODE, ENSZBRIGADE.PODRID, ENSZBRIGADE.CEHID, ENSZBRIGADE.QUANTITY, ENSZBRIGADE.MOLCODE, ENSZBRIGADE.MOLNAME, ENSZBRIGADE.STATUSCODE, ENSZBRIGADE.ELEMENTCODE, ENSZBRIGADE.DEPARTMENTREFCODE "
			+" FROM ENSZBRIGADE WHERE ENSZBRIGADE.CODE = ?";

		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.nazv = set.getString(2);
				anObject.ceh_nazv = set.getString(3);
				anObject.main_podr_nazv = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.sizCode = Integer.MIN_VALUE;
				}
				anObject.podrId = set.getInt(6);
				if (set.wasNull()) {
					anObject.podrId = Integer.MIN_VALUE;
				}
				anObject.cehId = set.getInt(7);
				if (set.wasNull()) {
					anObject.cehId = Integer.MIN_VALUE;
				}
				anObject.quantity = set.getInt(8);
				if (set.wasNull()) {
					anObject.quantity = Integer.MIN_VALUE;
				}
				anObject.molCode = set.getString(9);
				anObject.molName = set.getString(10);
				anObject.statusCode = set.getInt(11);
				if (set.wasNull()) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.element.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
				}
				if(anObject.element.code != Integer.MIN_VALUE) {
					anObject.setElement(
						new com.ksoe.energynet.dataminer.generated.ENElementDAOGen(connection,getUserProfile()).getObject(anObject.element.code));
				}
				if(anObject.departmentRef.code != Integer.MIN_VALUE) {
					anObject.setDepartmentRef(
						new com.ksoe.energynet.dataminer.generated.ENDepartmentDAOGen(connection,getUserProfile()).getRef(anObject.departmentRef.code));
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


	public com.ksoe.energynet.valueobject.references.ENSzBrigadeRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSzBrigadeRef ref = new com.ksoe.energynet.valueobject.references.ENSzBrigadeRef();
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

		selectStr = "DELETE FROM  ENSZBRIGADE WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSzBrigade object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSzBrigade.getObject%} access denied");
		}

		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENSzBrigade.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENSzBrigade.remove%} access denied");
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

	public long count(ENSzBrigadeFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSzBrigadeFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSzBrigadeFilter filter, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSZBRIGADE", aggFunction, column);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSzBrigadeFilter filter, int fromPosition,int quantity, Vector<Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSZBRIGADE");
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

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENSzBrigade.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENSzBrigade.getObject%} access denied");
		}

		selectStr =
			"SELECT  ENSZBRIGADE.CODE FROM  ENSZBRIGADE WHERE  ENSZBRIGADE.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSZBRIGADE.CODE");
		_checkConditionToken(condition,"nazv","ENSZBRIGADE.NAZV");
		_checkConditionToken(condition,"ceh_nazv","ENSZBRIGADE.CEH_NAZV");
		_checkConditionToken(condition,"main_podr_nazv","ENSZBRIGADE.MAIN_PODR_NAZV");
		_checkConditionToken(condition,"sizcode","ENSZBRIGADE.SIZCODE");
		_checkConditionToken(condition,"podrid","ENSZBRIGADE.PODRID");
		_checkConditionToken(condition,"cehid","ENSZBRIGADE.CEHID");
		_checkConditionToken(condition,"quantity","ENSZBRIGADE.QUANTITY");
		_checkConditionToken(condition,"molcode","ENSZBRIGADE.MOLCODE");
		_checkConditionToken(condition,"molname","ENSZBRIGADE.MOLNAME");
		_checkConditionToken(condition,"statuscode","ENSZBRIGADE.STATUSCODE");
		// relationship conditions
		_checkConditionToken(condition,"element","ELEMENTCODE");
		_checkConditionToken(condition,"element.code","ELEMENTCODE");
		_checkConditionToken(condition,"departmentref","DEPARTMENTREFCODE");
		_checkConditionToken(condition,"departmentref.code","DEPARTMENTREFCODE");
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

	private void _collectAutoIncrementFields(ENSzBrigade anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSZBRIGADE", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSZBRIGADE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSZBRIGADE", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSZBRIGADE");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSzBrigadeDAO
