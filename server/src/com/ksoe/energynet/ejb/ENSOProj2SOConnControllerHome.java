
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOProj2SOConn;
 *
 */

public interface ENSOProj2SOConnControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOProj2SOConnController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}