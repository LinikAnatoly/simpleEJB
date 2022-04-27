
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActPostingTypeSum;
 *
 */

public interface ENActPostingTypeSumControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActPostingTypeSumController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}