
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCustomerWarrant;
 *
 */

public interface ENCustomerWarrantControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCustomerWarrantController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}