
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENContractType;
 *
 */

public interface ENContractTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENContractTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}