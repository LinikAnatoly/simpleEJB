
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRegForSupplierType;
 *
 */

public interface ENRegForSupplierTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRegForSupplierTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}