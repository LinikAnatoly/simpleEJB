
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionCityType;
 *
 */

public interface ENConnectionCityTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENConnectionCityTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}