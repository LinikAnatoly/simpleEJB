
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelInvResultType;
 *
 */

public interface ENFuelInvResultTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelInvResultTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}