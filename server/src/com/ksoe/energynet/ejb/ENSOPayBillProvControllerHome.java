
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOPayBillProv;
 *
 */

public interface ENSOPayBillProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOPayBillProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}