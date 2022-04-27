
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRegForSupplierStatus;
 *
 */

public interface ENRegForSupplierStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRegForSupplierStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}