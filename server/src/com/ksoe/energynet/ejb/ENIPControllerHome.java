
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIP;
 *
 */

public interface ENIPControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}