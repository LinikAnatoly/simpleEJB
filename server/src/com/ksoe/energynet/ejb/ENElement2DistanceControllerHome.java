
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2Distance;
 *
 */

public interface ENElement2DistanceControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2DistanceController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}