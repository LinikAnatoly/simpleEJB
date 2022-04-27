
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActIncomeServices;
 *
 */

public interface ENActIncomeServicesControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActIncomeServicesController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}