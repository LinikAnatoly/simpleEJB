
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPriorityCoefficient;
 *
 */

public interface ENPriorityCoefficientControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPriorityCoefficientController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}