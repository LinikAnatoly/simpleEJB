
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesCost;
 *
 */

public interface ENServicesCostControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesCostController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}