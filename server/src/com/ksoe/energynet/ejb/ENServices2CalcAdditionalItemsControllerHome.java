
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServices2CalcAdditionalItems;
 *
 */

public interface ENServices2CalcAdditionalItemsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServices2CalcAdditionalItemsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}