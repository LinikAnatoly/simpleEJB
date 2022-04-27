
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENPlanGraphFinancingFuel;
 *
 */

import java.math.BigDecimal;

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENDepartmentDAO;
import com.ksoe.energynet.dataminer.ENPlanGraphFinancingFuelDAO;
import com.ksoe.energynet.dataminer.ENPlanGraphFinancingFuelItemDAO;
import com.ksoe.energynet.ejb.generated.ENPlanGraphFinancingFuelControllerEJBGen;
import com.ksoe.energynet.valueobject.ENDepartment;
import com.ksoe.energynet.valueobject.ENDepartmentType;
import com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel;
import com.ksoe.energynet.valueobject.filter.ENDepartmentFilter;
import com.ksoe.energynet.valueobject.filter.ENPlanGraphFinancingFuelFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENPlanGraphFinancingFuelControllerEJB extends
		ENPlanGraphFinancingFuelControllerEJBGen {

	public ENPlanGraphFinancingFuelControllerEJB() {
	}
	
	
	/* ENPlanGraphFinancingFuel. Добавить */
	public int add(ENPlanGraphFinancingFuel object) {
		try {
			ENPlanGraphFinancingFuelDAO objectDAO = new ENPlanGraphFinancingFuelDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENPlanGraphFinancingFuelItemDAO planGraphItemDao = new ENPlanGraphFinancingFuelItemDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			ENDepartmentDAO departmentDao = new ENDepartmentDAO(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			
			if (object.fuelTypeRef == null){
				throw new EnergyproSystemException("Не вказано тип палива!!!");
			} else 
				if (object.fuelTypeRef.code == Integer.MIN_VALUE){
					throw new EnergyproSystemException("Не вказано тип палива!!!");
				}
			
			ENPlanGraphFinancingFuelFilter plgraphFilter = new ENPlanGraphFinancingFuelFilter();
			        plgraphFilter.monthGen = object.monthGen;
					plgraphFilter.yearGen = object.yearGen;					
					plgraphFilter.fuelTypeRef.code = object.fuelTypeRef.code;
					
			int[] plgraphArr = objectDAO.getFilteredCodeArray(plgraphFilter, 0, -1);
			
			if (plgraphArr.length > 0 ) {
				throw new EnergyproSystemException("Запис по місяцю, року та типу палива вже заведена раніше!!!");
			}
			
			// Проверка на то, чтобы коэффициенты равнялись 3
			if(!object.koefDekada1.add(object.koefDekada2).add(object.koefDekada3).equals(new BigDecimal(3))) {
				throw new EnergyproSystemException("Сума коефіціентів повина дорівнюватись 3");
			}
			
			ENDepartmentFilter depFilter = new ENDepartmentFilter();
			//depFilter.parentRef.code = ENDepartment.ENDEPARTMENT_REM;
			depFilter.typeRef.code = ENDepartmentType.DEPARTMENT;
			depFilter.conditionSQL = ENDepartment.parentRef_QFielld + " in (" + ENDepartment.ENDEPARTMENT_REM + ")";

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

	/* ENPlanGraphFinancingFuel. Удалить */
	public void remove(int code) {
		try {
			ENPlanGraphFinancingFuelDAO objectDAO = new ENPlanGraphFinancingFuelDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));

			objectDAO.remove(code);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't remove {%com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

   	/* ENPlanGraphFinancingFuel. Изменить */
	public void save(ENPlanGraphFinancingFuel object) {
		try {
			ENPlanGraphFinancingFuelDAO objectDAO = new ENPlanGraphFinancingFuelDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			if (object.fuelTypeRef == null){
				throw new EnergyproSystemException("Не вказано тип палива!!!");
			} else 
				if (object.fuelTypeRef.code == Integer.MIN_VALUE){
					throw new EnergyproSystemException("Не вказано тип палива!!!");
				}
			
			ENPlanGraphFinancingFuelFilter plgraphFilter = new ENPlanGraphFinancingFuelFilter();
			        plgraphFilter.monthGen = object.monthGen;
					plgraphFilter.yearGen = object.yearGen;					
					plgraphFilter.fuelTypeRef.code = object.fuelTypeRef.code;
					plgraphFilter.conditionSQL = " enplangraphfinancingfl.code <>  " +  object.code;
					
			int[] plgraphArr = objectDAO.getFilteredCodeArray(plgraphFilter, 0, -1);
			
			if (plgraphArr.length > 0 ) {
				throw new EnergyproSystemException("Запис по місяцю, року та типу палива вже заведена раніше!!!");
			}
			
			// Проверка на то, чтобы коэффициенты равнялись 3
			if(!object.koefDekada1.add(object.koefDekada2).add(object.koefDekada3).equals(new BigDecimal(3))) {
				throw new EnergyproSystemException("Сума коефіціентів повина дорівнюватись 3");
			}
						
		    objectDAO.save(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't save {%com.ksoe.energynet.valueobject.ENPlanGraphFinancingFuel%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for ENPlanGraphFinancingFuel