
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActFailureReason;
 *
 */

public interface ENActFailureReasonControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActFailureReasonController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}