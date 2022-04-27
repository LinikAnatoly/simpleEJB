
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanWork2ActFailure;
 *
 */

public interface ENPlanWork2ActFailureControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanWork2ActFailureController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}