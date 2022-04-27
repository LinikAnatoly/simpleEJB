
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlan2WorkOrderEntry;
 *
 */

public interface ENPlan2WorkOrderEntryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlan2WorkOrderEntryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}