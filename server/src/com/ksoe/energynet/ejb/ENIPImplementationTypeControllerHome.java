
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPImplementationType;
 *
 */

public interface ENIPImplementationTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPImplementationTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}