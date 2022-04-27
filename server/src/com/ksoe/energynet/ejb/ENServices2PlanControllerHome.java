
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServices2Plan;
 *
 */

public interface ENServices2PlanControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServices2PlanController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}