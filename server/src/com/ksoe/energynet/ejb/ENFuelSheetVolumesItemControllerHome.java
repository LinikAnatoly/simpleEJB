
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelSheetVolumesItem;
 *
 */

public interface ENFuelSheetVolumesItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelSheetVolumesItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}