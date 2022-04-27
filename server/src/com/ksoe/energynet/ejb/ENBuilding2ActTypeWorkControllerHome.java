
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding2ActTypeWork;
 *
 */

public interface ENBuilding2ActTypeWorkControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuilding2ActTypeWorkController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}