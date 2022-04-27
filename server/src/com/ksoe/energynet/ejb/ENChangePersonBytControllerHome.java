
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENChangePersonByt;
 *
 */

public interface ENChangePersonBytControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENChangePersonBytController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}