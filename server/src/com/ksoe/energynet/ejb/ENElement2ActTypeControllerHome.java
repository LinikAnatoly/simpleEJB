
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2ActType;
 *
 */

public interface ENElement2ActTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2ActTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}