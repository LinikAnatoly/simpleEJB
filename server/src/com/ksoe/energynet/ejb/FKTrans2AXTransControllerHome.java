
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for FKTrans2AXTrans;
 *
 */

public interface FKTrans2AXTransControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.FKTrans2AXTransController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}