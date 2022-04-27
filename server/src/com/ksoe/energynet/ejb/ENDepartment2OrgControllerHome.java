
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDepartment2Org;
 *
 */

public interface ENDepartment2OrgControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDepartment2OrgController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}