
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCountersStateVerification;
 *
 */

public interface ENCountersStateVerificationControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCountersStateVerificationController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}