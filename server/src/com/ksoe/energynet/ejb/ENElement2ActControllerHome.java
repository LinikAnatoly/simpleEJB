
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2Act;
 *
 */

public interface ENElement2ActControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2ActController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}