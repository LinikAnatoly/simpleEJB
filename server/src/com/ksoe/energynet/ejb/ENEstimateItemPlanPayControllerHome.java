
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimateItemPlanPay;
 *
 */

public interface ENEstimateItemPlanPayControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENEstimateItemPlanPayController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}