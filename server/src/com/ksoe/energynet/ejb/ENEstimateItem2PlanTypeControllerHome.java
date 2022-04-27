
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimateItem2PlanType;
 *
 */

public interface ENEstimateItem2PlanTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENEstimateItem2PlanTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}