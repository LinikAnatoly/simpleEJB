
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOBill;
 *
 */

public interface ENSOBillControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOBillController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}