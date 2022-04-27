
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWorkOrderBytStatus;
 *
 */

public interface ENWorkOrderBytStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWorkOrderBytStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}