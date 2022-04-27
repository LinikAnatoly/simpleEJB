
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPhotoFact;
 *
 */

public interface ENPhotoFactControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPhotoFactController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}