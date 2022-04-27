
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENInvestProgram2Plan;
 *
 */

public interface ENInvestProgram2PlanControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENInvestProgram2PlanController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}