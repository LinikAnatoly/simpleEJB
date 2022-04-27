//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Vector;

import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENRecordPointPromDAOGen;
import com.ksoe.energynet.valueobject.ENRecordPointProm;
import com.ksoe.energynet.valueobject.brief.ENRecordPointPromShort;
import com.ksoe.energynet.valueobject.filter.ENRecordPointPromFilter;
import com.ksoe.energynet.valueobject.lists.ENRecordPointPromShortList;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENRecordPointProm;
 *
 */

public class ENRecordPointPromDAO extends ENRecordPointPromDAOGen {

	public ENRecordPointPromDAO(UserProfile anUserProfile,
			Connection aConnection) {
		super(anUserProfile, aConnection);
	}

	public ENRecordPointPromDAO(Connection aConnection,
			UserProfile anUserProfile) {
		super(aConnection, anUserProfile);
	}

	@Override
	public void remove(int uid) throws PersistenceException {
		ENRecordPointProm obj = getObject(uid);
		super.remove(obj.code);

		ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile());
		eDao.remove(obj.element.code);

	}


	@Override
	public int[] getFilteredCodeArray(ENRecordPointPromFilter aFilterObject,
			int fromPosition, int quantity) throws PersistenceException {
		return getFilteredCodeArray(
				aFilterObject,
				(aFilterObject == null) ? (null) : (aFilterObject.conditionSQL),
				(aFilterObject == null) ? (null) : (aFilterObject.orderBySQL),
				fromPosition, quantity, null);
	}


	@Override
	public int[] getFilteredCodeArray(ENRecordPointProm aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			/*getFilteredCodeArray(ENRecordPointProm aFilterObject,
			String anCondition, String anOrderBy, int fromPosition,
			int quantity, Vector<Object> aBindObjects)*/
			throws PersistenceException {

		Vector<Integer> result = new Vector<>();

		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet set = null;
		String selectStr = "SELECT ENRECORDPOINTPROM.CODE FROM ENRECORDPOINTPROM";
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTPROM.CODE";
		}
		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}


		if (whereStr.length() > 0) {
		whereStr += " AND " + buildCondition(aFilterObject);}
		else {
			whereStr = buildCondition(aFilterObject);
		}

		if(condition.length() != 0) {
			if(whereStr.length() != 0) {
				whereStr = whereStr + " AND ";
			}
			whereStr = whereStr + " (" + condition + ")";
		}

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


	public void loadObjectNoSegr(ENRecordPointProm anObject) throws PersistenceException {
		loadObject(anObject, true, false);
	}

	public ENRecordPointProm getObjectNoSegr(int uid) throws PersistenceException {
		ENRecordPointProm result = new ENRecordPointProm();
		result.code = uid;
		loadObjectNoSegr(result);
		if(result.code == Integer.MIN_VALUE) {
			return null;
		}
		return result;
	}

	public boolean existsNoSegr(int anObjectCode) throws PersistenceException {
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
			"SELECT  ENRECORDPOINTPROM.CODE FROM  ENRECORDPOINTPROM WHERE  ENRECORDPOINTPROM.CODE = ?";

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

    public ENRecordPointProm getObjectByElementCode(int elementCode, boolean isSegregation) throws PersistenceException {
    	if(elementCode == Integer.MIN_VALUE) {
    		throw new java.lang.NullPointerException("elementCode is null");
    	}
    	ENRecordPointPromFilter filter = new ENRecordPointPromFilter();
    	filter.element.code = elementCode;
    	List<Integer> codes = this.getListOfPropertyValues(String.format("%s::integer", ENRecordPointProm.code_Field)
    			, filter, 0, -1, null, isSegregation);
    	if(codes.size() == 0) {
    		return null;
    	} else {
    		if(codes.size() != 1) {
    			throw new SystemException(String.format("Помилка у кількості записів для юридичної точки обліку з кодом елемента %d.\n"
    					+ "Всього знайдено записів - %d", elementCode, codes.size()));
    		}
    		if(isSegregation) {
        		return this.getObject(codes.get(0));
    		} else {
    			return this.getObjectNoSegr(codes.get(0));
    		}

    	}
    }




	@Override
	public ENRecordPointPromShortList getScrollableFilteredList(ENRecordPointProm aFilterObject, String anCondition,
			String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects)
			throws PersistenceException {

		ENRecordPointPromShortList result = new ENRecordPointPromShortList();
		ENRecordPointPromShort anObject;
		result.list = new Vector<>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENRECORDPOINTPROM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENRECORDPOINTPROM.CODE"+
			",ENRECORDPOINTPROM.ACCOUNTNUMBER"+
			",ENRECORDPOINTPROM.ACCOUNTNAME"+
			",ENRECORDPOINTPROM.ACCOUNTCODE"+
			",ENRECORDPOINTPROM.COUNTERNUMBER"+
			",ENRECORDPOINTPROM.RECORDPOINTNAME"+
			",ENRECORDPOINTPROM.RECORDPOINTADDR"+
			",ENRECORDPOINTPROM.RECORDPOINTKINDNAME"+
			",ENRECORDPOINTPROM.RECORDPOINTCODE"+
			",ENRECORDPOINTPROM.FEEDER"+
			",ENRECORDPOINTPROM.SUBSTATION"+
			",ENRECORDPOINTPROM.INVNUMBER"+
			",ENRECORDPOINTPROM.DAYOFCALCULATION"+
			",ENRECORDPOINTPROM.INSPECTOR"+
			",ENRECORDPOINTPROM.DATECONTROL"+
			",ENRECORDPOINTPROM.DATETP"+
			",ENRECORDPOINTPROM.DATECOUNTERINST"+
			",ENRECORDPOINTPROM.DATECOUNTERCHECK"+
			",ENRECORDPOINTPROM.COUNTERTYPE"+
			",ENRECORDPOINTPROM.CLASSACCURACY"+
			",ENRECORDPOINTPROM.CHECKPERIOD"+
			",ENRECORDPOINTPROM.STATUSCODE"+
			",ENRECORDPOINTPROM.PHASITY"+
			",ENRECORDPOINTPROM.PHONE"+
			",ENRECORDPOINTPROM.SEAL"+
			",ENRECORDPOINTPROM.PLACECOUNTER"+
			",ENRECORDPOINTPROM.ISWORKING"+
			",ENRECORDPOINTPROM.FIDERCODE"+
			",ENRECORDPOINTPROM.FIDERNAME"+
			",ENRECORDPOINTPROM.COUNTERCAPACITY"+
			",ENRECORDPOINTPROM.COUNTERVOLTAGENOMINAL"+
			",ENRECORDPOINTPROM.COUNTERDATEPRODUCT"+
			",ENRECORDPOINTPROM.DISABLEPLAN"+
			",ENRECORDPOINTPROM.CODEEIC"+
			",ENRECORDPOINTPROM.TOWER"+
			",ENRECORDPOINTPROM.FEEDER04"+
			",ENRECORDPOINTPROM.DATEFIRSTCONSUMPTION"+
			",ENRECORDPOINTPROM.CONTRACTDATE"+
			", EPREN.CODE " +
			", EPREN.NAME " +
			", ENELEMENT.CODE " +
		" FROM ENRECORDPOINTPROM " +
			" LEFT JOIN EPREN on EPREN.CODE = ENRECORDPOINTPROM.RENCODE "+
			" LEFT JOIN ENELEMENT on ENELEMENT.CODE = ENRECORDPOINTPROM.ELEMENTCODE "+
		"";


		whereStr = BaseDAOUtils.addToCondition(buildCondition(aFilterObject), whereStr);
		whereStr = BaseDAOUtils.addToCondition(condition, whereStr, true);

		if (whereStr.length() != 0) {
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
				anObject = new ENRecordPointPromShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.accountNumber = set.getString(2);
				anObject.accountName = set.getString(3);
				anObject.accountCode = set.getInt(4);
				if ( set.wasNull() ) {
					anObject.accountCode = Integer.MIN_VALUE;
				}
				anObject.counterNumber = set.getString(5);
				anObject.recordPointName = set.getString(6);
				anObject.recordPointAddr = set.getString(7);
				anObject.recordPointKindName = set.getString(8);
				anObject.recordPointCode = set.getInt(9);
				if ( set.wasNull() ) {
					anObject.recordPointCode = Integer.MIN_VALUE;
				}
				anObject.feeder = set.getString(10);
				anObject.substation = set.getString(11);
				anObject.invNumber = set.getString(12);
				anObject.dayofcalculation = set.getInt(13);
				if ( set.wasNull() ) {
					anObject.dayofcalculation = Integer.MIN_VALUE;
				}
				anObject.inspector = set.getString(14);
				anObject.datecontrol = set.getDate(15);
				anObject.datetp = set.getDate(16);
				anObject.dateCounterInst = set.getDate(17);
				anObject.dateCounterCheck = set.getDate(18);
				anObject.counterType = set.getString(19);
				anObject.classAccuracy = set.getBigDecimal(20);
				if(anObject.classAccuracy != null) {
					anObject.classAccuracy = anObject.classAccuracy.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.checkperiod = set.getBigDecimal(21);
				if(anObject.checkperiod != null) {
					anObject.checkperiod = anObject.checkperiod.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.statuscode = set.getInt(22);
				if ( set.wasNull() ) {
					anObject.statuscode = Integer.MIN_VALUE;
				}
				anObject.phasity = set.getBigDecimal(23);
				if(anObject.phasity != null) {
					anObject.phasity = anObject.phasity.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.phone = set.getString(24);
				anObject.seal = set.getString(25);
				anObject.placecounter = set.getString(26);
				anObject.isworking = set.getInt(27);
				if ( set.wasNull() ) {
					anObject.isworking = Integer.MIN_VALUE;
				}
				anObject.fiderCode = set.getInt(28);
				if ( set.wasNull() ) {
					anObject.fiderCode = Integer.MIN_VALUE;
				}
				anObject.fiderName = set.getString(29);
				anObject.counterCapacity = set.getInt(30);
				if ( set.wasNull() ) {
					anObject.counterCapacity = Integer.MIN_VALUE;
				}
				anObject.counterVoltageNominal = set.getBigDecimal(31);
				if(anObject.counterVoltageNominal != null) {
					anObject.counterVoltageNominal = anObject.counterVoltageNominal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.counterDateProduct = set.getDate(32);
				anObject.disablePlan = set.getInt(33);
				if ( set.wasNull() ) {
					anObject.disablePlan = Integer.MIN_VALUE;
				}
				anObject.codeEIC = set.getString(34);
				anObject.tower = set.getString(35);
				anObject.feeder04 = set.getString(36);
				anObject.dateFirstConsumption = set.getDate(37);
				anObject.contractDate = set.getDate(38);

				anObject.renCode = set.getInt(39);
				if(set.wasNull()) {
					anObject.renCode = Integer.MIN_VALUE;
				}
				anObject.renName = set.getString(40);
				anObject.elementCode = set.getInt(41);
				if(set.wasNull()) {
					anObject.elementCode = Integer.MIN_VALUE;
				}

				result.list.add(anObject);
			}


			result.setTotalCount(i);

			return result;

		} catch (SQLException e) {
			System.out.println(e.getMessage() + "\nstatement - " + selectStr);
			throw new SystemException(e.getMessage(), e);
		} finally {
			try {
				if (set != null)
					set.close();
			} catch (SQLException e) {
			}
			try {
				if (statement != null)
					statement.close();
			} catch (SQLException e) {
			}
			if (connection != super.getConnection()) {
				try {
					connection.close();
				} catch (SQLException e) {
				}
			}
		}
	}

} // end of ENRecordPointPromDAO

