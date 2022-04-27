
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSettleType;
 *
 */

public interface ENSettleTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSettleTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}