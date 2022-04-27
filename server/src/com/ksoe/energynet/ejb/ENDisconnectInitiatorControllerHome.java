
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDisconnectInitiator;
 *
 */

public interface ENDisconnectInitiatorControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDisconnectInitiatorController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}