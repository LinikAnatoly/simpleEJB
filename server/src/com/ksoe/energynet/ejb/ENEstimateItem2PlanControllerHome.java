
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimateItem2Plan;
 *
 */

public interface ENEstimateItem2PlanControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENEstimateItem2PlanController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}