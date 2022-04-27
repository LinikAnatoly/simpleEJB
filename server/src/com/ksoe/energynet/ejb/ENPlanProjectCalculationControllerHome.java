
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanProjectCalculation;
 *
 */

public interface ENPlanProjectCalculationControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanProjectCalculationController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}