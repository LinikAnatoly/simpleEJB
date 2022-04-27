
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActPostingForm;
 *
 */

public interface ENActPostingFormControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActPostingFormController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}