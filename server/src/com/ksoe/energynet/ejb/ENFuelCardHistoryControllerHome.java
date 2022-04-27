
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelCardHistory;
 *
 */

public interface ENFuelCardHistoryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelCardHistoryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}