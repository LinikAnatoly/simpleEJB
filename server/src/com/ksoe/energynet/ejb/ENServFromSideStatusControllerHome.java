
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServFromSideStatus;
 *
 */

public interface ENServFromSideStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServFromSideStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}