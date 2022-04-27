
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRegForSupplier;
 *
 */

public interface ENRegForSupplierControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRegForSupplierController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}