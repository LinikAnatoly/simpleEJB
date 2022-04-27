
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding2ServicesObject;
 *
 */

public interface ENBuilding2ServicesObjectControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuilding2ServicesObjectController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}