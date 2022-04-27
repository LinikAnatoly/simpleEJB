
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSealStatus;
 *
 */

public interface SCSealStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSealStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}