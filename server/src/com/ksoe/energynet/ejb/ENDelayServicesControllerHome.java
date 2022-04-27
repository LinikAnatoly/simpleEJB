
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDelayServices;
 *
 */

public interface ENDelayServicesControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDelayServicesController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}