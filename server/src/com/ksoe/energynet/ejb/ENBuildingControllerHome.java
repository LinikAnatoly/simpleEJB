
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding;
 *
 */

public interface ENBuildingControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuildingController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}