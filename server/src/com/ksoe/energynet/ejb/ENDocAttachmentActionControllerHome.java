
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachmentAction;
 *
 */

public interface ENDocAttachmentActionControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachmentActionController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}