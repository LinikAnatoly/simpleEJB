
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActPostingKind;
 *
 */

public interface ENActPostingKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActPostingKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}