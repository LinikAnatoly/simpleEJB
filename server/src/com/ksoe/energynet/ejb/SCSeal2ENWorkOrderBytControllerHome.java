
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCSeal2ENWorkOrderByt;
 *
 */

public interface SCSeal2ENWorkOrderBytControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCSeal2ENWorkOrderBytController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}