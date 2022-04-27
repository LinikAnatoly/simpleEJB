
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBankingDetails;
 *
 */

public interface ENBankingDetailsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBankingDetailsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}