
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTravelSheetFuelType;
 *
 */

public interface ENTravelSheetFuelTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTravelSheetFuelTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}