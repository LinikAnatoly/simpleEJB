
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for CNActsMovement;
 *
 */

public interface CNActsMovementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.CNActsMovementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}