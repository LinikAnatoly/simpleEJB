
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2FinInfoProv;
 *
 */

public interface ENAct2FinInfoProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2FinInfoProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}