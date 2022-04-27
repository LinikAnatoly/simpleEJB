
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachment;
 *
 */

public interface ENDocAttachmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}