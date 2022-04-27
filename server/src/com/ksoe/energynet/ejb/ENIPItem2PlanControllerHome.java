
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPItem2Plan;
 *
 */

public interface ENIPItem2PlanControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPItem2PlanController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}