
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBuildingCommissionType;
 *
 */

public interface ENBuildingCommissionTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBuildingCommissionTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}