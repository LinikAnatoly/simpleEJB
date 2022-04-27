
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesObject2Prov;
 *
 */

public interface ENServicesObject2ProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesObject2ProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}