
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPFinancing;
 *
 */

public interface ENIPFinancingControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPFinancingController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}