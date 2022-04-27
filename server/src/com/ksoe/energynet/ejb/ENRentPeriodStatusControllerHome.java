
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRentPeriodStatus;
 *
 */

public interface ENRentPeriodStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRentPeriodStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}