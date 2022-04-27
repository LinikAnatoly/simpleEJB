
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanWorkItem2Graph;
 *
 */

public interface ENPlanWorkItem2GraphControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanWorkItem2GraphController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}