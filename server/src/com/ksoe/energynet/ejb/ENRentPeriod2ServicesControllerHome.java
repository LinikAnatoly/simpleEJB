
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENRentPeriod2Services;
 *
 */

public interface ENRentPeriod2ServicesControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENRentPeriod2ServicesController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}