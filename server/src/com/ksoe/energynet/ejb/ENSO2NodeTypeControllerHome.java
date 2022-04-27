
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSO2NodeType;
 *
 */

public interface ENSO2NodeTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSO2NodeTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}