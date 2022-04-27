
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2DFDoc;
 *
 */

public interface ENAct2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}