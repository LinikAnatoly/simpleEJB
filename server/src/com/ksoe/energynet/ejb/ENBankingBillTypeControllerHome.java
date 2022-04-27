
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBankingBillType;
 *
 */

public interface ENBankingBillTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBankingBillTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}