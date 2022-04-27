
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachmentStatus;
 *
 */

public interface ENDocAttachmentStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachmentStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}