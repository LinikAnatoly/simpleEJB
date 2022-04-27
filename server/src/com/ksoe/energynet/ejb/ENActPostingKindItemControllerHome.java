
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActPostingKindItem;
 *
 */

public interface ENActPostingKindItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActPostingKindItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}