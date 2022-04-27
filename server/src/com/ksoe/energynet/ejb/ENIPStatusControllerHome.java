
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPStatus;
 *
 */

public interface ENIPStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}