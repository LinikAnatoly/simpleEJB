
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWarrant4Department;
 *
 */

public interface ENWarrant4DepartmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWarrant4DepartmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}