
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCoefficientExecPlan;
 *
 */

public interface ENCoefficientExecPlanControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCoefficientExecPlanController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}