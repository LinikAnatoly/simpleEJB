
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelInventarizationStatus;
 *
 */

public interface ENFuelInventarizationStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelInventarizationStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}