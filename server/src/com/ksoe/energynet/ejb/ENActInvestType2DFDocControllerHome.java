
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActInvestType2DFDoc;
 *
 */

public interface ENActInvestType2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActInvestType2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}