
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOContract;
 *
 */

public interface ENSOContractControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOContractController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}