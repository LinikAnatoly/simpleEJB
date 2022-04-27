
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2ENElement;
 *
 */

public interface ENElement2ENElementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2ENElementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}