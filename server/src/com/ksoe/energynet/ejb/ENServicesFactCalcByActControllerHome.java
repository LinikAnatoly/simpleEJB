
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesFactCalcByAct;
 *
 */

public interface ENServicesFactCalcByActControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesFactCalcByActController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}