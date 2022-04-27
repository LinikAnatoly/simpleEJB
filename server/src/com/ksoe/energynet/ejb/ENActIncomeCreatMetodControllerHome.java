
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActIncomeCreatMetod;
 *
 */

public interface ENActIncomeCreatMetodControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActIncomeCreatMetodController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}