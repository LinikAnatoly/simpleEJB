
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENInspectionSheetItem;
 *
 */

public interface ENInspectionSheetItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENInspectionSheetItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}