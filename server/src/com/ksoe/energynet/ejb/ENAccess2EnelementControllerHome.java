
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAccess2Enelement;
 *
 */

public interface ENAccess2EnelementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAccess2EnelementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}