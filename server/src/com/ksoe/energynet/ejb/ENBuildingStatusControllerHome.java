
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuildingStatus;
 *
 */

public interface ENBuildingStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuildingStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}