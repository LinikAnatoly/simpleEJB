
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSettings;
 *
 */

public interface ENSettingsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSettingsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}