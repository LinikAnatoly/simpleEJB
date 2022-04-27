
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPItem2Contract;
 *
 */

public interface ENIPItem2ContractControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPItem2ContractController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}