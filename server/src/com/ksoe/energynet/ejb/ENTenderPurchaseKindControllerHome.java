
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTenderPurchaseKind;
 *
 */

public interface ENTenderPurchaseKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTenderPurchaseKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}