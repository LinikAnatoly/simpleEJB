
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSigner;
 *
 */

public interface ENSignerControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSignerController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}