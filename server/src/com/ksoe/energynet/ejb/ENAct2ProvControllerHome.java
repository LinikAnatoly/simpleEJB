
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAct2Prov;
 *
 */

public interface ENAct2ProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAct2ProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}