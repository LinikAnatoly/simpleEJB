
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTCOValuesType;
 *
 */

public interface ENTCOValuesTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTCOValuesTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}