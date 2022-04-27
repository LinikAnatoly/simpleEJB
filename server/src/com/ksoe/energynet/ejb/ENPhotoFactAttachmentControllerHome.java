
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPhotoFactAttachment;
 *
 */

public interface ENPhotoFactAttachmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPhotoFactAttachmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}