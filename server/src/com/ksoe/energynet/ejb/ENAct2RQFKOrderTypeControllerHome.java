
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2RQFKOrderType;
 *
 */

public interface ENAct2RQFKOrderTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2RQFKOrderTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}