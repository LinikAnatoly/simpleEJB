
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import java.math.BigDecimal;
import java.util.Arrays;
import java.util.Collection;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENServicesCostDAO;

/**
 * EJB Controller for ENServicesCost;
 *
 */

import com.ksoe.energynet.ejb.generated.ENServicesCostControllerEJBGen;
import com.ksoe.energynet.logic.PlanWorkItemLogic;
import com.ksoe.energynet.logic.ServicesCalculatorLogic;
import com.ksoe.energynet.valueobject.ENPlanWork;
import com.ksoe.energynet.valueobject.ENServicesCost;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENServicesCostControllerEJB extends
		ENServicesCostControllerEJBGen {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ENServicesCostControllerEJB() {
	}
	
	public int add(ENServicesCost servicesCost, BigDecimal distance) {
		return this.add(servicesCost, distance, null);
	}
	
	public int add(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity) {
		try {			
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			return servicesCalculatorLogic.evaluateServicesCost(servicesCost, distance, machineHoursQuantity, false);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENServicesCost%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void save(ENServicesCost servicesCost, BigDecimal distance) {
		this.save(servicesCost, distance, null);
	}
	
	public void save(ENServicesCost servicesCost, BigDecimal distance
    		, BigDecimal machineHoursQuantity) {
		try {
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			servicesCalculatorLogic.evaluateServicesCost(servicesCost, distance, machineHoursQuantity);	
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int[] anObjectCodes) {
		try {
			ENServicesCostDAO servicesCostDao = new ENServicesCostDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			ServicesCalculatorLogic servicesCalculatorLogic = new ServicesCalculatorLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			for(int anObjectCode : anObjectCodes) {
				ENServicesCost servicesCost = servicesCostDao.getObject(anObjectCode);
				servicesCalculatorLogic.removeServicesCost(servicesCost);				
			}

		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}
	
	public void remove(int anObjectCode) {
		this.remove(new int[] {anObjectCode});
	}
	
	public int generatePlans(ENServicesCost[] servicesCosts, boolean isGenerate) {
		return this.generatePlans(servicesCosts,  null, isGenerate);
	}
	
	public int generatePlans(ENServicesCost[] servicesCosts, ENPlanWork planTemplate, boolean isGenerate) {
		try {
			int planCode = Integer.MIN_VALUE;

			PlanWorkItemLogic logic = new PlanWorkItemLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE)
					, getUserProfile());
			
			Collection<ENServicesCost> coll = Arrays.asList(servicesCosts);
			if(isGenerate) {
				ENPlanWork plan = logic.generatePlanWithWorksForENServicesCost(coll, planTemplate);
				planCode = plan.code;
			} else {
				logic.undoGeneratePlanWithWorksForENServicesCost(coll);
			}
			
			return planCode;
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENServicesCost