
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2ENElementType;
 *
 */

public interface ENElement2ENElementTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2ENElementTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}