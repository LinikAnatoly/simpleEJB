
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOValues;
 *
 */

public interface ENSOValuesControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOValuesController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}