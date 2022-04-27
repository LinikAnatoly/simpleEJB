
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesObjectKindFK;
 *
 */

public interface ENServicesObjectKindFKControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesObjectKindFKController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}