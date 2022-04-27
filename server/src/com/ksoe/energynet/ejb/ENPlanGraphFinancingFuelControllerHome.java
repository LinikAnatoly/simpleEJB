
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanGraphFinancingFuel;
 *
 */

public interface ENPlanGraphFinancingFuelControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanGraphFinancingFuelController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}