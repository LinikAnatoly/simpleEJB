
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAttachment2ServicesKind;
 *
 */

public interface ENAttachment2ServicesKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAttachment2ServicesKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}