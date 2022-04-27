
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENInvestObjectType;
 *
 */

public interface ENInvestObjectTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENInvestObjectTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}