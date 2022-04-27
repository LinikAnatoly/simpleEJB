
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENGPSTrackerHistory;
 *
 */

public interface ENGPSTrackerHistoryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENGPSTrackerHistoryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}