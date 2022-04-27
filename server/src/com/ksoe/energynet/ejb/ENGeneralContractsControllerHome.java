
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENGeneralContracts;
 *
 */

public interface ENGeneralContractsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENGeneralContractsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}