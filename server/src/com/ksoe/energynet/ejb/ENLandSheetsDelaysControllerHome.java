
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENLandSheetsDelays;
 *
 */

public interface ENLandSheetsDelaysControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENLandSheetsDelaysController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}