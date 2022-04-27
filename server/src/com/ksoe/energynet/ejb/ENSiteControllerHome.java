
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSite;
 *
 */

public interface ENSiteControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSiteController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}