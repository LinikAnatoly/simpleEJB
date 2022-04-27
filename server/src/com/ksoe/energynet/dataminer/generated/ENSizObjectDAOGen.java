
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer.generated;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Hashtable;
import java.util.List;
import java.util.Vector;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.valueobject.ENSizObject;
import com.ksoe.energynet.valueobject.brief.ENSizObjectShort;
import com.ksoe.energynet.valueobject.filter.ENSizObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENSizObjectShortList;
import com.ksoe.lla.persistence.GenericDataMiner;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;


/**
 * DAO Object for ENSizObject;
 *
 */

public class ENSizObjectDAOGen extends GenericDataMiner {

	public ENSizObjectDAOGen() {
		super();
	}

	public ENSizObjectDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENSizObjectDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENSizObject inObject) throws PersistenceException {
		ENSizObject obj = new ENSizObject();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.tabNumber == null && obj.tabNumber == null){}
		else
			if(inObject.tabNumber == null || obj.tabNumber == null) return false;
			else
				if ( ! inObject.tabNumber.equals(obj.tabNumber)){
					return false;
				}

		if(inObject.profesion == null && obj.profesion == null){}
		else
			if(inObject.profesion == null || obj.profesion == null) return false;
			else
				if ( ! inObject.profesion.equals(obj.profesion)){
					return false;
				}

		if(inObject.fio == null && obj.fio == null){}
		else
			if(inObject.fio == null || obj.fio == null) return false;
			else
				if ( ! inObject.fio.equals(obj.fio)){
					return false;
				}

		if (inObject.sizCode != obj.sizCode){
					return false;
				}

		if (inObject.statusCode != obj.statusCode){
					return false;
				}

		if (inObject.gender != obj.gender){
					return false;
				}

		if(inObject.growth == null && obj.growth == null){}
		else
			if(inObject.growth == null || obj.growth == null) return false;
			else
				if ( ! inObject.growth.equals(obj.growth)){
					return false;
				}

		if(inObject.sizeClothing == null && obj.sizeClothing == null){}
		else
			if(inObject.sizeClothing == null || obj.sizeClothing == null) return false;
			else
				if ( ! inObject.sizeClothing.equals(obj.sizeClothing)){
					return false;
				}

		if(inObject.sizeShoes == null && obj.sizeShoes == null){}
		else
			if(inObject.sizeShoes == null || obj.sizeShoes == null) return false;
			else
				if ( ! inObject.sizeShoes.equals(obj.sizeShoes)){
					return false;
				}

		if(inObject.sizeHead == null && obj.sizeHead == null){}
		else
			if(inObject.sizeHead == null || obj.sizeHead == null) return false;
			else
				if ( ! inObject.sizeHead.equals(obj.sizeHead)){
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

	public int add(ENSizObject anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENSizObject anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENSIZOBJECT (CODE,TABNUMBER,PROFESION,FIO,SIZCODE,STATUSCODE,GENDER,GROWTH,SIZECLOTHING,SIZESHOES,SIZEHEAD,MODIFY_TIME,ELEMENTCODE,DEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.tabNumber);
			statement.setString(3, anObject.profesion);
			statement.setString(4, anObject.fio);
			if (anObject.sizCode != Integer.MIN_VALUE ) {
				statement.setInt(5, anObject.sizCode);
			} else {
				statement.setNull(5, java.sql.Types.INTEGER);
			}
			if (anObject.statusCode != Integer.MIN_VALUE ) {
				statement.setInt(6, anObject.statusCode);
			} else {
				statement.setNull(6, java.sql.Types.INTEGER);
			}
			if (anObject.gender != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.gender);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			if (anObject.growth != null) {
				anObject.growth = anObject.growth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.growth);
			if (anObject.sizeClothing != null) {
				anObject.sizeClothing = anObject.sizeClothing.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.sizeClothing);
			if (anObject.sizeShoes != null) {
				anObject.sizeShoes = anObject.sizeShoes.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(10, anObject.sizeShoes);
			if (anObject.sizeHead != null) {
				anObject.sizeHead = anObject.sizeHead.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(11, anObject.sizeHead);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(12, null);
			} else {
				statement.setBigDecimal(12, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.element.code != Integer.MIN_VALUE){
				statement.setInt(13,anObject.element.code);
			} else {
				statement.setNull(13,java.sql.Types.INTEGER);
			}
			if (anObject.departmentRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.departmentRef.code);
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
			throw new PersistenceException("Error in method {%ENSizObjectDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENSizObject anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENSizObject anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENSizObject oldObject = new ENSizObject();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENSizObject.modify_time_Field+" FROM  ENSIZOBJECT WHERE CODE = ?";
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
				fields = new Vector<>();
				for(int attrIndex = 0;attrIndex < anAttributes.length;attrIndex++) {
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PROFESION") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("STATUSCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GENDER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GROWTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZECLOTHING") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZESHOES") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SIZEHEAD") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
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
				selectStr = "UPDATE ENSIZOBJECT SET  TABNUMBER = ? , PROFESION = ? , FIO = ? , SIZCODE = ? , STATUSCODE = ? , GENDER = ? , GROWTH = ? , SIZECLOTHING = ? , SIZESHOES = ? , SIZEHEAD = ? , MODIFY_TIME = ? , ELEMENTCODE = ? , DEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENSIZOBJECT SET ";
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
					statement.setString(1, anObject.tabNumber);
					statement.setString(2, anObject.profesion);
					statement.setString(3, anObject.fio);
					if (anObject.sizCode != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.sizCode);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.statusCode != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.statusCode);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.gender != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.gender);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.growth != null) {
						anObject.growth = anObject.growth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.growth);
					if (anObject.sizeClothing != null) {
						anObject.sizeClothing = anObject.sizeClothing.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.sizeClothing);
					if (anObject.sizeShoes != null) {
						anObject.sizeShoes = anObject.sizeShoes.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(9, anObject.sizeShoes);
					if (anObject.sizeHead != null) {
						anObject.sizeHead = anObject.sizeHead.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(10, anObject.sizeHead);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(11, null);
					} else {
						statement.setBigDecimal(11, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.element.code != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.element.code);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.departmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.departmentRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					statement.setInt(14, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tabNumber);
							continue;
						}
						if("PROFESION".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.profesion);
							continue;
						}
						if("FIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.fio);
							continue;
						}
						if("SIZCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.sizCode);
							continue;
						}
						if("STATUSCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.statusCode);
							continue;
						}
						if("GENDER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.gender);
							continue;
						}
						if("GROWTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.growth != null) {
								anObject.growth = anObject.growth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.growth);
							continue;
						}
						if("SIZECLOTHING".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sizeClothing != null) {
								anObject.sizeClothing = anObject.sizeClothing.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sizeClothing);
							continue;
						}
						if("SIZESHOES".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sizeShoes != null) {
								anObject.sizeShoes = anObject.sizeShoes.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sizeShoes);
							continue;
						}
						if("SIZEHEAD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.sizeHead != null) {
								anObject.sizeHead = anObject.sizeHead.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.sizeHead);
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
						if("ELEMENT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.element.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.element.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("DEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.departmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.departmentRef.code);
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

	} // end of save(ENSizObject anObject,String[] anAttributes)


	public ENSizObjectShort getShortObject(int anObjectCode) throws PersistenceException {
		ENSizObject filterObject = new ENSizObject();
		Vector<ENSizObjectShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENSizObjectShort)list.get(0);
		}
		return null;
	}

	public int setParameters(ENSizObject filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tabNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.profesion, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.fio, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.sizCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.statusCode, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.gender, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.growth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sizeClothing, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sizeShoes, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.sizeHead, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.element.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.departmentRef.code, index, statement);
			index--;
		}
		return index;
	}

	public String buildCondition(ENSizObjectFilter filter) {
		String out = buildCondition((ENSizObject)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENSizObject filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENSizObject.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tabNumber, ENSizObject.tabNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.profesion, ENSizObject.profesion_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.fio, ENSizObject.fio_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.sizCode, ENSizObject.sizCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.statusCode, ENSizObject.statusCode_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.gender, ENSizObject.gender_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.growth, ENSizObject.growth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sizeClothing, ENSizObject.sizeClothing_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sizeShoes, ENSizObject.sizeShoes_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.sizeHead, ENSizObject.sizeHead_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENSizObject.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.element.code, ENSizObject.element_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.departmentRef.code, ENSizObject.departmentRef_QFielld, out);
		}
		return out;
	}

	public ENSizObjectShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENSizObjectShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENSizObjectShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENSizObjectShortList getFilteredList(ENSizObject filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENSizObjectShortList getScrollableFilteredList(ENSizObject aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENSizObjectShortList getScrollableFilteredList(ENSizObject aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENSizObjectShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENSizObjectShortList getScrollableFilteredList(ENSizObjectFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}

	public ENSizObjectShortList getScrollableFilteredList(ENSizObjectFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}

	public ENSizObjectShortList getScrollableFilteredList(ENSizObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENSizObjectShortList result = new ENSizObjectShortList();
		ENSizObjectShort anObject;
		result.list = new Vector<ENSizObjectShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSIZOBJECT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSIZOBJECT.CODE"+
			",ENSIZOBJECT.TABNUMBER"+
			",ENSIZOBJECT.PROFESION"+
			",ENSIZOBJECT.FIO"+
			",ENSIZOBJECT.SIZCODE"+
			",ENSIZOBJECT.STATUSCODE"+
			",ENSIZOBJECT.GENDER"+
			",ENSIZOBJECT.GROWTH"+
			",ENSIZOBJECT.SIZECLOTHING"+
			",ENSIZOBJECT.SIZESHOES"+
			",ENSIZOBJECT.SIZEHEAD"+
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
		" FROM ENSIZOBJECT " +
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENSIZOBJECT.ELEMENTCODE "+
			" LEFT JOIN ENDEPARTMENT on ENDEPARTMENT.CODE = ENSIZOBJECT.DEPARTMENTREFCODE "+
		"";


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
				anObject = new ENSizObjectShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.tabNumber = set.getString(2);
				anObject.profesion = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if ( set.wasNull() ) {
					anObject.sizCode = Integer.MIN_VALUE;
				}
				anObject.statusCode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.gender = set.getInt(7);
				if ( set.wasNull() ) {
					anObject.gender = Integer.MIN_VALUE;
				}
				anObject.growth = set.getBigDecimal(8);
				if(anObject.growth != null) {
					anObject.growth = anObject.growth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeClothing = set.getBigDecimal(9);
				if(anObject.sizeClothing != null) {
					anObject.sizeClothing = anObject.sizeClothing.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeShoes = set.getBigDecimal(10);
				if(anObject.sizeShoes != null) {
					anObject.sizeShoes = anObject.sizeShoes.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeHead = set.getBigDecimal(11);
				if(anObject.sizeHead != null) {
					anObject.sizeHead = anObject.sizeHead.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
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

	public int[] getFilteredCodeArray(ENSizObjectFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENSizObjectFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENSizObject aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENSIZOBJECT.CODE FROM ENSIZOBJECT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSIZOBJECT.CODE";
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


	public ENSizObject getObject(int uid) throws PersistenceException {
		ENSizObject result = new ENSizObject();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENSizObject anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENSIZOBJECT.CODE, ENSIZOBJECT.TABNUMBER, ENSIZOBJECT.PROFESION, ENSIZOBJECT.FIO, ENSIZOBJECT.SIZCODE, ENSIZOBJECT.STATUSCODE, ENSIZOBJECT.GENDER, ENSIZOBJECT.GROWTH, ENSIZOBJECT.SIZECLOTHING, ENSIZOBJECT.SIZESHOES, ENSIZOBJECT.SIZEHEAD, ENSIZOBJECT.MODIFY_TIME, ENSIZOBJECT.ELEMENTCODE, ENSIZOBJECT.DEPARTMENTREFCODE "
			+" FROM ENSIZOBJECT WHERE ENSIZOBJECT.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);

				anObject.tabNumber = set.getString(2);
				anObject.profesion = set.getString(3);
				anObject.fio = set.getString(4);
				anObject.sizCode = set.getInt(5);
				if (set.wasNull()) {
					anObject.sizCode = Integer.MIN_VALUE;
				}
				anObject.statusCode = set.getInt(6);
				if (set.wasNull()) {
					anObject.statusCode = Integer.MIN_VALUE;
				}
				anObject.gender = set.getInt(7);
				if (set.wasNull()) {
					anObject.gender = Integer.MIN_VALUE;
				}
				anObject.growth = set.getBigDecimal(8);
				if(anObject.growth != null) {
					anObject.growth = anObject.growth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeClothing = set.getBigDecimal(9);
				if(anObject.sizeClothing != null) {
					anObject.sizeClothing = anObject.sizeClothing.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeShoes = set.getBigDecimal(10);
				if(anObject.sizeShoes != null) {
					anObject.sizeShoes = anObject.sizeShoes.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sizeHead = set.getBigDecimal(11);
				if(anObject.sizeHead != null) {
					anObject.sizeHead = anObject.sizeHead.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(12);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.element.code = set.getInt(13);
				if (set.wasNull()) {
					anObject.element.code = Integer.MIN_VALUE;
				}
				anObject.departmentRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.departmentRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENSizObjectRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENSizObjectRef ref = new com.ksoe.energynet.valueobject.references.ENSizObjectRef();
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

		selectStr = "DELETE FROM  ENSIZOBJECT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENSizObject object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENSizObject.getObject%} access denied");
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

	public long count(ENSizObjectFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENSizObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}

	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENSizObjectFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENSIZOBJECT", aggFunction, column);
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
	public <E> E getProperty(String propertyName, int code, E defaultValue) {
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet set = null;
		String sql = String.format("SELECT %s FROM ENSIZOBJECT WHERE code = ?", propertyName);
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

	public <E> List<E> getListOfPropertyValues(String propertyName, ENSizObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENSizObjectFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENSIZOBJECT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;

		ArrayList<E> out = new ArrayList<>();

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
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

		selectStr =
			"SELECT  ENSIZOBJECT.CODE FROM  ENSIZOBJECT WHERE  ENSIZOBJECT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENSIZOBJECT.CODE");
		_checkConditionToken(condition,"tabnumber","ENSIZOBJECT.TABNUMBER");
		_checkConditionToken(condition,"profesion","ENSIZOBJECT.PROFESION");
		_checkConditionToken(condition,"fio","ENSIZOBJECT.FIO");
		_checkConditionToken(condition,"sizcode","ENSIZOBJECT.SIZCODE");
		_checkConditionToken(condition,"statuscode","ENSIZOBJECT.STATUSCODE");
		_checkConditionToken(condition,"gender","ENSIZOBJECT.GENDER");
		_checkConditionToken(condition,"growth","ENSIZOBJECT.GROWTH");
		_checkConditionToken(condition,"sizeclothing","ENSIZOBJECT.SIZECLOTHING");
		_checkConditionToken(condition,"sizeshoes","ENSIZOBJECT.SIZESHOES");
		_checkConditionToken(condition,"sizehead","ENSIZOBJECT.SIZEHEAD");
		_checkConditionToken(condition,"modify_time","ENSIZOBJECT.MODIFY_TIME");
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
	protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<>();

	private void _collectAutoIncrementFields(ENSizObject anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENSIZOBJECT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENSIZOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENSIZOBJECT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENSIZOBJECT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENSizObjectDAO
