
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActProj2OZ2Date;
 *
 */

public interface ENActProj2OZ2DateControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActProj2OZ2DateController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}