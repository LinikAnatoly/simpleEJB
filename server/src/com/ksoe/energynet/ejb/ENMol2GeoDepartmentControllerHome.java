
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENMol2GeoDepartment;
 *
 */

public interface ENMol2GeoDepartmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENMol2GeoDepartmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}