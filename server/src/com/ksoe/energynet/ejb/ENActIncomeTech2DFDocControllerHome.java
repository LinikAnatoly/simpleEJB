
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActIncomeTech2DFDoc;
 *
 */

public interface ENActIncomeTech2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActIncomeTech2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}