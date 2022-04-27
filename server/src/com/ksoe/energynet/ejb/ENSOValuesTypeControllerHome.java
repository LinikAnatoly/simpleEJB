
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOValuesType;
 *
 */

public interface ENSOValuesTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOValuesTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}