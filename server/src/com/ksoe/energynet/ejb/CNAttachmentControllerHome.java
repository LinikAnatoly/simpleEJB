
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for CNAttachment;
 *
 */

public interface CNAttachmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.CNAttachmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}