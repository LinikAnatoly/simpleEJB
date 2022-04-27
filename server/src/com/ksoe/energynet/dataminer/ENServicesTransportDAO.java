
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
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENServicesTransportDAOGen;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesTransport;
import com.ksoe.energynet.valueobject.brief.ENServicesTransportShort;
import com.ksoe.energynet.valueobject.filter.ENServicesTransportFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesTransportShortList;

/**
 * DAO Object for ENServicesTransport;
 *
 */

public class ENServicesTransportDAO extends ENServicesTransportDAOGen {

    public ENServicesTransportDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesTransportDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    /**
     * 
     * Получить массив кодов объектов для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет для договора
     * @throws PersistenceException
     */
    public int[] getArrayOfCodesByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	ENServicesCost.checkENServicesCostOnNull(servicesCost);
    	ENServicesTransportFilter filter = new ENServicesTransportFilter();
    	filter.servicesCostRef.code = servicesCost.code;
    	return this.getFilteredCodeArray(filter, 0, -1);
    }
    
    /**
     * 
     * Удалить все объекты для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет договора
     * @throws PersistenceException
     */
    public void removeByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	int[] codes = this.getArrayOfCodesByENServicesCost(servicesCost);
    	for(int code : codes) {
    		this.remove(code);
    	}
    }
    
	
	public ENServicesTransportShortList getScrollableFilteredList(ENServicesTransport aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesTransportShortList result = new ENServicesTransportShortList();
		ENServicesTransportShort anObject;
		result.list = new Vector<ENServicesTransportShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESTRANSPORT.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESTRANSPORT.CODE"+
			",ENSERVICESTRANSPORT.MACHINEHOURSCOUNT"+
			",ENSERVICESTRANSPORT.DISTANCE"+
			",ENSERVICESTRANSPORT.COSTMACHINEHOURS"+
			",ENSERVICESTRANSPORT.COSTDISTANCE"+
			",ENSERVICESTRANSPORT.COSTTOTAL"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCTRANSPORT.CODE " +
			",TKCALCTRANSPORT.TRANSPORTNAME"+
		" FROM ENSERVICESTRANSPORT " +
			", ENSERVICESCOST " +
			", TKCALCTRANSPORT " +
		"";
		whereStr = " ENSERVICESCOST.CODE = ENSERVICESTRANSPORT.SERVICESCOSTREFCODE" ; //+
		whereStr += " AND TKCALCTRANSPORT.CODE = ENSERVICESTRANSPORT.CALCTRANSPORTREFCODE" ; //+

	
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
				anObject = new ENServicesTransportShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.machineHoursCount = set.getBigDecimal(2);
				if(anObject.machineHoursCount != null) {
					anObject.machineHoursCount = anObject.machineHoursCount.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.distance = set.getBigDecimal(3);
				if(anObject.distance != null) {
					anObject.distance = anObject.distance.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costMachineHours = set.getBigDecimal(4);
				if(anObject.costMachineHours != null) {
					anObject.costMachineHours = anObject.costMachineHours.setScale(3,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costDistance = set.getBigDecimal(5);
				if(anObject.costDistance != null) {
					anObject.costDistance = anObject.costDistance.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.costTotal = set.getBigDecimal(6);
				if(anObject.costTotal != null) {
					anObject.costTotal = anObject.costTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(8);
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(9);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(10);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(12);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcTransportRefCode = set.getInt(13);
				if(set.wasNull()) {
					anObject.calcTransportRefCode = Integer.MIN_VALUE;
				}
				
				anObject.transportName = set.getString(14);

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
	


} // end of ENServicesTransportDAO
