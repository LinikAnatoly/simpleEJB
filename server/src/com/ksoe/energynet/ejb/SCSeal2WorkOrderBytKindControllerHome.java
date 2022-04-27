
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSeal2WorkOrderBytKind;
 *
 */

public interface SCSeal2WorkOrderBytKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSeal2WorkOrderBytKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}