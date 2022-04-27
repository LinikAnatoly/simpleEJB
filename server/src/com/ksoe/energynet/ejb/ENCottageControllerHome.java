
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCottage;
 *
 */

public interface ENCottageControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCottageController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}