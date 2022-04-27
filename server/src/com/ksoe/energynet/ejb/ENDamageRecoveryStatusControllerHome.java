
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDamageRecoveryStatus;
 *
 */

public interface ENDamageRecoveryStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDamageRecoveryStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}