
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENNormativeVolumeAVZ;
 *
 */

public interface ENNormativeVolumeAVZControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENNormativeVolumeAVZController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}