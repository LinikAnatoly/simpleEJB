
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanWork2RQAllocationList;
 *
 */

public interface ENPlanWork2RQAllocationListControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanWork2RQAllocationListController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}