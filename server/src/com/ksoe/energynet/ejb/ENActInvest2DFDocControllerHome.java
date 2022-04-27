
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActInvest2DFDoc;
 *
 */

public interface ENActInvest2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActInvest2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}