
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDistributionAgree;
 *
 */

public interface ENDistributionAgreeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDistributionAgreeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}