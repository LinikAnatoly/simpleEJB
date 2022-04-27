
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2FinKodIst;
 *
 */

public interface ENAct2FinKodIstControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2FinKodIstController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}