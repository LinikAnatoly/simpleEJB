
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2OSTable;
 *
 */

public interface ENAct2OSTableControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2OSTableController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}