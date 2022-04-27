
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENNormVolumeAVZItem;
 *
 */

public interface ENNormVolumeAVZItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENNormVolumeAVZItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}