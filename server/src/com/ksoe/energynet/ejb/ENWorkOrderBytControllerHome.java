
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWorkOrderByt;
 *
 */

public interface ENWorkOrderBytControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWorkOrderBytController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}