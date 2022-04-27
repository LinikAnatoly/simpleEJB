
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSO2Node;
 *
 */

public interface ENSO2NodeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSO2NodeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}