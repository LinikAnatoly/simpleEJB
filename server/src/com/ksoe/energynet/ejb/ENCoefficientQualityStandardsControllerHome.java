
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCoefficientQualityStandards;
 *
 */

public interface ENCoefficientQualityStandardsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCoefficientQualityStandardsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}