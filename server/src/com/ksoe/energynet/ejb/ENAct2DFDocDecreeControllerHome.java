
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2DFDocDecree;
 *
 */

public interface ENAct2DFDocDecreeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2DFDocDecreeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}