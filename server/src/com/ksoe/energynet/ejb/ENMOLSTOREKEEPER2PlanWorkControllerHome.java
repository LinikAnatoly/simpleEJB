
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENMOLSTOREKEEPER2PlanWork;
 *
 */

public interface ENMOLSTOREKEEPER2PlanWorkControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENMOLSTOREKEEPER2PlanWorkController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}