
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActFailure;
 *
 */

public interface ENActFailureControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActFailureController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}