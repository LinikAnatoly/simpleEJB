
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanWork2CCDamageLog;
 *
 */

public interface ENPlanWork2CCDamageLogControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanWork2CCDamageLogController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}