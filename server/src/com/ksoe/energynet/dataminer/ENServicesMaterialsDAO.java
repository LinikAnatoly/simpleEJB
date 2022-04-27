
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.techcard.dataminer.TKCalcMaterialsDAO;
import com.ksoe.techcard.valueobject.TKCalcMaterials;
import com.ksoe.techcard.valueobject.filter.TKCalcMaterialsFilter;
import com.ksoe.techcard.valueobject.lists.TKCalcMaterialsShortList;
import com.ksoe.authorization.dataminer.BaseDAOUtils;
import com.ksoe.energynet.dataminer.generated.ENServicesMaterialsDAOGen;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.energynet.valueobject.ENServicesMaterials;
import com.ksoe.energynet.valueobject.brief.ENServicesMaterialsShort;
import com.ksoe.energynet.valueobject.filter.ENServicesMaterialsFilter;
import com.ksoe.energynet.valueobject.lists.ENServicesMaterialsShortList;

/**
 * DAO Object for ENServicesMaterials;
 *
 */

public class ENServicesMaterialsDAO extends ENServicesMaterialsDAOGen {

    public ENServicesMaterialsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENServicesMaterialsDAO(Connection aConnection,
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
    	ENServicesMaterialsFilter filter = new ENServicesMaterialsFilter();
    	filter.servicesCostRef.code = servicesCost.code;
    	return this.getFilteredCodeArray(filter, 0, -1);
    }
    
