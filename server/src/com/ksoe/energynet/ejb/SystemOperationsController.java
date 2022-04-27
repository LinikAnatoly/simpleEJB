
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

public interface SystemOperationsController extends javax.ejb.EJBObject {
	public static final String JNDI_NAME = "ksoe/energynet/SystemOperationsController";

	/**
	 * отправка расчетных листов дл€ сотрудников на e-mail
	 */
	public void sendingPaySheetsForEmployees() throws java.rmi.RemoteException;


	/**
	 * перезагрузка сервисов - EnergyNet
	 *
	 * @throws java.rmi.RemoteException
	 */
	public void restartInspectPlanWorkService() throws java.rmi.RemoteException;


	/**
	 * перезагрузка сервисов - Billing
	 *
	 * @throws java.rmi.RemoteException
	 */
	public void restartBillingService() throws java.rmi.RemoteException;

}