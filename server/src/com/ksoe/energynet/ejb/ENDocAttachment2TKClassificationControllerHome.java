
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachment2TKClassification;
 *
 */

public interface ENDocAttachment2TKClassificationControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachment2TKClassificationController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}