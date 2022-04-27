
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWarrantType;
 *
 */

public interface ENWarrantTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWarrantTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}