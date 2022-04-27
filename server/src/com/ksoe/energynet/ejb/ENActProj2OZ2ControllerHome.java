
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActProj2OZ2;
 *
 */

public interface ENActProj2OZ2ControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActProj2OZ2Controller create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}