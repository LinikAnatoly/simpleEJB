
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for FinRenCode2FinRenCodeBase;
 *
 */

public interface FinRenCode2FinRenCodeBaseControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.FinRenCode2FinRenCodeBaseController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}