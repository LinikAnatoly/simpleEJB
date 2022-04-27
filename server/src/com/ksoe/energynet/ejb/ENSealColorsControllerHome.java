
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSealColors;
 *
 */

public interface ENSealColorsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSealColorsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}