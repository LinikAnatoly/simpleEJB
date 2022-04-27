
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for CNPack2Site;
 *
 */

public interface CNPack2SiteControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.CNPack2SiteController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}