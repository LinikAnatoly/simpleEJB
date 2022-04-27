
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENPlanInformCustomerDAOGen;
import com.ksoe.energynet.valueobject.ENPlanInformCustomer;
import com.ksoe.energynet.valueobject.brief.ENPlanInformCustomerShort;
import com.ksoe.energynet.valueobject.lists.ENPlanInformCustomerShortList;

/**
 * DAO Object for ENPlanInformCustomer;
 *
 */

public class ENPlanInformCustomerDAO extends ENPlanInformCustomerDAOGen {

    public ENPlanInformCustomerDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENPlanInformCustomerDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
	public int add(ENPlanInformCustomer anObject) throws PersistenceException {
		
		   anObject.dateAdd = new Date();
		   anObject.userAdd = getUserProfile().userName;
		   anObject.dateEdit = new Date();
		   anObject.userGen = getUserProfile().userName;
		   anObject.isSent = 0;
		
		return add(anObject,true);
	}

	
	public void save(ENPlanInformCustomer anObject) throws PersistenceException {
		
		   anObject.dateEdit = new Date();
		   anObject.userGen = getUserProfile().userName;
		
		  super.save(anObject);
	}
	
	public ENPlanInformCustomerShortList getScrollableFilteredList(ENPlanInformCustomer aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<Object> aBindObjects) throws PersistenceException {
		ENPlanInformCustomerShortList result = new ENPlanInformCustomerShortList();
		ENPlanInformCustomerShort anObject;
		result.list = new Vector<ENPlanInformCustomerShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENPLANINFORMCUSTOMER.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENPLANINFORMCUSTOMER.CODE"+
			",ENPLANINFORMCUSTOMER.TIMESTART"+
			",ENPLANINFORMCUSTOMER.TIMEFINAL"+
			",ENPLANINFORMCUSTOMER.USERADD"+
			",ENPLANINFORMCUSTOMER.DATEADD"+
			",ENPLANINFORMCUSTOMER.USERGEN"+
			",ENPLANINFORMCUSTOMER.DATEEDIT"+
			",ENPLANINFORMCUSTOMER.ISSENT"+
			", ENWORKORDERBYT.CODE " +
			", ENWORKORDERBYT.NUMBERGEN " +
			", ENWORKORDERBYT.DATEGEN " +
			", ENWORKORDERBYT.COMMENTGEN " +
			", ENWORKORDERBYT.DATEADD " +
			", ENWORKORDERBYT.DATEEDIT " +
			", ENWORKORDERBYT.USERADD " +
			", ENWORKORDERBYT.USEREDIT " +
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
			",  (select case when length(coalesce(enworkorderbytitem.phone,'')) < 10 then '' " + 
            " else coalesce(enworkorderbytitem.phone,'') end " +
            " from enworkorderbytitem where ENPLANINFORMCUSTOMER.planrefcode = enworkorderbytitem.planrefcode limit 1) as workorderbytitemphone " +
		    ", to_char(ENPLANINFORMCUSTOMER.timestart, 'dd.MM.yyyy HH24:mi') || ' - '|| to_char(ENPLANINFORMCUSTOMER.timefinal,'HH24:mi') as infoTime " +
            " FROM ENPLANINFORMCUSTOMER " +
			" left join ENWORKORDERBYT on (ENWORKORDERBYT.CODE = ENPLANINFORMCUSTOMER.WORKORDERBYTREFCODE) " +
			", ENPLANWORK " +
		"";
		whereStr = " ENPLANWORK.CODE = ENPLANINFORMCUSTOMER.PLANREFCODE" ; //+

	
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
				anObject = new ENPlanInformCustomerShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.timeStart = set.getTimestamp(2);
				anObject.timeFinal = set.getTimestamp(3);
				anObject.userAdd = set.getString(4);
				anObject.dateAdd = set.getTimestamp(5);
				anObject.userGen = set.getString(6);
				anObject.dateEdit = set.getTimestamp(7);
				anObject.isSent = set.getInt(8);
				if ( set.wasNull() ) {
					anObject.isSent = Integer.MIN_VALUE;
				}

				anObject.workOrderBytRefCode = set.getInt(9);
				if(set.wasNull()) {
					anObject.workOrderBytRefCode = Integer.MIN_VALUE;
				}
				anObject.workOrderBytRefNumberGen = set.getString(10);
				anObject.workOrderBytRefDateGen = set.getDate(11);
				anObject.workOrderBytRefCommentGen = set.getString(12);
				anObject.workOrderBytRefDateAdd = set.getTimestamp(13);
				anObject.workOrderBytRefDateEdit = set.getTimestamp(14);
				anObject.workOrderBytRefUserAdd = set.getString(15);
				anObject.workOrderBytRefUserEdit = set.getString(16);
				anObject.planRefCode = set.getInt(17);
				if(set.wasNull()) {
					anObject.planRefCode = Integer.MIN_VALUE;
				}
				anObject.planRefDateGen = set.getTimestamp(18);
				anObject.planRefDateStart = set.getDate(19);
				anObject.planRefDateFinal = set.getDate(20);
				anObject.planRefYearGen = set.getInt(21);
				if(set.wasNull()) {
					anObject.planRefYearGen = Integer.MIN_VALUE;
				}
				anObject.planRefMonthGen = set.getInt(22);
				if(set.wasNull()) {
					anObject.planRefMonthGen = Integer.MIN_VALUE;
				}
				anObject.planRefYearOriginal = set.getInt(23);
				if(set.wasNull()) {
					anObject.planRefYearOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefMonthOriginal = set.getInt(24);
				if(set.wasNull()) {
					anObject.planRefMonthOriginal = Integer.MIN_VALUE;
				}
				anObject.planRefUserGen = set.getString(25);
				anObject.planRefDateEdit = set.getDate(26);
				anObject.planRefWorkOrderNumber = set.getString(27);
				anObject.planRefDateWorkOrder = set.getDate(28);
				anObject.planRefPriConnectionNumber = set.getString(29);
				anObject.planRefDateEndPriConnection = set.getDate(30);
				anObject.planRefInvestWorksDescription = set.getString(31);
				anObject.planRefServicesFSideFinId = set.getInt(32);
				if(set.wasNull()) {
					anObject.planRefServicesFSideFinId = Integer.MIN_VALUE;
				}
				anObject.planRefServicesFSideCnNum = set.getString(33);
				anObject.planRefTotalTimeHours = set.getBigDecimal(34);
				if(anObject.planRefTotalTimeHours != null) {
					anObject.planRefTotalTimeHours = anObject.planRefTotalTimeHours.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefTotalTimeDays = set.getBigDecimal(35);
				if(anObject.planRefTotalTimeDays != null) {
					anObject.planRefTotalTimeDays = anObject.planRefTotalTimeDays.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.planRefInvestItemNumber = set.getString(36);
				
				anObject.workOrderBytItemPhone = set.getString(37);

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
	
	
} // end of ENPlanInformCustomerDAO
