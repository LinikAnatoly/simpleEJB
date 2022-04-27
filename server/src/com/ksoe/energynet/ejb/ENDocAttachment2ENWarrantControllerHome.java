
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachment2ENWarrant;
 *
 */

public interface ENDocAttachment2ENWarrantControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachment2ENWarrantController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}