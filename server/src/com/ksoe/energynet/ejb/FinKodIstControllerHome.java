
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for FinKodIst;
 *
 */

public interface FinKodIstControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.FinKodIstController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}