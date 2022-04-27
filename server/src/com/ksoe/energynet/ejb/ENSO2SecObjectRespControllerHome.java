
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSO2SecObjectResp;
 *
 */

public interface ENSO2SecObjectRespControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSO2SecObjectRespController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}