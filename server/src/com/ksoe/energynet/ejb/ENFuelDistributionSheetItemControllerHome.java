
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelDistributionSheetItem;
 *
 */

public interface ENFuelDistributionSheetItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelDistributionSheetItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}