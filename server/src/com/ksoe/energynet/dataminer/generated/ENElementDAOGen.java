
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
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
import com.ksoe.energynet.valueobject.ENElement;
import com.ksoe.energynet.valueobject.filter.ENElementFilter;
import com.ksoe.energynet.valueobject.brief.ENElementShort;
import com.ksoe.energynet.valueobject.lists.ENElementShortList;


/**
 * DAO Object for ENElement;
 *
 */

public class ENElementDAOGen extends GenericDataMiner {

	public ENElementDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENElementDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENElement inObject) throws PersistenceException {
		ENElement obj = new ENElement();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.orderField == null && obj.orderField == null){}
		else
			if(inObject.orderField == null || obj.orderField == null) return false;
			else
				if ( ! inObject.orderField.equals(obj.orderField)){
					return false;
				}
		if (inObject.typeRef.code != obj.typeRef.code){
			return false;
		}
		if (inObject.elementInRef.code != obj.elementInRef.code){
			return false;
		}
		if (inObject.elementOutRef.code != obj.elementOutRef.code){
			return false;
		}
		if (inObject.renRef.code != obj.renRef.code){
			return false;
		}
		if (inObject.finExecutor.code != obj.finExecutor.code){
			return false;
		}
		if (inObject.geoDepartmentRef.code != obj.geoDepartmentRef.code){
			return false;
		}
		return true;
	}

	public int add(ENElement anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENElement anObject, boolean aUseSequential) throws PersistenceException {
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


		selectStr = "INSERT INTO ENELEMENT (CODE,ORDERFIELD,DOMAIN_INFO,MODIFY_TIME,TYPEREFCODE,ELEMENTINREFCODE,ELEMENTOUTREFCODE,RENREFCODE,FINEXECUTORCODE,GEODEPARTMENTREFCODE) VALUES (?,?,?,?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			if (anObject.orderField != null) {
				anObject.orderField = anObject.orderField.setScale(5, java.math.BigDecimal.ROUND_HALF_UP);
			}
			statement.setBigDecimal(2, anObject.orderField);
			statement.setString(3, anObject.domain_info);
			if (anObject.modify_time == Long.MIN_VALUE) {
				statement.setBigDecimal(4, null);
			} else {
				statement.setBigDecimal(4, new java.math.BigDecimal(anObject.modify_time));
			}
			if (anObject.typeRef.code != Integer.MIN_VALUE){
				statement.setInt(5,anObject.typeRef.code);
			} else {
				statement.setNull(5,java.sql.Types.INTEGER);
			}
			if (anObject.elementInRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.elementInRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.elementOutRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.elementOutRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.renRef.code != Integer.MIN_VALUE){
				statement.setInt(8,anObject.renRef.code);
			} else {
				statement.setNull(8,java.sql.Types.INTEGER);
			}
			if (anObject.finExecutor.code != Integer.MIN_VALUE){
				statement.setInt(9,anObject.finExecutor.code);
			} else {
				statement.setNull(9,java.sql.Types.INTEGER);
			}
			if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE){
				statement.setInt(10,anObject.geoDepartmentRef.code);
			} else {
				statement.setNull(10,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENElementDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENElement anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENElement anObject,String[] anAttributes) throws PersistenceException {
		if(anAttributes != null && anAttributes.length == 0) {
			return;
		}
		Connection connection = getConnection();
		try {
			PreparedStatement statement = null;

			ENElement oldObject = new ENElement();
			oldObject.code = anObject.code;
			String oldObjectSelectStr = "SELECT "+ENElement.modify_time_Field + "," + ENElement.domain_info_Field+" FROM  ENELEMENT WHERE CODE = ?";
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
					if(fieldNameStr.compareTo("ORDERFIELD") == 0) {
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
					if(fieldNameStr.compareTo("TYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTINREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ELEMENTOUTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("RENREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FINEXECUTOR") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("GEODEPARTMENTREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENELEMENT SET  ORDERFIELD = ? , DOMAIN_INFO = ? , MODIFY_TIME = ? , TYPEREFCODE = ? , ELEMENTINREFCODE = ? , ELEMENTOUTREFCODE = ? , RENREFCODE = ? , FINEXECUTORCODE = ? , GEODEPARTMENTREFCODE = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENELEMENT SET ";
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
					if (anObject.orderField != null) {
						anObject.orderField = anObject.orderField.setScale(5, java.math.BigDecimal.ROUND_HALF_UP);
					}
					statement.setBigDecimal(1, anObject.orderField);
					statement.setString(2, anObject.domain_info);
					if (anObject.modify_time == Long.MIN_VALUE) {
						statement.setBigDecimal(3, null);
					} else {
						statement.setBigDecimal(3, new java.math.BigDecimal(anObject.modify_time));
					}
					if (anObject.typeRef.code != Integer.MIN_VALUE) {
						statement.setInt(4, anObject.typeRef.code);
					} else {
						statement.setNull(4, java.sql.Types.INTEGER);
					}
					if (anObject.elementInRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.elementInRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.elementOutRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.elementOutRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					if (anObject.renRef.code != Integer.MIN_VALUE) {
						statement.setInt(7, anObject.renRef.code);
					} else {
						statement.setNull(7, java.sql.Types.INTEGER);
					}
					if (anObject.finExecutor.code != Integer.MIN_VALUE) {
						statement.setInt(8, anObject.finExecutor.code);
					} else {
						statement.setNull(8, java.sql.Types.INTEGER);
					}
					if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE) {
						statement.setInt(9, anObject.geoDepartmentRef.code);
					} else {
						statement.setNull(9, java.sql.Types.INTEGER);
					}
					statement.setInt(10, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("ORDERFIELD".compareTo((String)fields.get(i)) == 0) {
							if (anObject.orderField != null) {
								anObject.orderField = anObject.orderField.setScale(5, java.math.BigDecimal.ROUND_HALF_UP);
							}
							statement.setBigDecimal(i+1, anObject.orderField);
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
						if("TYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.typeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.typeRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTINREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementInRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementInRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ELEMENTOUTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.elementOutRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.elementOutRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("RENREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.renRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.renRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("FINEXECUTOR".compareTo((String)fields.get(i)) == 0) {
							if (anObject.finExecutor.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.finExecutor.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("GEODEPARTMENTREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.geoDepartmentRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.geoDepartmentRef.code);
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

	} // end of save(ENElement anObject,String[] anAttributes)


	public ENElementShort getShortObject(int anObjectCode) throws PersistenceException {
		ENElement filterObject = new ENElement();
		Vector<ENElementShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENElementShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENElement filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setDecimalParameter(filter.orderField, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.domain_info, index, statement);
			index = BaseDAOUtils.setLongParameter(filter.modify_time, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.typeRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementInRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.elementOutRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.renRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.finExecutor.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.geoDepartmentRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENElementFilter filter) {
		String out = buildCondition((ENElement)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENElement filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENElement.code_QFielld, out);
			out = BaseDAOUtils.addDecimalToCondition(filter.orderField, ENElement.orderField_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.domain_info, ENElement.domain_info_QFielld, out);
			out = BaseDAOUtils.addLongToCondition(filter.modify_time, ENElement.modify_time_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.typeRef.code, ENElement.typeRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementInRef.code, ENElement.elementInRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.elementOutRef.code, ENElement.elementOutRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.renRef.code, ENElement.renRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.finExecutor.code, ENElement.finExecutor_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.geoDepartmentRef.code, ENElement.geoDepartmentRef_QFielld, out);
		}
		return out;
	}

	public ENElementShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENElementShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENElementShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENElementShortList getFilteredList(ENElement filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENElementShortList getScrollableFilteredList(ENElement aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENElementShortList getScrollableFilteredList(ENElement aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENElementShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENElementShortList getScrollableFilteredList(ENElementFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENElementShortList getScrollableFilteredList(ENElementFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENElementShortList getScrollableFilteredList(ENElement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENElementShortList result = new ENElementShortList();
		ENElementShort anObject;
		result.list = new Vector<ENElementShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENELEMENT.CODE"+
			", ENELEMENTTYPE.CODE " +
			", ENELEMENTTYPE.NAME " +
			", ENELEMENT.CODE " +
			", ENELEMENT.CODE " +
			", EPREN.CODE " +
			", EPREN.NAME " +
			", FINEXECUTOR.CODE " +
			", FINEXECUTOR.NAME " +
			", FINEXECUTOR.FINCODE " +
			", FINEXECUTOR.FINTYPENAME " +
			", FINEXECUTOR.FINTYPECODE " +
			", FINEXECUTOR.FINKINDNAME " +
			", FINEXECUTOR.FINKINDCODE " +
			", FINEXECUTOR.FINCEHNAME " +
			", FINEXECUTOR.FINCEHCODE " +
			", FINEXECUTOR.AXORGID " +
			", FINEXECUTOR.AXPARENTORGID " +
			", FINEXECUTOR.AXPARENTORGNAME " +
			", FINEXECUTOR.AXORGTYPEID " +
			", FINEXECUTOR.AXORGTYPENAME " +
			", ENGEOGRAPHICDEPARTMENT.CODE " +
			", ENGEOGRAPHICDEPARTMENT.NAME " +
			", ENGEOGRAPHICDEPARTMENT.COMMENTGEN " +
			", ENGEOGRAPHICDEPARTMENT.USERADD " +
			", ENGEOGRAPHICDEPARTMENT.DATEADD " +
			", ENGEOGRAPHICDEPARTMENT.USERGEN " +
			", ENGEOGRAPHICDEPARTMENT.DATEEDIT " +
		" FROM ENELEMENT " +
			" LEFT JOIN ENELEMENTTYPE on ENELEMENTTYPE.CODE = ENELEMENT.TYPEREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENELEMENT.ELEMENTINREFCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENELEMENT.ELEMENTOUTREFCODE "+
			" LEFT JOIN EPREN on EPREN.CODE = ENELEMENT.RENREFCODE "+
			" LEFT JOIN FINEXECUTOR on FINEXECUTOR.CODE = ENELEMENT.FINEXECUTORCODE "+
			" LEFT JOIN ENGEOGRAPHICDEPARTMENT on ENGEOGRAPHICDEPARTMENT.CODE = ENELEMENT.GEODEPARTMENTREFCODE "+
		"";

	
		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);

		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENElement.getList%} access denied");
		}
		String domainWhereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());
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
				anObject = new ENElementShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}

				anObject.typeRefCode = set.getInt(2);
				if(set.wasNull()) {
					anObject.typeRefCode = Integer.MIN_VALUE;
				}
				anObject.typeRefName = set.getString(3);
				anObject.elementInRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.elementInRefCode = Integer.MIN_VALUE;
				}
				anObject.elementOutRefCode = set.getInt(5);
				if(set.wasNull()) {
					anObject.elementOutRefCode = Integer.MIN_VALUE;
				}
				anObject.renRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.renRefCode = Integer.MIN_VALUE;
				}
				anObject.renRefName = set.getString(7);
				anObject.finExecutorCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.finExecutorCode = Integer.MIN_VALUE;
				}
				anObject.finExecutorName = set.getString(9);
				anObject.finExecutorFinCode = set.getInt(10);
				if(set.wasNull()) {
					anObject.finExecutorFinCode = Integer.MIN_VALUE;
				}
				anObject.finExecutorFinTypeName = set.getString(11);
				anObject.finExecutorFinTypeCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.finExecutorFinTypeCode = Integer.MIN_VALUE;
				}
				anObject.finExecutorFinKindName = set.getString(13);
				anObject.finExecutorFinKindCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.finExecutorFinKindCode = Integer.MIN_VALUE;
				}
				anObject.finExecutorFinCehName = set.getString(15);
				anObject.finExecutorFinCehCode = set.getInt(16);
				if(set.wasNull()) {
					anObject.finExecutorFinCehCode = Integer.MIN_VALUE;
				}
				anObject.finExecutorAxOrgId = set.getString(17);
				anObject.finExecutorAxParentOrgId = set.getString(18);
				anObject.finExecutorAxParentOrgName = set.getString(19);
				anObject.finExecutorAxOrgTypeId = set.getInt(20);
				if(set.wasNull()) {
					anObject.finExecutorAxOrgTypeId = Integer.MIN_VALUE;
				}
				anObject.finExecutorAxOrgTypeName = set.getString(21);
				anObject.geoDepartmentRefCode = set.getInt(22);
				if(set.wasNull()) {
					anObject.geoDepartmentRefCode = Integer.MIN_VALUE;
				}
				anObject.geoDepartmentRefName = set.getString(23);
				anObject.geoDepartmentRefCommentgen = set.getString(24);
				anObject.geoDepartmentRefUserAdd = set.getString(25);
				anObject.geoDepartmentRefDateAdd = set.getTimestamp(26);
				anObject.geoDepartmentRefUserGen = set.getString(27);
				anObject.geoDepartmentRefDateEdit = set.getTimestamp(28);

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
	
	public int[] getFilteredCodeArray(ENElementFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENElementFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENElement aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENELEMENT.CODE FROM ENELEMENT";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENELEMENT.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENElement.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENELEMENT.DOMAIN_INFO IS NOT NULL) ";
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


	public ENElement getObject(int uid) throws PersistenceException {
		ENElement result = new ENElement();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

    public void loadObject(ENElement anObject) throws PersistenceException {
        loadObject(anObject, false);
    }


    public void loadObject(ENElement anObject, boolean noSegregation) throws PersistenceException {
        loadObject(anObject, noSegregation, false);
    }

	public void loadObject(ENElement anObject, boolean noSegregation, boolean noReferences) throws PersistenceException {
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
            segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
            if (segregationInfo.isAccessDenied()) {
                throw new PersistenceException("{%ENElement.getObject%} access denied");
            }
        }

		selectStr = "SELECT  ENELEMENT.CODE, ENELEMENT.ORDERFIELD, ENELEMENT.DOMAIN_INFO, ENELEMENT.MODIFY_TIME, ENELEMENT.TYPEREFCODE, ENELEMENT.ELEMENTINREFCODE, ENELEMENT.ELEMENTOUTREFCODE, ENELEMENT.RENREFCODE, ENELEMENT.FINEXECUTORCODE, ENELEMENT.GEODEPARTMENTREFCODE "
			+" FROM ENELEMENT WHERE ENELEMENT.CODE = ?";

        if (!noSegregation) {
            segregationWhereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());
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
			
				anObject.orderField = set.getBigDecimal(2);
				if(anObject.orderField != null) {
					anObject.orderField = anObject.orderField.setScale(5,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.domain_info = set.getString(3);
				anObject.modify_time = set.getLong(4);
				if(set.wasNull()) {
					anObject.modify_time = Long.MIN_VALUE;
				}
				anObject.typeRef.code = set.getInt(5);
				if (set.wasNull()) {
					anObject.typeRef.code = Integer.MIN_VALUE;
				}
				anObject.elementInRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.elementInRef.code = Integer.MIN_VALUE;
				}
				anObject.elementOutRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.elementOutRef.code = Integer.MIN_VALUE;
				}
				anObject.renRef.code = set.getInt(8);
				if (set.wasNull()) {
					anObject.renRef.code = Integer.MIN_VALUE;
				}
				anObject.finExecutor.code = set.getInt(9);
				if (set.wasNull()) {
					anObject.finExecutor.code = Integer.MIN_VALUE;
				}
				anObject.geoDepartmentRef.code = set.getInt(10);
				if (set.wasNull()) {
					anObject.geoDepartmentRef.code = Integer.MIN_VALUE;
				}
				if(anObject.finExecutor.code != Integer.MIN_VALUE) {
					anObject.setFinExecutor(
						new com.ksoe.energynet.dataminer.generated.FINExecutorDAOGen(connection,getUserProfile()).getObject(anObject.finExecutor.code));
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


	public com.ksoe.energynet.valueobject.references.ENElementRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENElementRef ref = new com.ksoe.energynet.valueobject.references.ENElementRef();
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

		selectStr = "DELETE FROM  ENELEMENT WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENElement object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENElement.getObject%} access denied");
		}
		
		if(new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.DELETE,getUserProfile().getDomainInfo().getDomain()).isAccessDenied()) {
			throw new PersistenceException("{%ENElement.remove%} access denied");
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
	
	public long count(ENElementFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENElementFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENElementFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENELEMENT", aggFunction, column);
		String whereStr = "";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENElement.getList%} access denied");
		}

		whereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());

		if(whereStr.length() == 0) {
			whereStr = " (ENELEMENT.DOMAIN_INFO IS NOT NULL) ";
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
		String sql = String.format("SELECT %s FROM ENELEMENT WHERE code = ?", propertyName);
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
	
	public <E> List<E> getListOfPropertyValues(String propertyName, ENElementFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		return this.getListOfPropertyValues(propertyName, filter, fromPosition, quantity, bindObjects, true);
	}

	@SuppressWarnings("unchecked")
	public <E> List<E> getListOfPropertyValues(String propertyName, ENElementFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects, boolean isSegregation) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENELEMENT");
		String whereStr = "";
		PreparedStatement statement = null;
		ResultSet set = null;
		
		ArrayList<E> out = new ArrayList<E>();
		
		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}
		
		if(isSegregation) {
			SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ_LIST,getUserProfile().getDomainInfo().getDomain());
			if(segregationInfo.isAccessDenied()) {
				throw new PersistenceException("{%ENElement.getList%} access denied");
			}

			whereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());

			if(whereStr.length() == 0) {
				whereStr = " (ENELEMENT.DOMAIN_INFO IS NOT NULL) ";
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
		
		SegregationInfo segregationInfo = new SegregationProcessor().getSegregationInfoForDataAccess(ENElement.class.getName(),DataAccessType.READ,getUserProfile().getDomainInfo().getDomain());
		if(segregationInfo.isAccessDenied()) {
			throw new PersistenceException("{%ENElement.getObject%} access denied");
		}
		selectStr =
			"SELECT  ENELEMENT.CODE FROM  ENELEMENT WHERE  ENELEMENT.CODE = ?";
		String segregationWhereStr = SegregationQueryBuilder.addWhere("ENELEMENT",segregationInfo,getUserProfile().getDomainInfo());
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
		_checkConditionToken(condition,"code","ENELEMENT.CODE");
		_checkConditionToken(condition,"orderfield","ENELEMENT.ORDERFIELD");
		_checkConditionToken(condition,"domain_info","ENELEMENT.DOMAIN_INFO");
		_checkConditionToken(condition,"modify_time","ENELEMENT.MODIFY_TIME");
		// relationship conditions
		_checkConditionToken(condition,"typeref","TYPEREFCODE");
		_checkConditionToken(condition,"typeref.code","TYPEREFCODE");
		_checkConditionToken(condition,"elementinref","ELEMENTINREFCODE");
		_checkConditionToken(condition,"elementinref.code","ELEMENTINREFCODE");
		_checkConditionToken(condition,"elementoutref","ELEMENTOUTREFCODE");
		_checkConditionToken(condition,"elementoutref.code","ELEMENTOUTREFCODE");
		_checkConditionToken(condition,"renref","RENREFCODE");
		_checkConditionToken(condition,"renref.code","RENREFCODE");
		_checkConditionToken(condition,"finexecutor","FINEXECUTORCODE");
		_checkConditionToken(condition,"finexecutor.code","FINEXECUTORCODE");
		_checkConditionToken(condition,"geodepartmentref","GEODEPARTMENTREFCODE");
		_checkConditionToken(condition,"geodepartmentref.code","GEODEPARTMENTREFCODE");
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
	
	private void _collectAutoIncrementFields(ENElement anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENELEMENT", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENELEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENELEMENT", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENELEMENT");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENElementDAO
