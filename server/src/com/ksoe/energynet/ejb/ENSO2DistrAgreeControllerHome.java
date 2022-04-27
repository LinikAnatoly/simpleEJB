
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSO2DistrAgree;
 *
 */

public interface ENSO2DistrAgreeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSO2DistrAgreeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}