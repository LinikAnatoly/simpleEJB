
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


import java.util.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.valueobject.ENPlanWork2CCDamageLog;
import com.ksoe.energynet.valueobject.filter.ENPlanWork2CCDamageLogFilter;
import com.ksoe.energynet.valueobject.brief.ENPlanWork2CCDamageLogShort;
import com.ksoe.energynet.valueobject.lists.ENPlanWork2CCDamageLogShortList;


/**
 * DAO Object for ENPlanWork2CCDamageLog;
 *
 */

public class ENPlanWork2CCDamageLogDAOGen extends GenericDataMiner {

	public ENPlanWork2CCDamageLogDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENPlanWork2CCDamageLogDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENPlanWork2CCDamageLog inObject) throws PersistenceException {
		ENPlanWork2CCDamageLog obj = new ENPlanWork2CCDamageLog();
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

		if (inObject.ccDamageLogCode != obj.ccDamageLogCode){
					return false;
				}

		if(inObject.newsPaperName == null && obj.newsPaperName == null){}
		else
			if(inObject.newsPaperName == null || obj.newsPaperName == null) return false;
			else
				if ( ! inObject.newsPaperName.equals(obj.newsPaperName)){
					return false;
				}

		if(inObject.newsPaperNumber == null && obj.newsPaperNumber == null){}
		else
			if(inObject.newsPaperNumber == null || obj.newsPaperNumber == null) return false;
			else
				if ( ! inObject.newsPaperNumber.equals(obj.newsPaperNumber)){
					return false;
				}

		if(inObject.datePubl == null && obj.datePubl == null){} else 
			if(inObject.datePubl == null || obj.datePubl == null) return false;
			else
				if (inObject.datePubl.compareTo(obj.datePubl) != 0){
					return false;
				}

		if(inObject.dateBegin == null && obj.dateBegin == null){} else 
			if(inObject.dateBegin == null || obj.dateBegin == null) return false;
			else
				if (inObject.dateBegin.compareTo(obj.dateBegin) != 0){
					return false;
				}

		if(inObject.dateFinish == null && obj.dateFinish == null){} else 
			if(inObject.dateFinish == null || obj.dateFinish == null) return false;
			else
				if (inObject.dateFinish.compareTo(obj.dateFinish) != 0){
					return false;
				}

		if (inObject.needsApprovalByCustomer != obj.needsApprovalByCustomer){
					return false;
				}
		if (inObject.planRef.code != obj.planRef.code){
			return false;
		}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENPlanWork2CCDamageLog anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENPlanWork2CCDamageLog anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENPLANWORK2CCDAMAGELOG (CODE,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,CCDAMAGELOGCODE,NEWSPAPERNAME,NEWSPAPERNUMBER,DATEPUBL,DATEBEGIN,DATEFINISH,NEEDSAPPROVALBYCUSTOMR,PLANREFCODE,TYPEREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(2, null);
			} else {
				statement.setBigDecimal(2, new java.math.BigDecimal(anObject.modify_time));
			}
			statement.setString(3, anObject.userAdd);
			if (anObject.dateAdd == null) {
				statement.setTimestamp(4, null);
			} else {
				statement.setTimestamp(4, new java.sql.Timestamp(anObject.dateAdd.getTime()));
			}
			statement.setString(5, anObject.userGen);
			if (anObject.dateEdit == null) {
				statement.setTimestamp(6, null);
			} else {
				statement.setTimestamp(6, new java.sql.Timestamp(anObject.dateEdit.getTime()));
			}
			if (anObject.ccDamageLogCode != Integer.MIN_VALUE ) {
				statement.setInt(7, anObject.ccDamageLogCode);
			} else {
				statement.setNull(7, java.sql.Types.INTEGER);
			}
			statement.setString(8, anObject.newsPaperName);
			statement.setString(9, anObject.newsPaperNumber);
			if (anObject.datePubl == null) {
				statement.setDate(10, null);
			} else {
				statement.setDate(10, new java.sql.Date(anObject.datePubl.getTime()));
			}
			if (anObject.dateBegin == null) {
				statement.setDate(11, null);
			} else {
				statement.setDate(11, new java.sql.Date(anObject.dateBegin.getTime()));
			}
			if (anObject.dateFinish == null) {
				statement.setDate(12, null);
			} else {
				statement.setDate(12, new java.sql.Date(anObject.dateFinish.getTime()));
			}
			if (anObject.needsApprovalByCustomer != Integer.MIN_VALUE ) {
				statement.setInt(13, anObject.needsApprovalByCustomer);
			} else {
				statement.setNull(13, java.sql.Types.INTEGER);
			}
			if (anObject.planRef.code != Integer.MIN_VALUE){
				statement.setInt(14,anObject.planRef.code);
			} else {
				statement.setNull(14,java.sql.Types.INTEGER);
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				statement.setInt(15,anObject.typeRef.code);
			} else {
				statement.setNull(15,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENPlanWork2CCDamageLogDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENPlanWork2CCDamageLog anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENPlanWork2CCDamageLog anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENPlanWork2CCDamageLog oldObject = new ENPlanWork2CCDamageLog();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENPlanWork2CCDamageLog.modify_time_Field+" FROM  ENPLANWORK2CCDAMAGELOG WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("CCDAMAGELOGCODE") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NEWSPAPERNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NEWSPAPERNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEPUBL") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEBEGIN") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("DATEFINISH") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("NEEDSAPPROVALBYCUSTOMER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("PLANREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENPLANWORK2CCDAMAGELOG SET  MODIFY_TIME = ? , USERADD = ? , DATEADD = ? , USERGEN = ? , DATEEDIT = ? , CCDAMAGELOGCODE = ? , NEWSPAPERNAME = ? , NEWSPAPERNUMBER = ? , DATEPUBL = ? , DATEBEGIN = ? , DATEFINISH = ? , NEEDSAPPROVALBYCUSTOMR = ? , PLANREFCODE = ? , TYPEREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENPLANWORK2CCDAMAGELOG SET ";
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
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(1, null);
					} else {
						statement.setBigDecimal(1, new java.math.BigDecimal(anObject.modify_time));
					}
					statement.setString(2, anObject.userAdd);
					if (anObject.dateAdd == null) {
						statement.setTimestamp(3, null);
					} else {
						statement.setTimestamp(3, new java.sql.Timestamp(anObject.dateAdd.getTime()));
					}
					statement.setString(4, anObject.userGen);
					if (anObject.dateEdit == null) {
						statement.setTimestamp(5, null);
					} else {
						statement.setTimestamp(5, new java.sql.Timestamp(anObject.dateEdit.getTime()));
					}
					if (anObject.ccDamageLogCode != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.ccDamageLogCode);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setString(7, anObject.newsPaperName);
					statement.setString(8, anObject.newsPaperNumber);
					if (anObject.datePubl == null) {
						statement.setDate(9, null);
					} else {
						statement.setDate(9, new java.sql.Date(anObject.datePubl.getTime()));
					}
					if (anObject.dateBegin == null) {
						statement.setDate(10, null);
					} else {
						statement.setDate(10, new java.sql.Date(anObject.dateBegin.getTime()));
					}
					if (anObject.dateFinish == null) {
						statement.setDate(11, null);
					} else {
						statement.setDate(11, new java.sql.Date(anObject.dateFinish.getTime()));
					}
					if (anObject.needsApprovalByCustomer != Integer.MIN_VALUE) {
						statement.setInt(12, anObject.needsApprovalByCustomer);
					} else {
						statement.setNull(12, java.sql.Types.INTEGER);
					}
					if (anObject.planRef.code != Integer.MIN_VALUE) {
						statement.setInt(13, anObject.planRef.code);
					} else {
						statement.setNull(13, java.sql.Types.INTEGER);
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(14, anObject.typeRef.code);
					} else {
						statement.setNull(14, java.sql.Types.INTEGER);
					}
					statement.setInt(15, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("MODIFY_TIME".compareTo((String)fields.get(i)) == 0) {
							if (anObject.modify_time == Long.MIN_VALUE) {
								statement.setBigDecimal(i+1, null);
							} else {
								statement.setBigDecimal(i+1, new java.math.BigDecimal(anObject.modify_time));
							}
							continue;
						}
						if("USERADD".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userAdd);
							continue;
						}
						if("DATEADD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateAdd == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateAdd.getTime()));
							}
							continue;
						}
						if("USERGEN".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.userGen);
							continue;
						}
						if("DATEEDIT".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateEdit == null) {
								statement.setTimestamp(i+1,null);
							} else {
								statement.setTimestamp(i+1, new java.sql.Timestamp(anObject.dateEdit.getTime()));
							}
							continue;
						}
						if("CCDAMAGELOGCODE".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.ccDamageLogCode);
							continue;
						}
						if("NEWSPAPERNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.newsPaperName);
							continue;
						}
						if("NEWSPAPERNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.newsPaperNumber);
							continue;
						}
						if("DATEPUBL".compareTo((String)fields.get(i)) == 0) {
							if (anObject.datePubl == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.datePubl.getTime()));
							}
							continue;
						}
						if("DATEBEGIN".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateBegin == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateBegin.getTime()));
							}
							continue;
						}
						if("DATEFINISH".compareTo((String)fields.get(i)) == 0) {
							if (anObject.dateFinish == null) {
								statement.setDate(i+1,null);
							} else {
								statement.setDate(i+1, new java.sql.Date(anObject.dateFinish.getTime()));
							}
							continue;
						}
						if("NEEDSAPPROVALBYCUSTOMER".compareTo((String)fields.get(i)) == 0) {
							statement.setInt(i+1, anObject.needsApprovalByCustomer);
							continue;
						}
						if("PLANREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.planRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.planRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.typeRef.code);
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

	} // end of save(ENPlanWork2CCDamageLog anObject,String[] anAttributes)


	public ENPlanWork2CCDamageLogShort getShortObject(int anObjectCode) throws PersistenceException {
		ENPlanWork2CCDamageLog filterObject = new ENPlanWork2CCDamageLog();
		Vector<ENPlanWork2CCDamageLogShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENPlanWork2CCDamageLogShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENPlanWork2CCDamageLog filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userAdd, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateAdd, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.userGen, index, statement);
			index = BaseDAOUtils.setDateTimeParameter(filter.dateEdit, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ccDamageLogCode, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.newsPaperName, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.newsPaperNumber, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.datePubl, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateBegin, index, statement);
			index = BaseDAOUtils.setDateParameter(filter.dateFinish, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.needsApprovalByCustomer, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.planRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENPlanWork2CCDamageLogFilter filter) {
		String out = buildCondition((ENPlanWork2CCDamageLog)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENPlanWork2CCDamageLog filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENPlanWork2CCDamageLog.code_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENPlanWork2CCDamageLog.modify_time_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userAdd, ENPlanWork2CCDamageLog.userAdd_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateAdd, ENPlanWork2CCDamageLog.dateAdd_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.userGen, ENPlanWork2CCDamageLog.userGen_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateEdit, ENPlanWork2CCDamageLog.dateEdit_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ccDamageLogCode, ENPlanWork2CCDamageLog.ccDamageLogCode_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.newsPaperName, ENPlanWork2CCDamageLog.newsPaperName_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.newsPaperNumber, ENPlanWork2CCDamageLog.newsPaperNumber_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.datePubl, ENPlanWork2CCDamageLog.datePubl_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateBegin, ENPlanWork2CCDamageLog.dateBegin_QFielld, out);
			out = BaseDAOUtils.addDateToCondition(filter.dateFinish, ENPlanWork2CCDamageLog.dateFinish_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.needsApprovalByCustomer, ENPlanWork2CCDamageLog.needsApprovalByCustomer_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.planRef.code, ENPlanWork2CCDamageLog.planRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENPlanWork2CCDamageLog.typeRef_QFielld, out);
		}
		return out;
	}

	public ENPlanWork2CCDamageLogShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENPlanWork2CCDamageLogShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENPlanWork2CCDamageLogShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENPlanWork2CCDamageLogShortList getFilteredList(ENPlanWork2CCDamageLog filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(ENPlanWork2CCDamageLog aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(ENPlanWork2CCDamageLog aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(ENPlanWork2CCDamageLogFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(ENPlanWork2CCDamageLogFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENPlanWork2CCDamageLogShortList getScrollableFilteredList(ENPlanWork2CCDamageLog aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENPlanWork2CCDamageLogShortList result = new ENPlanWork2CCDamageLogShortList();
		ENPlanWork2CCDamageLogShort anObject;
		result.list = new Vector<ENPlanWork2CCDamageLogShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORK2CCDAMAGELOG.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANWORK2CCDAMAGELOG.CODE"+
			",ENPLANWORK2CCDAMAGELOG.USERADD"+
			",ENPLANWORK2CCDAMAGELOG.DATEADD"+
			",ENPLANWORK2CCDAMAGELOG.USERGEN"+
			",ENPLANWORK2CCDAMAGELOG.DATEEDIT"+
			",ENPLANWORK2CCDAMAGELOG.CCDAMAGELOGCODE"+
			",ENPLANWORK2CCDAMAGELOG.NEWSPAPERNAME"+
			",ENPLANWORK2CCDAMAGELOG.NEWSPAPERNUMBER"+
			",ENPLANWORK2CCDAMAGELOG.DATEPUBL"+
			",ENPLANWORK2CCDAMAGELOG.DATEBEGIN"+
			",ENPLANWORK2CCDAMAGELOG.DATEFINISH"+
			",ENPLANWORK2CCDAMAGELOG.NEEDSAPPROVALBYCUSTOMR"+
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
			", ENPLAN2CCDAMAGELOGTYPE.CODE " +
			", ENPLAN2CCDAMAGELOGTYPE.NAME " +
		" FROM ENPLANWORK2CCDAMAGELOG " +
			" LEFT JOIN ENPLANWORK on ENPLANWORK.CODE = ENPLANWORK2CCDAMAGELOG.PLANREFCODE "+
			" LEFT JOIN ENPLAN2CCDAMAGELOGTYPE on ENPLAN2CCDAMAGELOGTYPE.CODE = ENPLANWORK2CCDAMAGELOG.TYPEREFCODE "+
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
				anObject = new ENPlanWork2CCDamageLogShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userAdd = set.getString(2);
				anObject.dateAdd = set.getTimestamp(3);
				anObject.userGen = set.getString(4);
				anObject.dateEdit = set.getTimestamp(5);
				anObject.ccDamageLogCode = set.getInt(6);
				if ( set.wasNull() ) {
					anObject.ccDamageLogCode = Integer.MIN_VALUE;
				}
				anObject.newsPaperName = set.getString(7);
				anObject.newsPaperNumber = set.getString(8);
				anObject.datePubl = set.getDate(9);
				anObject.dateBegin = set.getDate(10);
				anObject.dateFinish = set.getDate(11);
				anObject.needsApprovalByCustomer = set.getInt(12);
				if ( set.wasNull() ) {
					anObject.needsApprovalByCustomer = Integer.MIN_VALUE;
				}

				anObject.planRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(14);
				anObject.planRefDateStart = set.getDate(15);
				anObject.planRefDateFinal = set.getDate(16);
				anObject.planRefYearGen = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(18);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(19);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(20);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(21);
				anObject.planRefDateEdit = set.getDate(22);
				anObject.planRefWorkOrderNumber = set.getString(23);
				anObject.planRefDateWorkOrder = set.getDate(24);
				anObject.planRefPriConnectionNumber = set.getString(25);
				anObject.planRefDateEndPriConnection = set.getDate(26);
				anObject.planRefInvestWorksDescription = set.getString(27);
				anObject.planRefServicesFSideFinId = set.getInt(28);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(29);
				anObject.planRefTotalTimeHours = set.getBigDecimal(30);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(31);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(32);
				anObject.typeRefCode = set.getInt(33);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(34);

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
	
	public int[] getFilteredCodeArray(ENPlanWork2CCDamageLogFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENPlanWork2CCDamageLogFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENPlanWork2CCDamageLog aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENPLANWORK2CCDAMAGELOG.CODE FROM ENPLANWORK2CCDAMAGELOG";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANWORK2CCDAMAGELOG.CODE";
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


	public ENPlanWork2CCDamageLog getObject(int uid) throws PersistenceException {
		ENPlanWork2CCDamageLog result = new ENPlanWork2CCDamageLog();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENPlanWork2CCDamageLog anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENPLANWORK2CCDAMAGELOG.CODE, ENPLANWORK2CCDAMAGELOG.MODIFY_TIME, ENPLANWORK2CCDAMAGELOG.USERADD, ENPLANWORK2CCDAMAGELOG.DATEADD, ENPLANWORK2CCDAMAGELOG.USERGEN, ENPLANWORK2CCDAMAGELOG.DATEEDIT, ENPLANWORK2CCDAMAGELOG.CCDAMAGELOGCODE, ENPLANWORK2CCDAMAGELOG.NEWSPAPERNAME, ENPLANWORK2CCDAMAGELOG.NEWSPAPERNUMBER, ENPLANWORK2CCDAMAGELOG.DATEPUBL, ENPLANWORK2CCDAMAGELOG.DATEBEGIN, ENPLANWORK2CCDAMAGELOG.DATEFINISH, ENPLANWORK2CCDAMAGELOG.NEEDSAPPROVALBYCUSTOMR, ENPLANWORK2CCDAMAGELOG.PLANREFCODE, ENPLANWORK2CCDAMAGELOG.TYPEREFCODE "
			+" FROM ENPLANWORK2CCDAMAGELOG WHERE ENPLANWORK2CCDAMAGELOG.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.modify_time = set.getLong(2);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.userAdd = set.getString(3);
				anObject.dateAdd = set.getTimestamp(4);
				anObject.userGen = set.getString(5);
				anObject.dateEdit = set.getTimestamp(6);
				anObject.ccDamageLogCode = set.getInt(7);
				if (set.wasNull()) {
					anObject.ccDamageLogCode = Integer.MIN_VALUE;
				}
				anObject.newsPaperName = set.getString(8);
				anObject.newsPaperNumber = set.getString(9);
				anObject.datePubl = set.getDate(10);
				anObject.dateBegin = set.getDate(11);
				anObject.dateFinish = set.getDate(12);
				anObject.needsApprovalByCustomer = set.getInt(13);
				if (set.wasNull()) {
					anObject.needsApprovalByCustomer = Integer.MIN_VALUE;
				}
				anObject.planRef.code = set.getInt(14);
				if (set.wasNull()) {
					anObject.planRef.code = Integer.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(15);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENPlanWork2CCDamageLogRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENPlanWork2CCDamageLogRef ref = new com.ksoe.energynet.valueobject.references.ENPlanWork2CCDamageLogRef();
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

		selectStr = "DELETE FROM  ENPLANWORK2CCDAMAGELOG WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENPlanWork2CCDamageLog object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENPlanWork2CCDamageLog.getObject%} access denied");
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
	
	public long count(ENPlanWork2CCDamageLogFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENPlanWork2CCDamageLogFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENPlanWork2CCDamageLogFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENPLANWORK2CCDAMAGELOG", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENPLANWORK2CCDAMAGELOG WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENPlanWork2CCDamageLogFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENPLANWORK2CCDAMAGELOG");
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
			"SELECT  ENPLANWORK2CCDAMAGELOG.CODE FROM  ENPLANWORK2CCDAMAGELOG WHERE  ENPLANWORK2CCDAMAGELOG.CODE = ?";
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
		_checkConditionToken(condition,"code","ENPLANWORK2CCDAMAGELOG.CODE");
		_checkConditionToken(condition,"modify_time","ENPLANWORK2CCDAMAGELOG.MODIFY_TIME");
		_checkConditionToken(condition,"useradd","ENPLANWORK2CCDAMAGELOG.USERADD");
		_checkConditionToken(condition,"dateadd","ENPLANWORK2CCDAMAGELOG.DATEADD");
		_checkConditionToken(condition,"usergen","ENPLANWORK2CCDAMAGELOG.USERGEN");
		_checkConditionToken(condition,"dateedit","ENPLANWORK2CCDAMAGELOG.DATEEDIT");
		_checkConditionToken(condition,"ccdamagelogcode","ENPLANWORK2CCDAMAGELOG.CCDAMAGELOGCODE");
		_checkConditionToken(condition,"newspapername","ENPLANWORK2CCDAMAGELOG.NEWSPAPERNAME");
		_checkConditionToken(condition,"newspapernumber","ENPLANWORK2CCDAMAGELOG.NEWSPAPERNUMBER");
		_checkConditionToken(condition,"datepubl","ENPLANWORK2CCDAMAGELOG.DATEPUBL");
		_checkConditionToken(condition,"datebegin","ENPLANWORK2CCDAMAGELOG.DATEBEGIN");
		_checkConditionToken(condition,"datefinish","ENPLANWORK2CCDAMAGELOG.DATEFINISH");
		_checkConditionToken(condition,"needsapprovalbycustomer","ENPLANWORK2CCDAMAGELOG.NEEDSAPPROVALBYCUSTOMR");
		// relationship conditions
		_checkConditionToken(condition,"planref","PLANREFCODE");
		_checkConditionToken(condition,"planref.code","PLANREFCODE");
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
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
	
	private void _collectAutoIncrementFields(ENPlanWork2CCDamageLog anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENPLANWORK2CCDAMAGELOG", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENPLANWORK2CCDAMAGELOG", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENPLANWORK2CCDAMAGELOG", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENPLANWORK2CCDAMAGELOG");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENPlanWork2CCDamageLogDAO
