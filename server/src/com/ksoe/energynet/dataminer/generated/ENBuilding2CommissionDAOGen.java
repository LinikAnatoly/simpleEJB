
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
import com.ksoe.energynet.valueobject.ENBuilding2Commission;
import com.ksoe.energynet.valueobject.filter.ENBuilding2CommissionFilter;
import com.ksoe.energynet.valueobject.brief.ENBuilding2CommissionShort;
import com.ksoe.energynet.valueobject.lists.ENBuilding2CommissionShortList;


/**
 * DAO Object for ENBuilding2Commission;
 *
 */

public class ENBuilding2CommissionDAOGen extends GenericDataMiner {

	public ENBuilding2CommissionDAOGen(UserProfile anUserProfile, Connection aConnection) {
		super(anUserProfile,aConnection);
	}

	public ENBuilding2CommissionDAOGen(Connection aConnection, UserProfile anUserProfile) {
		super(aConnection,anUserProfile);
	}

	public boolean isEqual(ENBuilding2Commission inObject) throws PersistenceException {
		ENBuilding2Commission obj = new ENBuilding2Commission();
		obj.code = inObject.code;
		loadObject(obj);

		if(inObject.tabNumber == null && obj.tabNumber == null){}
		else
			if(inObject.tabNumber == null || obj.tabNumber == null) return false;
			else
				if ( ! inObject.tabNumber.equals(obj.tabNumber)){
					return false;
				}

		if(inObject.FIO == null && obj.FIO == null){}
		else
			if(inObject.FIO == null || obj.FIO == null) return false;
			else
				if ( ! inObject.FIO.equals(obj.FIO)){
					return false;
				}

		if(inObject.shortFIO == null && obj.shortFIO == null){}
		else
			if(inObject.shortFIO == null || obj.shortFIO == null) return false;
			else
				if ( ! inObject.shortFIO.equals(obj.shortFIO)){
					return false;
				}

		if(inObject.positionName == null && obj.positionName == null){}
		else
			if(inObject.positionName == null || obj.positionName == null) return false;
			else
				if ( ! inObject.positionName.equals(obj.positionName)){
					return false;
				}
		if (inObject.ENBuildingRef.code != obj.ENBuildingRef.code){
			return false;
		}
		if (inObject.ENBuildingCommissionTypeRef.code != obj.ENBuildingCommissionTypeRef.code){
			return false;
		}
		return true;
	}

	public int add(ENBuilding2Commission anObject) throws PersistenceException {
		return add(anObject,true);
	}

	public int add(ENBuilding2Commission anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}


		selectStr = "INSERT INTO ENBUILDING2COMMISSION (CODE,TABNUMBER,FIO,SHORTFIO,POSITIONNAME,ENBUILDINGREFCODE,ENBUILDINGCMMSSNTPRFCD) VALUES (?,?,?,?,?,?,?)";

