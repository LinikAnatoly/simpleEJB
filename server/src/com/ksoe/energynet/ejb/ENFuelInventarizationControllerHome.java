
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelInventarization;
 *
 */

public interface ENFuelInventarizationControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelInventarizationController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}