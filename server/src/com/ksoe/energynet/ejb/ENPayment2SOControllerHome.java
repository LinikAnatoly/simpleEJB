
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPayment2SO;
 *
 */

public interface ENPayment2SOControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPayment2SOController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}