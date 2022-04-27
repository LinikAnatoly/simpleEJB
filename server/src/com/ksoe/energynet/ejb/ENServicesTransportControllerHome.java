
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesTransport;
 *
 */

public interface ENServicesTransportControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesTransportController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}