
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelDistributionSheet;
 *
 */

public interface ENFuelDistributionSheetControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelDistributionSheetController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}