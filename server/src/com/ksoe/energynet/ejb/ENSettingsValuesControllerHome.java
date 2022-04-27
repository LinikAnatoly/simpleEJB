
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSettingsValues;
 *
 */

public interface ENSettingsValuesControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSettingsValuesController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}