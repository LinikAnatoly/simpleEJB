
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding2Commission;
 *
 */

public interface ENBuilding2CommissionControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuilding2CommissionController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}