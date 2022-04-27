
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

import com.ksoe.authorization.util.AuthorizationJNDINames;

/**
 * EJB Controller for SystemOperations;
 *
 */

import com.ksoe.energynet.ejb.generated.SystemOperationsControllerEJBGen;
import com.ksoe.energynet.logic.SystemOperationsLogic;
import com.ksoe.lla.persistence.exception.DatasourceConnectException;
import com.ksoe.lla.persistence.exception.SystemException;

public class SystemOperationsControllerEJB extends SystemOperationsControllerEJBGen {

	public SystemOperationsControllerEJB() {
	}


	/**
	 * отправка расчетных листов дл€ сотрудников на e-mail
	 */
	public void sendingPaySheetsForEmployees() {

		try {
			SystemOperationsLogic systemOperationsLogic = new SystemOperationsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			systemOperationsLogic.sendingPaySheetsForEmployees();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/**
	 * перезагрузка сервисов
	 *
	 * @throws java.rmi.RemoteException
	 */
	public void restartInspectPlanWorkService() {

		try {
			SystemOperationsLogic systemOperationsLogic = new SystemOperationsLogic(
					getConnection(AuthorizationJNDINames.ENERGYNET_DATASOURCE), getUserProfile());

			systemOperationsLogic.restartInspectPlanWorkService();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


	/**
	 * перезагрузка сервисов - Billing
	 *
	 * @throws java.rmi.RemoteException
	 */
	public void restartBillingService() {

		try {
			SystemOperationsLogic systemOperationsLogic = new SystemOperationsLogic(
					getConnection(AuthorizationJNDINames.ENERGY_DATASOURCE), getUserProfile());

			systemOperationsLogic.restartBillingService();

		} catch (DatasourceConnectException e) {
			throw new SystemException(e.getMessage(), e);
		} finally {
			closeConnection();
		}
	}


} // end of EJB Controller for SystemOperations