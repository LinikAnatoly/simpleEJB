
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENReconstrModernOZ2DFDoc;
 *
 */

public interface ENReconstrModernOZ2DFDocControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENReconstrModernOZ2DFDocController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}