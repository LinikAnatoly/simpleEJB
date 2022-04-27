
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2SCUsageInput;
 *
 */

public interface ENAct2SCUsageInputControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2SCUsageInputController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}