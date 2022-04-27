
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Controller for ENServicesObject2FKInfo;
 *
 */

import com.ksoe.authorization.util.AuthorizationJNDINames;
import com.ksoe.energynet.dataminer.ENServicesObject2FKInfoDAO;
import com.ksoe.energynet.ejb.generated.ENServicesObject2FKInfoControllerEJBGen;
import com.ksoe.energynet.valueobject.ENServicesObject2FKInfo;
import com.ksoe.energynet.valueobject.filter.ENServicesObject2FKInfoFilter;
import com.ksoe.energypro.exception.EnergyproSystemException;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class ENServicesObject2FKInfoControllerEJB extends
		ENServicesObject2FKInfoControllerEJBGen {

	public ENServicesObject2FKInfoControllerEJB() {
	}
	
	/* ENServicesObject2FKInfo. Добавить */
	public int add(ENServicesObject2FKInfo object) {
		try {
			ENServicesObject2FKInfoDAO objectDAO = new ENServicesObject2FKInfoDAO(
					getUserProfile(),
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE));
			
			ENServicesObject2FKInfoFilter so2finfFilter = new ENServicesObject2FKInfoFilter();
			//so2finfFilter.isIncomeAct = object.isIncomeAct;
			//so2finfFilter.servicesObjectKindFKRef.code = object.servicesObjectKindFKRef.code;
			so2finfFilter.servicesObjectRef.code = object.servicesObjectRef.code;
			
			if (object.servicesObjectRef.code == Integer.MIN_VALUE){
				throw new EnergyproSystemException(" Не вказано послугу !!!");
			}
			
			if (object.servicesObjectKindFKRef.code == Integer.MIN_VALUE){
				throw new EnergyproSystemException(" Не вказано вид послуги на сторону(шаблон проводок)!!!");
			}
			
			int[] so2finfArr = objectDAO.getFilteredCodeArray(so2finfFilter, 0, -1);
			if (so2finfArr.length > 0 ){
				throw new EnergyproSystemException("Для послуги вже є запис з інормацією для проводок по актам виконаних робіт ФК !!!");
			}

		    return objectDAO.add(object);
		} catch (DatasourceConnectException e) {
			throw new SystemException(
					"Can't add {%com.ksoe.energynet.valueobject.ENServicesObject2FKInfo%} object.",
					e);
		} catch (PersistenceException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}

} // end of EJB Controller for ENServicesObject2FKInfo