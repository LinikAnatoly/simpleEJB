
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for RegulatoryAssetBaseCalculation;
 *
 */

public interface RegulatoryAssetBaseCalculationControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.RegulatoryAssetBaseCalculationController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}