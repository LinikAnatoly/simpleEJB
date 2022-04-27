
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENReportAdditionZbytMetrology;
 *
 */

public interface ENReportAdditionZbytMetrologyControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENReportAdditionZbytMetrologyController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}