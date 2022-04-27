
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachment2ENElement;
 *
 */

public interface ENDocAttachment2ENElementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachment2ENElementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}