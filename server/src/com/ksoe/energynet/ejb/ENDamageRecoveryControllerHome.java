
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDamageRecovery;
 *
 */

public interface ENDamageRecoveryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDamageRecoveryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}