
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuilding2ENact;
 *
 */

public interface ENBuilding2ENactControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuilding2ENactController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}