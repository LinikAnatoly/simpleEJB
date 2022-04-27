
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachmentServer;
 *
 */

public interface ENDocAttachmentServerControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachmentServerController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}