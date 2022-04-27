
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesContractStatus;
 *
 */

public interface ENServicesContractStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesContractStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}