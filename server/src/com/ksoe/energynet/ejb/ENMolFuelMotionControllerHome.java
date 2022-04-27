
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENMolFuelMotion;
 *
 */

public interface ENMolFuelMotionControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENMolFuelMotionController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}