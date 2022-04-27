
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesObjectCalcType;
 *
 */

public interface ENServicesObjectCalcTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesObjectCalcTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}