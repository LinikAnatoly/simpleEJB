
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesHumenSalary;
 *
 */

public interface ENServicesHumenSalaryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesHumenSalaryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}