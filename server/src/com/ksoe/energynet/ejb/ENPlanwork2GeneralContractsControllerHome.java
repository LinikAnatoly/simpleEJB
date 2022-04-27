
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanwork2GeneralContracts;
 *
 */

public interface ENPlanwork2GeneralContractsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanwork2GeneralContractsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}