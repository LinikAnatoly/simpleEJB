
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for FKTrans2AXTransItem;
 *
 */

public interface FKTrans2AXTransItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.FKTrans2AXTransItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}