
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENMolFuelMotionType;
 *
 */

public interface ENMolFuelMotionTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENMolFuelMotionTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}