    /**
     * 
     * Получить лист объектов {@link ENServicesMaterialsShort } для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет для договора
     * @throws PersistenceException
     */
    public ENServicesMaterialsShortList getListByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	ENServicesCost.checkENServicesCostOnNull(servicesCost);
    	ENServicesMaterialsFilter filter = new ENServicesMaterialsFilter();
    	filter.servicesCostRef.code = servicesCost.code;
    	return this.getScrollableFilteredList(filter, 0, -1);
    }
    
    /**
     * 
     * Получить лист объектов {@link com.ksoe.techcard.valueobject.brief.TKCalcMaterialsShort} которые были удалены
     * из расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет для договора
     * @return {@link TKCalcMaterialsShortList} лист удаленных материалов
     * @throws PersistenceException
     */
    public TKCalcMaterialsShortList getListOfRemovedMaterialsByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	TKCalcMaterialsDAO calcMaterialsDao = new TKCalcMaterialsDAO(this.getConnection(), this.getUserProfile());
    	TKCalcMaterialsFilter calcMaterialsFilter = new TKCalcMaterialsFilter();
    	calcMaterialsFilter.calcCostRef.code = servicesCost.tkCalcCostRef.code;
    	calcMaterialsFilter.conditionSQL = String.format("not exists (select 1 from %s as sc1 where sc1.%s = %s)"
    			, ENServicesMaterials.tableName
    			, ENServicesMaterials.calcMaterialsRef_Field
    			, TKCalcMaterials.code_QFielld);
    	
    	return calcMaterialsDao.getScrollableFilteredList(calcMaterialsFilter, 0, -1);
    }
    
    public ENServicesMaterialsShortList getListOfMaterialsByENServicesCostWithChangedQuantity(ENServicesCost servicesCost) {
    	ENServicesMaterialsFilter filter = new ENServicesMaterialsFilter();
    	filter.servicesCostRef.code = servicesCost.code;
    	filter.conditionSQL = "";
    	return null;
    	
    }
    
    /**
     * 
     * Получить сумму материалов {@link ENServicesMaterialsShort } для заданного расчета договора {@link ENServicesCost}
     * 
     * @param servicesCost {@link ENServicesCost} расчет для договора
     * @throws PersistenceException
     */
    public BigDecimal getSumByENServicesCost(ENServicesCost servicesCost) throws PersistenceException {
    	BigDecimal result = new BigDecimal(0).setScale(2, BigDecimal.ROUND_HALF_UP);
    	ENServicesMaterialsShortList list = this.getListByENServicesCost(servicesCost);
    	for(ENServicesMaterialsShort material : list.list) result = result.add(material.sumGen);
    	return result;
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
    
	
	public ENServicesMaterialsShortList getScrollableFilteredList(ENServicesMaterials aFilterObject, String anCondition, String anOrderBy, int fromPosition, int quantity, Vector<? extends Object> aBindObjects) throws PersistenceException {
		ENServicesMaterialsShortList result = new ENServicesMaterialsShortList();
		ENServicesMaterialsShort anObject;
		result.list = new Vector<ENServicesMaterialsShort>();

		String selectStr;
		Connection connection = getConnection();
		PreparedStatement statement = null;
		ResultSet  set = null;
		String whereStr = "";
		String condition = processCondition(anCondition);
		String orderBy = processCondition(anOrderBy);

		if(orderBy.length() == 0) {
			orderBy = "ENSERVICESMATERIALS.CODE";
		}

		if(quantity < 0) {
			quantity = Integer.MAX_VALUE/2;
		}

		if(getUserProfile() == null) {
			throw new PersistenceException("Internal Error (User Profile Is Undefined)");
		}

		selectStr = "SELECT "+
			"ENSERVICESMATERIALS.CODE"+
			",ENSERVICESMATERIALS.MATERIALNAME"+
			",ENSERVICESMATERIALS.MEASUREUNITNAME"+
			",ENSERVICESMATERIALS.PRICEGEN"+
			",ENSERVICESMATERIALS.COUNTGEN"+
			",ENSERVICESMATERIALS.SUMGEN"+
			", ENSERVICESCOST.CODE " +
			", ENSERVICESCOST.DATEGEN " +
			", ENSERVICESCOST.COUNTGEN " +
			", ENSERVICESCOST.CALCULATIONCOST " +
			", ENSERVICESCOST.COSTWITHOUTVAT " +
			", ENSERVICESCOST.COSTVAT " +
			", ENSERVICESCOST.COSTWITHVAT " +
			", TKCALCMATERIALS.CODE " +
			", TKMATERIALS.CODE " +
			", TKMATERIALS.NAME " +
			", TKMATERIALS.COST " +
			", TKMATERIALS.DELIVERYDATE " +
			", TKMATERIALS.NUMKATALOG " +
			", TKMATERIALS.IDENTID " +
			", TKTECHCARD.CODE " +
			", TKTECHCARD.TECHKARTNUMBER " +
			", TKTECHCARD.NAME " +
			", TKTECHCARD.SAFETY " +
			", TKTECHCARD.DATECREATION " +
			", TKTECHCARD.DATEFROM " +
			", TKTECHCARD.DATETO " +
			", TKTECHCARD.WORKCONDITIONS " +
		" FROM ENSERVICESMATERIALS " +
			" LEFT JOIN ENSERVICESCOST on ENSERVICESCOST.CODE = ENSERVICESMATERIALS.SERVICESCOSTREFCODE "+
			" LEFT JOIN TKCALCMATERIALS on TKCALCMATERIALS.CODE = ENSERVICESMATERIALS.CALCMATERIALSREFCODE "+
			" LEFT JOIN TKMATERIALS on TKMATERIALS.CODE = ENSERVICESMATERIALS.MATERIALREFCODE "+
			" LEFT JOIN TKTECHCARD on TKTECHCARD.CODE = ENSERVICESMATERIALS.KARTAREFCODE "+
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
				anObject = new ENServicesMaterialsShort();
				anObject.code = set.getInt(1);
				if ( set.wasNull() ) {
					anObject.code = Integer.MIN_VALUE;
				}
				anObject.materialName = set.getString(2);
				anObject.measureUnitName = set.getString(3);
				anObject.priceGen = set.getBigDecimal(4);
				if(anObject.priceGen != null) {
					anObject.priceGen = anObject.priceGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.countGen = set.getBigDecimal(5);
				if(anObject.countGen != null) {
					anObject.countGen = anObject.countGen.setScale(6,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.sumGen = set.getBigDecimal(6);
				if(anObject.sumGen != null) {
					anObject.sumGen = anObject.sumGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}

				anObject.servicesCostRefCode = set.getInt(7);
				if(set.wasNull()) {
					anObject.servicesCostRefCode = Integer.MIN_VALUE;
				}
				anObject.servicesCostRefDateGen = set.getDate(8);
				anObject.servicesCostRefCountGen = set.getBigDecimal(9);
				if(anObject.servicesCostRefCountGen != null) {
					anObject.servicesCostRefCountGen = anObject.servicesCostRefCountGen.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCalculationCost = set.getBigDecimal(10);
				if(anObject.servicesCostRefCalculationCost != null) {
					anObject.servicesCostRefCalculationCost = anObject.servicesCostRefCalculationCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithoutVAT = set.getBigDecimal(11);
				if(anObject.servicesCostRefCostWithoutVAT != null) {
					anObject.servicesCostRefCostWithoutVAT = anObject.servicesCostRefCostWithoutVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostVAT = set.getBigDecimal(12);
				if(anObject.servicesCostRefCostVAT != null) {
					anObject.servicesCostRefCostVAT = anObject.servicesCostRefCostVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.servicesCostRefCostWithVAT = set.getBigDecimal(13);
				if(anObject.servicesCostRefCostWithVAT != null) {
					anObject.servicesCostRefCostWithVAT = anObject.servicesCostRefCostWithVAT.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.calcMaterialsRefCode = set.getInt(14);
				if(set.wasNull()) {
					anObject.calcMaterialsRefCode = Integer.MIN_VALUE;
				}
				anObject.materialRefCode = set.getInt(15);
				if(set.wasNull()) {
					anObject.materialRefCode = Integer.MIN_VALUE;
				}
				anObject.materialRefName = set.getString(16);
				anObject.materialRefCost = set.getBigDecimal(17);
				if(anObject.materialRefCost != null) {
					anObject.materialRefCost = anObject.materialRefCost.setScale(2,java.math.BigDecimal.ROUND_HALF_UP);
				}
				anObject.materialRefDeliveryDate = set.getInt(18);
				if(set.wasNull()) {
					anObject.materialRefDeliveryDate = Integer.MIN_VALUE;
				}
				anObject.materialRefNumkatalog = set.getString(19);
				anObject.materialRefIdentid = set.getString(20);
				anObject.kartaRefCode = set.getInt(21);
				if(set.wasNull()) {
					anObject.kartaRefCode = Integer.MIN_VALUE;
				}
				anObject.kartaRefTechKartNumber = set.getString(22);
				anObject.kartaRefName = set.getString(23);
				anObject.kartaRefSafety = set.getString(24);
				anObject.kartaRefDateCreation = set.getDate(25);
				anObject.kartaRefDateFrom = set.getDate(26);
				anObject.kartaRefDateTo = set.getDate(27);
				anObject.kartaRefWorkconditions = set.getString(28);

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
	
	

} // end of ENServicesMaterialsDAO
