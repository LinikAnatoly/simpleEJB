
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for FINAccountType;
 *
 */

public interface FINAccountTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.FINAccountTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}