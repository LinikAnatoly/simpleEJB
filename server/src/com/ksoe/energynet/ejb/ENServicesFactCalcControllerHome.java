
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesFactCalc;
 *
 */

public interface ENServicesFactCalcControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesFactCalcController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}