
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachmentType;
 *
 */

public interface ENDocAttachmentTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachmentTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}