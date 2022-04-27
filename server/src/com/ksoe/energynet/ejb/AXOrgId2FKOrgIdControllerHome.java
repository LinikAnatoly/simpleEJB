
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for AXOrgId2FKOrgId;
 *
 */

public interface AXOrgId2FKOrgIdControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.AXOrgId2FKOrgIdController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}