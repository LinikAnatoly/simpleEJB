
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanXqtnHistory;
 *
 */

public interface ENPlanXqtnHistoryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanXqtnHistoryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}