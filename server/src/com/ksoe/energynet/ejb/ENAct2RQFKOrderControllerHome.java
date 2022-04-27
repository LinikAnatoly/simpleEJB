
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2RQFKOrder;
 *
 */

public interface ENAct2RQFKOrderControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2RQFKOrderController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}