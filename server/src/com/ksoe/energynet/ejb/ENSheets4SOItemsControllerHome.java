
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSheets4SOItems;
 *
 */

public interface ENSheets4SOItemsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSheets4SOItemsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}