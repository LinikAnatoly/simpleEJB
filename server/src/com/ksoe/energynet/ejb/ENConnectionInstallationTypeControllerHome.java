
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionInstallationType;
 *
 */

public interface ENConnectionInstallationTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENConnectionInstallationTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}