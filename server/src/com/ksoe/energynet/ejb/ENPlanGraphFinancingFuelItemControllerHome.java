
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanGraphFinancingFuelItem;
 *
 */

public interface ENPlanGraphFinancingFuelItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanGraphFinancingFuelItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}