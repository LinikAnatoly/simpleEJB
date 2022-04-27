
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttType2Action;
 *
 */

public interface ENDocAttType2ActionControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttType2ActionController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}