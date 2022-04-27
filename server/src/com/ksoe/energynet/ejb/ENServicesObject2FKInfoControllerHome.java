
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesObject2FKInfo;
 *
 */

public interface ENServicesObject2FKInfoControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesObject2FKInfoController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}