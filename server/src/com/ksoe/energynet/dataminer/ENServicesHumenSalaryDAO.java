
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
import com.ksoe.energynet.dataminer.generated.ENServicesHumenSalaryDAOGen;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesHumenSalary;
import com.ksoe.energynet.valueobject.brief.ENServicesHumenSalaryShort;
import com.ksoe.energynet.valueobject.filter.ENServicesHumenSalaryFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesHumenSalaryShortList;

/**
 * DAO Object for ENServicesHumenSalary;
 *
 */

public class ENServicesHumenSalaryDAO extends ENServicesHumenSalaryDAOGen {

    public ENServicesHumenSalaryDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesHumenSalaryDAO(Connection aConnection,
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
    	ENServicesHumenSalaryFilter filter = new ENServicesHumenSalaryFilter();
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
    
	public ENServicesHumenSalaryShortList getScrollableFilteredList(ENServicesHumenSalary aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesHumenSalaryShortList result = new ENServicesHumenSalaryShortList();
		ENServicesHumenSalaryShort anObject;
		result.list = new Vector<ENServicesHumenSalaryShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESHUMENSALARY.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESHUMENSALARY.CODE"+
			",ENSERVICESHUMENSALARY.TIMEGEN"+
			",ENSERVICESHUMENSALARY.SALARY"+
			",ENSERVICESHUMENSALARY.SALARYTOTALBONUS"+
			",ENSERVICESHUMENSALARY.SALARYTOTAL"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCHUMENSALARY.CODE " +
			",TKCALCHUMENSALARY.POSITIONNAME"+
			",TKCALCHUMENSALARY.SALARYHOUR"+
		" FROM ENSERVICESHUMENSALARY " +
			", ENSERVICESCOST " +
			", TKCALCHUMENSALARY " +
		"";
		whereStr = " ENSERVICESCOST.CODE = ENSERVICESHUMENSALARY.SERVICESCOSTREFCODE" ; //+
		whereStr += " AND TKCALCHUMENSALARY.CODE = ENSERVICESHUMENSALARY.CALCHUMENSALARYREFCODE" ; //+

	
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
				anObject = new ENServicesHumenSalaryShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.timeGen = set.getBigDecimal(2);
				if(anObject.timeGen != null) {
					anObject.timeGen = anObject.timeGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salary = set.getBigDecimal(3);
				if(anObject.salary != null) {
					anObject.salary = anObject.salary.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotalBonus = set.getBigDecimal(4);
				if(anObject.salaryTotalBonus != null) {
					anObject.salaryTotalBonus = anObject.salaryTotalBonus.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.salaryTotal = set.getBigDecimal(5);
				if(anObject.salaryTotal != null) {
					anObject.salaryTotal = anObject.salaryTotal.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(6);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(7);
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(8);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(9);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(10);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcHumenSalaryRefCode = set.getInt(12);
				if(set.wasNull()) {
					anObject.calcHumenSalaryRefCode = Integer.MIN_VALUE;
				}
				
				anObject.positionName = set.getString(13);
				anObject.salaryHour = set.getBigDecimal(14);

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


} // end of ENServicesHumenSalaryDAO
