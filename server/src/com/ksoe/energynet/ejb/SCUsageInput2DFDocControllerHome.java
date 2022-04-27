
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCUsageInput2DFDoc;
 *
 */

public interface SCUsageInput2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCUsageInput2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}