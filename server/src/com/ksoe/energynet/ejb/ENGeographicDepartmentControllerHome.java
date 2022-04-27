
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENGeographicDepartment;
 *
 */

public interface ENGeographicDepartmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENGeographicDepartmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}