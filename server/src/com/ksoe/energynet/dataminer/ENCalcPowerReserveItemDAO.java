
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENCalcPowerReserveItemDAOGen;
import com.ksoe.energynet.valueobject.ENCalcPowerReserveItem;
import com.ksoe.energynet.valueobject.brief.ENCalcPowerReserveItemShort;
import com.ksoe.energynet.valueobject.lists.ENCalcPowerReserveItemShortList;

/**
 * DAO Object for ENCalcPowerReserveItem;
 *
 */

public class ENCalcPowerReserveItemDAO extends ENCalcPowerReserveItemDAOGen {

    public ENCalcPowerReserveItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENCalcPowerReserveItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
///////////// PRIVATE SECTION ///////////////
protected static Hashtable<SequenceKey, SequenceValue> _sequenceTable = new Hashtable<SequenceKey, SequenceValue>();

private void _collectAutoIncrementFields(ENCalcPowerReserveItem anObject, Connection connection) throws PersistenceException {

SequenceKey hashKey = new SequenceKey("ENCALCPOWERRESERVEITEM", "CODE");
Integer nextSeqValue = null;
SequenceValue sequenceValue;
synchronized (_sequenceTable) {
	sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
	if (sequenceValue == null) {
		sequenceValue = getNewSequenceValue("ENCALCPOWERRESERVEITEM", "CODE");
		_sequenceTable.put(hashKey, sequenceValue);
	}
	if (!sequenceValue.isNextValueAvailable()) {
		sequenceValue = getNewSequenceValue("ENCALCPOWERRESERVEITEM", "CODE");
		_sequenceTable.put(hashKey, sequenceValue);
	}
}

nextSeqValue = sequenceValue.getNextValue();
if (nextSeqValue == null) {
	throw new PersistenceException(
		"Can't obtain auto increment value from: ENCALCPOWERRESERVEITEM");
} else {
	anObject.code = nextSeqValue.intValue();
	return;
}
}

    
	public int add(ENCalcPowerReserveItem anObject, boolean aUseSequential) throws PersistenceException {
		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;

		anObject.modify_time = System.currentTimeMillis();
		if(aUseSequential) {
			_collectAutoIncrementFields(anObject,connection);
		}

		anObject.dateAdd = new Date();
		anObject.dateEdit = new Date();
		anObject.userAdd = getUserProfile().userName;
		anObject.userGen = getUserProfile().userName;

		selectStr = "INSERT INTO ENCALCPOWERRESERVEITEM (CODE,MODIFY_TIME,USERADD,DATEADD,USERGEN,DATEEDIT,CALCPOWERRESERVEREFCOD,SO2NODEREFCODE) VALUES (?,?,?,?,?,?,?,?)";

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
			if (anObject.calcPowerReserveRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENCalcPowerReserveDAOGen(connection,getUserProfile()).exists(anObject.calcPowerReserveRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcPowerReserveItem.calcPowerReserveRef.code%} = {%"+anObject.calcPowerReserveRef.code+"%}");
				}
				statement.setInt(7,anObject.calcPowerReserveRef.code);
			} else {
				statement.setNull(7,java.sql.Types.INTEGER);
			}
			if (anObject.so2nodeRef.code != Integer.MIN_VALUE){
				if( ! new com.ksoe.energynet.dataminer.generated.ENSO2NodeDAOGen(connection,getUserProfile()).exists(anObject.so2nodeRef.code)) {
					throw new PersistenceException("Invalid attribute value {%com.ksoe.energynet.valueobject.ENCalcPowerReserveItem.so2nodeRef.code%} = {%"+anObject.so2nodeRef.code+"%}");
				}
				statement.setInt(8,anObject.so2nodeRef.code);
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
			throw new PersistenceException("Error in method {%ENCalcPowerReserveItemDAOGen.add%}",e);
		} finally {
			try {if (statement != null) statement.close();} catch (SQLException e) {}
			if(connection != super.getConnection()) {
				try{connection.close();} catch(SQLException e){}
			}
		}
	}

	
	public ENCalcPowerReserveItemShortList getScrollableFilteredList(ENCalcPowerReserveItem aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENCalcPowerReserveItemShortList result = new ENCalcPowerReserveItemShortList();
		ENCalcPowerReserveItemShort anObject;
		result.list = new Vector<ENCalcPowerReserveItemShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENCALCPOWERRESERVEITEM.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENCALCPOWERRESERVEITEM.CODE"+
			",ENCALCPOWERRESERVEITEM.USERGEN"+
			",ENCALCPOWERRESERVEITEM.DATEEDIT"+
			", ENCALCPOWERRESERVE.CODE " +
			", ENCALCPOWERRESERVE.USERGEN " +
			", ENCALCPOWERRESERVE.DATEEDIT " +
			", ENSO2NODE.CODE " +
			", ENSO2NODE.CCNODECODE " +
			", ENSO2NODE.POWER " +
			", ENSO2NODE.DESCRIPTION " +
			", ENSO2NODE.ISCALC " +
			", ENSO2NODE.USERGEN " +
			", ENSO2NODE.DATEEDIT " +
			
			", (select so.contractnumberservices || ' â³ä ' || to_char(so.contractdateservices,'dd.MM.yyyy') " +
            " from enservicesobject so where  ENSO2NODE.servicesobjectcode = so.code) as  socontract " +

            ", (select toc.numbergen || ' â³ä ' || to_char(toc.dategen,'dd.MM.yyyy')  from " +
            " entechconditionsobjcts toc, enservicesobject so " +
            " where so.techconobjectscode = toc.code " + 
            " and  ENSO2NODE.servicesobjectcode = so.code) as techconditions " +
            
			", (select so.contragentname from enservicesobject so where  ENSO2NODE.servicesobjectcode = so.code) as  socontragentname " +
			
			", (select so.name from enservicesobject so where  ENSO2NODE.servicesobjectcode = so.code) as  soname " +
            
		" FROM ENCALCPOWERRESERVEITEM " +
			" LEFT JOIN ENCALCPOWERRESERVE on ENCALCPOWERRESERVE.CODE = ENCALCPOWERRESERVEITEM.CALCPOWERRESERVEREFCOD "+
			" LEFT JOIN ENSO2NODE on ENSO2NODE.CODE = ENCALCPOWERRESERVEITEM.SO2NODEREFCODE "+
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
				anObject = new ENCalcPowerReserveItemShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.userGen = set.getString(2);
				anObject.dateEdit = set.getTimestamp(3);

				anObject.calcPowerReserveRefCode = set.getInt(4);
				if(set.wasNull()) {
					anObject.calcPowerReserveRefCode = Integer.MIN_VALUE;
				}
				anObject.calcPowerReserveRefUserGen = set.getString(5);
				anObject.calcPowerReserveRefDateEdit = set.getTimestamp(6);
				anObject.so2nodeRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.so2nodeRefCode = Integer.MIN_VALUE;
				}
				anObject.so2nodeRefCcNodeCode = set.getInt(8);
				if(set.wasNull()) {
					anObject.so2nodeRefCcNodeCode = Integer.MIN_VALUE;
				}
				anObject.so2nodeRefPower = set.getBigDecimal(9);
				if(anObject.so2nodeRefPower != null) {
					anObject.so2nodeRefPower = anObject.so2nodeRefPower.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.so2nodeRefDescription = set.getString(10);
				anObject.so2nodeRefIsCalc = set.getInt(11);
				if(set.wasNull()) {
					anObject.so2nodeRefIsCalc = Integer.MIN_VALUE;
				}
				anObject.so2nodeRefUserGen = set.getString(12);
				anObject.so2nodeRefDateEdit = set.getTimestamp(13);

				anObject.soContract = set.getString(14);
				anObject.techconditions = set.getString(15);
				
				anObject.soContragentName = set.getString(16);
				anObject.soName = set.getString(17);
				
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
	


} // end of ENCalcPowerReserveItemDAO