		try {
			statement = connection.prepareStatement(selectStr);
			if (anObject.code != Integer.MIN_VALUE ) {
				statement.setInt(1, anObject.code);
			} else {
				statement.setNull(1, java.sql.Types.INTEGER);
			}
			statement.setString(2, anObject.tabNumber);
			statement.setString(3, anObject.FIO);
			statement.setString(4, anObject.shortFIO);
			statement.setString(5, anObject.positionName);
			if (anObject.ENBuildingRef.code != Integer.MIN_VALUE){
				statement.setInt(6,anObject.ENBuildingRef.code);
			} else {
				statement.setNull(6,java.sql.Types.INTEGER);
			}
			if (anObject.ENBuildingCommissionTypeRef.code != Integer.MIN_VALUE){
				statement.setInt(7,anObject.ENBuildingCommissionTypeRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}

			statement.execute();


			return anObject.code;

		} catch(SQLException e) {
			_sequenceTable.clear();
			throw new SystemException(e.getMessage(), e);
		} catch(Exception e) {
			_sequenceTable.clear();
			throw new PersistenceException("Error in method {%ENBuilding2CommissionDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	public void save(ENBuilding2Commission anObject) throws PersistenceException {
		save(anObject,null);
	}

	public void save(ENBuilding2Commission anObject,String[] anAttributes) throws PersistenceException {
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
					if(fieldNameStr.compareTo("TABNUMBER") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("FIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("SHORTFIO") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("POSITIONNAME") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENBUILDINGREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
					fieldNameStr = processCondition(anAttributes[attrIndex]);
					if(fieldNameStr.compareTo("ENBUILDINGCOMMISSIONTYPEREF") == 0) {
						fields.add(fieldNameStr);
						continue;
					}
				}
				if(fields.size() == 0) {
					return;
				}
			}
			if(fields == null) {
				selectStr = "UPDATE ENBUILDING2COMMISSION SET  TABNUMBER = ? , FIO = ? , SHORTFIO = ? , POSITIONNAME = ? , ENBUILDINGREFCODE = ? , ENBUILDINGCMMSSNTPRFCD = ?  "
					+" WHERE CODE = ?";
			} else {
				selectStr = "UPDATE ENBUILDING2COMMISSION SET ";
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
					statement.setString(2, anObject.FIO);
					statement.setString(3, anObject.shortFIO);
					statement.setString(4, anObject.positionName);
					if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
						statement.setInt(5, anObject.ENBuildingRef.code);
					} else {
						statement.setNull(5, java.sql.Types.INTEGER);
					}
					if (anObject.ENBuildingCommissionTypeRef.code != Integer.MIN_VALUE) {
						statement.setInt(6, anObject.ENBuildingCommissionTypeRef.code);
					} else {
						statement.setNull(6, java.sql.Types.INTEGER);
					}
					statement.setInt(7, anObject.code);
				} else {
					for(int i = 0;i < fields.size();i++) {
						if("TABNUMBER".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.tabNumber);
							continue;
						}
						if("FIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.FIO);
							continue;
						}
						if("SHORTFIO".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.shortFIO);
							continue;
						}
						if("POSITIONNAME".compareTo((String)fields.get(i)) == 0) {
							statement.setString(i+1, anObject.positionName);
							continue;
						}
						if("ENBUILDINGREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENBuildingRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENBuildingRef.code);
							} else {
								statement.setNull(i+1, java.sql.Types.INTEGER);
							}
							continue;
						}
						if("ENBUILDINGCOMMISSIONTYPEREF".compareTo((String)fields.get(i)) == 0) {
							if (anObject.ENBuildingCommissionTypeRef.code != Integer.MIN_VALUE) {
								statement.setInt(i+1, anObject.ENBuildingCommissionTypeRef.code);
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

	} // end of save(ENBuilding2Commission anObject,String[] anAttributes)


	public ENBuilding2CommissionShort getShortObject(int anObjectCode) throws PersistenceException {
		ENBuilding2Commission filterObject = new ENBuilding2Commission();
		Vector<ENBuilding2CommissionShort> list;
		filterObject.code = anObjectCode;
		list = getFilteredList(filterObject).list;
		if(list.size() > 0) {
			return (ENBuilding2CommissionShort)list.get(0);
		}
		return null;
	}
	
	public int setParameters(ENBuilding2Commission filter, PreparedStatement statement) throws SQLException {
		int index = 0;
		if(filter != null) {
			index++;
			index = BaseDAOUtils.setIntParameter(filter.code, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.tabNumber, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.FIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.shortFIO, index, statement);
			index = BaseDAOUtils.setStringParameter(filter.positionName, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuildingRef.code, index, statement);
			index = BaseDAOUtils.setIntParameter(filter.ENBuildingCommissionTypeRef.code, index, statement);
			index--;
		}
		return index;
	}
	
	public String buildCondition(ENBuilding2CommissionFilter filter) {
		String out = buildCondition((ENBuilding2Commission)filter);
		if(filter != null) {
			out = BaseDAOUtils.addToCondition(filter.conditionSQL, out);
		}
		return out;
	}
	public String buildCondition(ENBuilding2Commission filter) {
		String out = "";
		if(filter != null) {
			out = BaseDAOUtils.addIntToCondition(filter.code, ENBuilding2Commission.code_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.tabNumber, ENBuilding2Commission.tabNumber_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.FIO, ENBuilding2Commission.FIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.shortFIO, ENBuilding2Commission.shortFIO_QFielld, out);
			out = BaseDAOUtils.addStringToCondition(filter.positionName, ENBuilding2Commission.positionName_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuildingRef.code, ENBuilding2Commission.ENBuildingRef_QFielld, out);
			out = BaseDAOUtils.addIntToCondition(filter.ENBuildingCommissionTypeRef.code, ENBuilding2Commission.ENBuildingCommissionTypeRef_QFielld, out);
		}
		return out;
	}

	public ENBuilding2CommissionShortList getList(String aCondition) throws PersistenceException {
		return getScrollableFilteredList(null, aCondition, 0, -1);
	}

	public ENBuilding2CommissionShortList getList() throws PersistenceException {
		return getScrollableFilteredList(null, null, 0, -1);
	}

	public ENBuilding2CommissionShortList getScrollableList(int fromPosition, int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, null, fromPosition, quantity);
	}

	public ENBuilding2CommissionShortList getFilteredList(ENBuilding2Commission filterObject) throws PersistenceException {
		return getScrollableFilteredList(filterObject, 0, -1);
	}

	public ENBuilding2CommissionShortList getScrollableFilteredList(ENBuilding2Commission aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, null, fromPosition, quantity);
	}

