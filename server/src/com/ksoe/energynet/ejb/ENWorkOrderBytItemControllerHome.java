
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWorkOrderBytItem;
 *
 */

public interface ENWorkOrderBytItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWorkOrderBytItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}