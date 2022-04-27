
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSeal;
 *
 */

public interface SCSealControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSealController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}