	public ENBuilding2CommissionShortList getScrollableFilteredList(ENBuilding2Commission aFilterObject, String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject, anCondition, null, fromPosition, quantity, null);
	}

	public ENBuilding2CommissionShortList getScrollableFilteredList(String anCondition,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(null, anCondition, fromPosition, quantity);
	}

	public ENBuilding2CommissionShortList getScrollableFilteredList(ENBuilding2CommissionFilter aFilterObject,int fromPosition,int quantity) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, null);
	}
	
	public ENBuilding2CommissionShortList getScrollableFilteredList(ENBuilding2CommissionFilter aFilterObject,int fromPosition,int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getScrollableFilteredList(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}
	
	public ENBuilding2CommissionShortList getScrollableFilteredList(ENBuilding2Commission aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENBuilding2CommissionShortList result = new ENBuilding2CommissionShortList();
		ENBuilding2CommissionShort anObject;
		result.list = new Vector<ENBuilding2CommissionShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2COMMISSION.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENBUILDING2COMMISSION.CODE"+
			",ENBUILDING2COMMISSION.TABNUMBER"+
			",ENBUILDING2COMMISSION.FIO"+
			",ENBUILDING2COMMISSION.SHORTFIO"+
			",ENBUILDING2COMMISSION.POSITIONNAME"+
			", ENBUILDING.CODE " +
			", ENBUILDING.NUMBERGEN " +
			", ENBUILDING.DATEGEN " +
			", ENBUILDING.DATEEDIT " +
			", ENBUILDING.SUMMAGEN " +
			", ENBUILDING.SUMMANDS " +
			", ENBUILDING.CHARACTERISTIC " +
			", ENBUILDING.EXECUTEDPOSITION " +
			", ENBUILDING.EXECUTEDNAME " +
			", ENBUILDING.ACCEPTEDPOSITION " +
			", ENBUILDING.ACCEPTEDNAME " +
			", ENBUILDING.CONTRACTPRICE " +
			", ENBUILDING.CODEMOL " +
			", ENBUILDING.CODEPODR " +
			", ENBUILDING.INVNUMBEROZ " +
			", ENBUILDING.NAMEOZ " +
			", ENBUILDING.FINCONTRACTNUMBER " +
			", ENBUILDING.FINCONTRACTDATE " +
			", ENBUILDING.PARTNERNAME " +
			", ENBUILDING.PARTNERCODE " +
			", ENBUILDING.ISINVESTPROGRAM " +
			", ENBUILDING.YEARINVESTPROGRAM " +
			", ENBUILDING.ITEMINVESTPROGRAM " +
			", ENBUILDING.BUILDINGADDRESS " +
			", ENBUILDING.DECREENUMBER " +
			", ENBUILDING.DECREEDATE " +
			", ENBUILDING.EXPLOITATIONTERM " +
			", ENBUILDING.DATELOADEXPL " +
			", ENBUILDING.DATEBUILD " +
			", ENBUILDING.USERGEN " +
			", ENBUILDINGCOMMISSIONTP.CODE " +
			", ENBUILDINGCOMMISSIONTP.NAME " +
		" FROM ENBUILDING2COMMISSION " +
			" LEFT JOIN ENBUILDING on ENBUILDING.CODE = ENBUILDING2COMMISSION.ENBUILDINGREFCODE "+
			" LEFT JOIN ENBUILDINGCOMMISSIONTP on ENBUILDINGCOMMISSIONTP.CODE = ENBUILDING2COMMISSION.ENBUILDINGCMMSSNTPRFCD "+
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
				anObject = new ENBuilding2CommissionShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.tabNumber = set.getString(2);
				anObject.FIO = set.getString(3);
				anObject.shortFIO = set.getString(4);
				anObject.positionName = set.getString(5);

				anObject.ENBuildingRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.ENBuildingRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefNumbergen = set.getString(7);
				anObject.ENBuildingRefDateGen = set.getDate(8);
				anObject.ENBuildingRefDateEdit = set.getDate(9);
				anObject.ENBuildingRefSummaGen = set.getBigDecimal(10);
				if(anObject.ENBuildingRefSummaGen != null) {
					anObject.ENBuildingRefSummaGen = anObject.ENBuildingRefSummaGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefSummaNDS = set.getBigDecimal(11);
				if(anObject.ENBuildingRefSummaNDS != null) {
					anObject.ENBuildingRefSummaNDS = anObject.ENBuildingRefSummaNDS.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCharacteristic = set.getString(12);
				anObject.ENBuildingRefExecutedPosition = set.getString(13);
				anObject.ENBuildingRefExecutedName = set.getString(14);
				anObject.ENBuildingRefAcceptedPosition = set.getString(15);
				anObject.ENBuildingRefAcceptedName = set.getString(16);
				anObject.ENBuildingRefContractPrice = set.getBigDecimal(17);
				if(anObject.ENBuildingRefContractPrice != null) {
					anObject.ENBuildingRefContractPrice = anObject.ENBuildingRefContractPrice.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.ENBuildingRefCodeMol = set.getString(18);
				anObject.ENBuildingRefCodePodr = set.getString(19);
				anObject.ENBuildingRefInvNumberOZ = set.getString(20);
				anObject.ENBuildingRefNameOZ = set.getString(21);
				anObject.ENBuildingRefFinContractNumber = set.getString(22);
				anObject.ENBuildingRefFinContractDate = set.getDate(23);
				anObject.ENBuildingRefPartnerName = set.getString(24);
				anObject.ENBuildingRefPartnerCode = set.getString(25);
				anObject.ENBuildingRefIsInvestProgram = set.getInt(26);
				if(set.wasNull()) {
					anObject.ENBuildingRefIsInvestProgram = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefYearInvestProgram = set.getString(27);
				anObject.ENBuildingRefItemInvestProgram = set.getString(28);
				anObject.ENBuildingRefBuildingAddress = set.getString(29);
				anObject.ENBuildingRefDecreeNumber = set.getString(30);
				anObject.ENBuildingRefDecreeDate = set.getDate(31);
				anObject.ENBuildingRefExploitationTerm = set.getInt(32);
				if(set.wasNull()) {
					anObject.ENBuildingRefExploitationTerm = Integer.MIN_VALUE;
				}
				anObject.ENBuildingRefDateLoadExpl = set.getDate(33);
				anObject.ENBuildingRefDateBuild = set.getDate(34);
				anObject.ENBuildingRefUserGen = set.getString(35);
				anObject.ENBuildingCommissionTypeRefCode = set.getInt(36);
				if(set.wasNull()) {
					anObject.ENBuildingCommissionTypeRefCode = Integer.MIN_VALUE;
				}
				anObject.ENBuildingCommissionTypeRefName = set.getString(37);

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
	
	public int[] getFilteredCodeArray(ENBuilding2CommissionFilter aFilterObject, int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject, fromPosition, quantity, null);
	}

	public int[] getFilteredCodeArray(ENBuilding2CommissionFilter aFilterObject, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		return getFilteredCodeArray(aFilterObject,(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL), (aFilterObject == null ) ? (null) : (aFilterObject.orderBySQL),fromPosition,quantity, aBindObjects);
	}


	public int[] getFilteredCodeArray(ENBuilding2Commission aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		Vector<Integer> result = new Vector<Integer>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENBUILDING2COMMISSION.CODE FROM ENBUILDING2COMMISSION";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENBUILDING2COMMISSION.CODE";
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


	public ENBuilding2Commission getObject(int uid) throws PersistenceException {
		ENBuilding2Commission result = new ENBuilding2Commission();
		result.code = uid;
		loadObject(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}


	public void loadObject(ENBuilding2Commission anObject) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;


		selectStr = "SELECT  ENBUILDING2COMMISSION.CODE, ENBUILDING2COMMISSION.TABNUMBER, ENBUILDING2COMMISSION.FIO, ENBUILDING2COMMISSION.SHORTFIO, ENBUILDING2COMMISSION.POSITIONNAME, ENBUILDING2COMMISSION.ENBUILDINGREFCODE, ENBUILDING2COMMISSION.ENBUILDINGCMMSSNTPRFCD "
			+" FROM ENBUILDING2COMMISSION WHERE ENBUILDING2COMMISSION.CODE = ?";


		try {
			statement = connection.prepareStatement(selectStr);
			statement.setInt(1,anObject.code);
			set = statement.executeQuery();
			if(!set.next()) {
				anObject.code = Integer.MIN_VALUE;
			} else {
				anObject.code = set.getInt(1);
			
				anObject.tabNumber = set.getString(2);
				anObject.FIO = set.getString(3);
				anObject.shortFIO = set.getString(4);
				anObject.positionName = set.getString(5);
				anObject.ENBuildingRef.code = set.getInt(6);
				if (set.wasNull()) {
					anObject.ENBuildingRef.code = Integer.MIN_VALUE;
				}
				anObject.ENBuildingCommissionTypeRef.code = set.getInt(7);
				if (set.wasNull()) {
					anObject.ENBuildingCommissionTypeRef.code = Integer.MIN_VALUE;
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


	public com.ksoe.energynet.valueobject.references.ENBuilding2CommissionRef getRef(int anObjectCode) throws PersistenceException {
		com.ksoe.energynet.valueobject.references.ENBuilding2CommissionRef ref = new com.ksoe.energynet.valueobject.references.ENBuilding2CommissionRef();
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

		selectStr = "DELETE FROM  ENBUILDING2COMMISSION WHERE CODE = ?";

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		ENBuilding2Commission object = getObject(uid);

		if(object == null) {
			throw new PersistenceException("{%ENBuilding2Commission.getObject%} access denied");
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
	
	public long count(ENBuilding2CommissionFilter filter) throws PersistenceException {
		return count(filter, null);
	}
	public long count(ENBuilding2CommissionFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		return (Long)getAggregateValue("count", "code", filter, bindObjects);
	}
	
	@SuppressWarnings("unchecked")
	public <E> E getAggregateValue(String aggFunction, String column, ENBuilding2CommissionFilter filter, Vector<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = String.format("SELECT %s(%s) FROM ENBUILDING2COMMISSION", aggFunction, column);
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
		String sql = String.format("SELECT %s FROM ENBUILDING2COMMISSION WHERE code = ?", propertyName);
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
	public <E> List<E> getListOfPropertyValues(String propertyName, ENBuilding2CommissionFilter filter, int fromPosition,int quantity, Collection<? extends Object> bindObjects) throws PersistenceException {
		Connection connection = this.getConnection();
		String sql = String.format("SELECT %s FROM %s ", propertyName, "ENBUILDING2COMMISSION");
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
			"SELECT  ENBUILDING2COMMISSION.CODE FROM  ENBUILDING2COMMISSION WHERE  ENBUILDING2COMMISSION.CODE = ?";
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
		_checkConditionToken(condition,"code","ENBUILDING2COMMISSION.CODE");
		_checkConditionToken(condition,"tabnumber","ENBUILDING2COMMISSION.TABNUMBER");
		_checkConditionToken(condition,"fio","ENBUILDING2COMMISSION.FIO");
		_checkConditionToken(condition,"shortfio","ENBUILDING2COMMISSION.SHORTFIO");
		_checkConditionToken(condition,"positionname","ENBUILDING2COMMISSION.POSITIONNAME");
		// relationship conditions
		_checkConditionToken(condition,"enbuildingref","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuildingref.code","ENBUILDINGREFCODE");
		_checkConditionToken(condition,"enbuildingcommissiontyperef","ENBUILDINGCMMSSNTPRFCD");
		_checkConditionToken(condition,"enbuildingcommissiontyperef.code","ENBUILDINGCMMSSNTPRFCD");
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
	
	private void _collectAutoIncrementFields(ENBuilding2Commission anObject, Connection connection) throws PersistenceException {

		SequenceKey hashKey = new SequenceKey("ENBUILDING2COMMISSION", "CODE");
		Integer nextSeqValue = null;
		SequenceValue sequenceValue;
		synchronized (_sequenceTable) {
			sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
			if (sequenceValue == null) {
				sequenceValue = getNewSequenceValue("ENBUILDING2COMMISSION", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
			if (!sequenceValue.isNextValueAvailable()) {
				sequenceValue = getNewSequenceValue("ENBUILDING2COMMISSION", "CODE");
				_sequenceTable.put(hashKey, sequenceValue);
			}
		}

		nextSeqValue = sequenceValue.getNextValue();
		if (nextSeqValue == null) {
			throw new PersistenceException(
				"Can't obtain auto increment value from: ENBUILDING2COMMISSION");
		} else {
			anObject.code = nextSeqValue.intValue();
			return;
		}
	}

} // end of ENBuilding2CommissionDAO
