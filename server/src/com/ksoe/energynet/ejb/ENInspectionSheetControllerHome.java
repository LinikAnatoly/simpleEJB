
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENInspectionSheet;
 *
 */

public interface ENInspectionSheetControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENInspectionSheetController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}