
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSealType;
 *
 */

public interface SCSealTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSealTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}