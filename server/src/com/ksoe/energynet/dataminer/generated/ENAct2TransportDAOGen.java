
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENAct2Transport;
import com.ksoe.energynet.valueobject.filter.ENAct2TransportFilter;
import com.ksoe.energynet.valueobject.brief.ENAct2TransportShort;
import com.ksoe.energynet.valueobject.lists.ENAct2TransportShortList;


/**
 * DAO Object for ENAct2Transport;
 *
 */

public class ENAct2TransportDAOGen extends GenericDataMiner {

	public ENAct2TransportDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENAct2TransportDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENAct2Transport inObject) throws PersistenceException {
		ENAct2Transport obj = new ENAct2Transport();
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

		if(inObject.expense == null && obj.expense == null){}
		else
			if(inObject.expense == null || obj.expense == null) return false;
			else
				if ( ! inObject.expense.equals(obj.expense)){
					return false;
				}

		if(inObject.depreciationMonth == null && obj.depreciationMonth == null){}
		else
			if(inObject.depreciationMonth == null || obj.depreciationMonth == null) return false;
			else
				if ( ! inObject.depreciationMonth.equals(obj.depreciationMonth)){
					return false;
				}

		if(inObject.depreciationHours == null && obj.depreciationHours == null){}
		else
			if(inObject.depreciationHours == null || obj.depreciationHours == null) return false;
			else
				if ( ! inObject.depreciationHours.equals(obj.depreciationHours)){
					return false;
				}

		if(inObject.timeWork == null && obj.timeWork == null){}
		else
			if(inObject.timeWork == null || obj.timeWork == null) return false;
			else
				if ( ! inObject.timeWork.equals(obj.timeWork)){
					return false;
				}

		if(inObject.paysWork == null && obj.paysWork == null){}
		else
			if(inObject.paysWork == null || obj.paysWork == null) return false;
			else
				if ( ! inObject.paysWork.equals(obj.paysWork)){
					return false;
				}

		if(inObject.repairCostsPerHour == null && obj.repairCostsPerHour == null){}
		else
			if(inObject.repairCostsPerHour == null || obj.repairCostsPerHour == null) return false;
			else
				if ( ! inObject.repairCostsPerHour.equals(obj.repairCostsPerHour)){
					return false;
				}
		if (inObject.actRef.code != obj.actRef.code){
			return false;
		}
		if (inObject.classificationTypeRef.code != obj.classificationTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENAct2Transport anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENAct2Transport anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENACT2TRANSPORT (CODE,INVNUMBER,NAME,EXPENSE,DEPRECIATIONMONTH,DEPRECIATIONHOURS,TIMEWORK,PAYSWORK,REPAIRCOSTSPERHOUR,MODIFY_TIME,ACTREFCODE,CLASSIFICATIONTYPERFCD) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.invNumber);
			statement.setString(3, anObject.name);
			if (anObject.expense != null) {
				anObject.expense = anObject.expense.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(4, anObject.expense);
			if (anObject.depreciationMonth != null) {
				anObject.depreciationMonth = anObject.depreciationMonth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(5, anObject.depreciationMonth);
			if (anObject.depreciationHours != null) {
				anObject.depreciationHours = anObject.depreciationHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(6, anObject.depreciationHours);
			if (anObject.timeWork != null) {
				anObject.timeWork = anObject.timeWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(7, anObject.timeWork);
			if (anObject.paysWork != null) {
				anObject.paysWork = anObject.paysWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(8, anObject.paysWork);
			if (anObject.repairCostsPerHour != null) {
				anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(9, anObject.repairCostsPerHour);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(10, null);
			} else {
				statement.setBigDecimal(10, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.actRef.code != Integer.MIN_VALUE){
				statement.setInt(11,anObject.actRef.code);
			} else {
				statement.setNull(11,java.sql.Types.INTEGER);
			}
			if (anObject.classificationTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(12,anObject.classificationTypeRef.code);
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
			throw new PersistenceException("Error in method {%ENAct2TransportDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENAct2Transport anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENAct2Transport anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENAct2Transport oldObject = new ENAct2Transport();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENAct2Transport.modify_time_Field+" FROM  ENACT2TRANSPORT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("EXPENSE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPRECIATIONMONTH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DEPRECIATIONHOURS") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TIMEWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PAYSWORK") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("REPAIRCOSTSPERHOUR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("MODIFY_TIME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ACTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("CLASSIFICATIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENACT2TRANSPORT SET  INVNUMBER = ? , NAME = ? , EXPENSE = ? , DEPRECIATIONMONTH = ? , DEPRECIATIONHOURS = ? , TIMEWORK = ? , PAYSWORK = ? , REPAIRCOSTSPERHOUR = ? , MODIFY_TIME = ? , ACTREFCODE = ? , CLASSIFICATIONTYPERFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENACT2TRANSPORT SET ";
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
					statement.setString(1, anObject.invNumber);
					statement.setString(2, anObject.name);
					if (anObject.expense != null) {
						anObject.expense = anObject.expense.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(3, anObject.expense);
					if (anObject.depreciationMonth != null) {
						anObject.depreciationMonth = anObject.depreciationMonth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(4, anObject.depreciationMonth);
					if (anObject.depreciationHours != null) {
						anObject.depreciationHours = anObject.depreciationHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(5, anObject.depreciationHours);
					if (anObject.timeWork != null) {
						anObject.timeWork = anObject.timeWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(6, anObject.timeWork);
					if (anObject.paysWork != null) {
						anObject.paysWork = anObject.paysWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(7, anObject.paysWork);
					if (anObject.repairCostsPerHour != null) {
						anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(8, anObject.repairCostsPerHour);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(9, null);
					} else {
						statement.setBigDecimal(9, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.actRef.code != Integer.MIN_VALUE) {
						statement.setInt(10, anObject.actRef.code);
					} else {
						statement.setNull(10, java.sql.Types.INTEGER);
					}
					if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(11, anObject.classificationTypeRef.code);
					} else {
						statement.setNull(11, java.sql.Types.INTEGER);
					}
					statement.setInt(12, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("INVNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.invNumber);
							continue;
						}
						if("NAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.name);
							continue;
						}
						if("EXPENSE".compareTo((String)fields.get(i)) == 0) {
							if (anObject.expense != null) {
								anObject.expense = anObject.expense.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.expense);
							continue;
						}
						if("DEPRECIATIONMONTH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.depreciationMonth != null) {
								anObject.depreciationMonth = anObject.depreciationMonth.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.depreciationMonth);
							continue;
						}
						if("DEPRECIATIONHOURS".compareTo((String)fields.get(i)) == 0) {
							if (anObject.depreciationHours != null) {
								anObject.depreciationHours = anObject.depreciationHours.setScale(3, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.depreciationHours);
							continue;
						}
						if("TIMEWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.timeWork != null) {
								anObject.timeWork = anObject.timeWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.timeWork);
							continue;
						}
						if("PAYSWORK".compareTo((String)fields.get(i)) == 0) {
							if (anObject.paysWork != null) {
								anObject.paysWork = anObject.paysWork.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.paysWork);
							continue;
						}
						if("REPAIRCOSTSPERHOUR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.repairCostsPerHour != null) {
								anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.repairCostsPerHour);
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
						if("ACTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.actRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.actRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("CLASSIFICATIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.classificationTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.classificationTypeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
					}
					statement.setInt(fields.size(), anObject.code);
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

	} // end of save(ENAct2Transport anObject,String[] anAttributes)


	public ENAct2TransportShort getShortObject(int anObjectCode) throws PersistenceException {
		ENAct2Transport filterObject = new ENAct2Transport();
		Vector<ENAct2TransportShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENAct2TransportShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENAct2Transport filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.invNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.name, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.expense, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.depreciationMonth, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.depreciationHours, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.timeWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.paysWork, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.repairCostsPerHour, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.actRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.classificationTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENAct2TransportFilter filter) {
		String out = buildCondition((ENAct2Transport)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENAct2Transport filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENAct2Transport.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.invNumber, ENAct2Transport.invNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.name, ENAct2Transport.name_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.expense, ENAct2Transport.expense_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.depreciationMonth, ENAct2Transport.depreciationMonth_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.depreciationHours, ENAct2Transport.depreciationHours_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.timeWork, ENAct2Transport.timeWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.paysWork, ENAct2Transport.paysWork_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.repairCostsPerHour, ENAct2Transport.repairCostsPerHour_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENAct2Transport.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.actRef.code, ENAct2Transport.actRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.classificationTypeRef.code, ENAct2Transport.classificationTypeRef_QFielld, out);
		}
		return out;
	}

	public ENAct2TransportShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENAct2TransportShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENAct2TransportShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENAct2TransportShortList getFilteredList(ENAct2Transport filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENAct2TransportShortList getScrollableFilteredList(ENAct2Transport aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENAct2TransportShortList getScrollableFilteredList(ENAct2Transport aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENAct2TransportShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENAct2TransportShortList getScrollableFilteredList(ENAct2TransportFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENAct2TransportShortList getScrollableFilteredList(ENAct2TransportFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENAct2TransportShortList getScrollableFilteredList(ENAct2Transport aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENAct2TransportShortList result = new ENAct2TransportShortList();
		ENAct2TransportShort anObject;
		result.list = new Vector<ENAct2TransportShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2TRANSPORT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENACT2TRANSPORT.CODE"+
			",ENACT2TRANSPORT.INVNUMBER"+
			",ENACT2TRANSPORT.NAME"+
			",ENACT2TRANSPORT.EXPENSE"+
			",ENACT2TRANSPORT.DEPRECIATIONMONTH"+
			",ENACT2TRANSPORT.DEPRECIATIONHOURS"+
			",ENACT2TRANSPORT.TIMEWORK"+
			",ENACT2TRANSPORT.PAYSWORK"+
			",ENACT2TRANSPORT.REPAIRCOSTSPERHOUR"+
			", ENACT.CODE " +
			", ENACT.NUMBERGEN " +
			", ENACT.DATEGEN " +
			", ENACT.FINMOLCODE " +
			", ENACT.FINMOLNAME " +
			", ENACT.FINMECHANICNAME " +
			", ENACT.INVNUMBER " +
			", ENACT.USERGEN " +
			", ENACT.DATEEDIT " +
			", ENACT.DATEACT " +
			", ENACT.MOLCODEOBJECT " +
			", ENACT.CHECKEDBYACCOUNTANT " +
			", TKCLASSIFICATIONTYPE.CODE " +
			", TKCLASSIFICATIONTYPE.NAME " +
			", TKCLASSIFICATIONTYPE.KOD " +
		" FROM ENACT2TRANSPORT " +
			" LEFT JOIN ENACT on ENACT.CODE = ENACT2TRANSPORT.ACTREFCODE "+
			" LEFT JOIN TKCLASSIFICATIONTYPE on TKCLASSIFICATIONTYPE.CODE = ENACT2TRANSPORT.CLASSIFICATIONTYPERFCD "+
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
				anObject = new ENAct2TransportShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.invNumber = set.getString(2);
				anObject.name = set.getString(3);
				anObject.expense = set.getBigDecimal(4);
				if(anObject.expense != null) {
					anObject.expense = anObject.expense.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciationMonth = set.getBigDecimal(5);
				if(anObject.depreciationMonth != null) {
					anObject.depreciationMonth = anObject.depreciationMonth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciationHours = set.getBigDecimal(6);
				if(anObject.depreciationHours != null) {
					anObject.depreciationHours = anObject.depreciationHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWork = set.getBigDecimal(7);
				if(anObject.timeWork != null) {
					anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWork = set.getBigDecimal(8);
				if(anObject.paysWork != null) {
					anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.repairCostsPerHour = set.getBigDecimal(9);
				if(anObject.repairCostsPerHour != null) {
					anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.actRefCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.actRefCode = Integer.MIN_VALUE;
				}
				anObject.actRefNumberGen = set.getString(11);
				anObject.actRefDateGen = set.getDate(12);
				anObject.actRefFinMolCode = set.getString(13);
				anObject.actRefFinMolName = set.getString(14);
				anObject.actRefFinMechanicName = set.getString(15);
				anObject.actRefInvNumber = set.getString(16);
				anObject.actRefUserGen = set.getString(17);
				anObject.actRefDateEdit = set.getDate(18);
				anObject.actRefDateAct = set.getDate(19);
				anObject.actRefMolCodeObject = set.getString(20);
				anObject.actRefCheckedByAccountant = set.getBoolean(21);
				if(set.wasNull()) {
					anObject.actRefCheckedByAccountant = null;
				}
				anObject.classificationTypeRefCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.classificationTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRefName = set.getString(23);
				anObject.classificationTypeRefKod = set.getString(24);

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
	
	public int[] getFilteredCodeArray(ENAct2TransportFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENAct2TransportFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENAct2Transport aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENACT2TRANSPORT.CODE FROM ENACT2TRANSPORT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENACT2TRANSPORT.CODE";
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


	public ENAct2Transport getObject(int uid) throws PersistenceException {
		ENAct2Transport result = new ENAct2Transport();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENAct2Transport anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENACT2TRANSPORT.CODE, ENACT2TRANSPORT.INVNUMBER, ENACT2TRANSPORT.NAME, ENACT2TRANSPORT.EXPENSE, ENACT2TRANSPORT.DEPRECIATIONMONTH, ENACT2TRANSPORT.DEPRECIATIONHOURS, ENACT2TRANSPORT.TIMEWORK, ENACT2TRANSPORT.PAYSWORK, ENACT2TRANSPORT.REPAIRCOSTSPERHOUR, ENACT2TRANSPORT.MODIFY_TIME, ENACT2TRANSPORT.ACTREFCODE, ENACT2TRANSPORT.CLASSIFICATIONTYPERFCD "
			+" FROM ENACT2TRANSPORT WHERE ENACT2TRANSPORT.CODE = ?";


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
				anObject.expense = set.getBigDecimal(4);
				if(anObject.expense != null) {
					anObject.expense = anObject.expense.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciationMonth = set.getBigDecimal(5);
				if(anObject.depreciationMonth != null) {
					anObject.depreciationMonth = anObject.depreciationMonth.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.depreciationHours = set.getBigDecimal(6);
				if(anObject.depreciationHours != null) {
					anObject.depreciationHours = anObject.depreciationHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.timeWork = set.getBigDecimal(7);
				if(anObject.timeWork != null) {
					anObject.timeWork = anObject.timeWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.paysWork = set.getBigDecimal(8);
				if(anObject.paysWork != null) {
					anObject.paysWork = anObject.paysWork.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.repairCostsPerHour = set.getBigDecimal(9);
				if(anObject.repairCostsPerHour != null) {
					anObject.repairCostsPerHour = anObject.repairCostsPerHour.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.modify_time = set.getLong(10);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.actRef.code = set.getInt(11);
				if (set.wasNull()) {
					anObject.actRef.code = Integer.MIN_VALUE;
				}
				anObject.classificationTypeRef.code = set.getInt(12);
				if (set.wasNull()) {
					anObject.classificationTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENAct2TransportRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENAct2TransportRef ref = new com.ksoe.energynet.valueobject.references.ENAct2TransportRef();
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

		selectStr = "DELETE FROM  ENACT2TRANSPORT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENAct2Transport object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENAct2Transport.getObject%} access denied");
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
	
	public long count(ENAct2TransportFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENAct2TransportFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENAct2TransportFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENACT2TRANSPORT", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENACT2TRANSPORT WHERE code = ?", propertyName);
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

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENAct2TransportFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENACT2TRANSPORT");
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
			"SELECT  ENACT2TRANSPORT.CODE FROM  ENACT2TRANSPORT WHERE  ENACT2TRANSPORT.CODE = ?";
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
		_checkConditionToken(condition,"code","ENACT2TRANSPORT.CODE");
		_checkConditionToken(condition,"invnumber","ENACT2TRANSPORT.INVNUMBER");
		_checkConditionToken(condition,"name","ENACT2TRANSPORT.NAME");
		_checkConditionToken(condition,"expense","ENACT2TRANSPORT.EXPENSE");
		_checkConditionToken(condition,"depreciationmonth","ENACT2TRANSPORT.DEPRECIATIONMONTH");
		_checkConditionToken(condition,"depreciationhours","ENACT2TRANSPORT.DEPRECIATIONHOURS");
		_checkConditionToken(condition,"timework","ENACT2TRANSPORT.TIMEWORK");
		_checkConditionToken(condition,"payswork","ENACT2TRANSPORT.PAYSWORK");
		_checkConditionToken(condition,"repaircostsperhour","ENACT2TRANSPORT.REPAIRCOSTSPERHOUR");
		_checkConditionToken(condition,"modify_time","ENACT2TRANSPORT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"actref","ACTREFCODE");
		_checkConditionToken(condition,"actref.code","ACTREFCODE");
		_checkConditionToken(condition,"classificationtyperef","CLASSIFICATIONTYPERFCD");
		_checkConditionToken(condition,"classificationtyperef.code","CLASSIFICATIONTYPERFCD");
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
	
	private void _collectAutoIncrementFields(ENAct2Transport anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENACT2TRANSPORT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENACT2TRANSPORT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENACT2TRANSPORT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENACT2TRANSPORT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENAct2TransportDAO
