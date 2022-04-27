
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding2OSData;
 *
 */

public interface ENBuilding2OSDataControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuilding2OSDataController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}