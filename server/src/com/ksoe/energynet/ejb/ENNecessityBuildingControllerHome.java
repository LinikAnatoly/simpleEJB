
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENNecessityBuilding;
 *
 */

public interface ENNecessityBuildingControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENNecessityBuildingController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}