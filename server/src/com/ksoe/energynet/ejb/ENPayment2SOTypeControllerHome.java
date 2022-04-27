
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPayment2SOType;
 *
 */

public interface ENPayment2SOTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPayment2SOTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}