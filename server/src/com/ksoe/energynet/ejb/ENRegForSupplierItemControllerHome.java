
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRegForSupplierItem;
 *
 */

public interface ENRegForSupplierItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRegForSupplierItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}