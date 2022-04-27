
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

import com.ksoe.authorization.util.AuthorizationJNDINames;

/**
 * EJB Controller for FINCurrency;
 *
 */

import com.ksoe.energynet.ejb.generated.FINCurrencyControllerEJBGen;
import com.ksoe.energynet.logic.FinanceLogic;
import com.ksoe.energynet.valueobject.FINCurrency;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.persistence.exception.SystemException;

public class FINCurrencyControllerEJB extends
		FINCurrencyControllerEJBGen {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public int add(FINCurrency object) {
		try {
			FinanceLogic financeLogic = new FinanceLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			financeLogic.checkFINCurrencyBeforeSaving(object);
			return super.add(object);
			
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} finally {
			
		}

	}
	
	public void save(FINCurrency object) {
		try {
			FinanceLogic financeLogic = new FinanceLogic(getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());
			financeLogic.checkFINCurrencyBeforeSaving(object);
			super.save(object);
		} catch (PersistenceException e) {
			throw new SystemException(e);
		} catch (DatasourceConnectException e) {
			throw new SystemException(e);
		} finally {
			
		}
	}

	public FINCurrencyControllerEJB() {
	}

} // end of EJB Controller for FINCurrency