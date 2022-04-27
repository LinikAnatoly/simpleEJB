
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENGeoDep2ENDepartment;
 *
 */

public interface ENGeoDep2ENDepartmentControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENGeoDep2ENDepartmentController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}