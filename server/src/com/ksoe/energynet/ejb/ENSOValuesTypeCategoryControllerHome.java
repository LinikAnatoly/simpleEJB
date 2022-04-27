
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOValuesTypeCategory;
 *
 */

public interface ENSOValuesTypeCategoryControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOValuesTypeCategoryController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}