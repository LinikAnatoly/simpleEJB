
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSO2SecObject;
 *
 */

public interface ENSO2SecObjectControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSO2SecObjectController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}