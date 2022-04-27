
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelInvResult;
 *
 */

public interface ENFuelInvResultControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelInvResultController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}