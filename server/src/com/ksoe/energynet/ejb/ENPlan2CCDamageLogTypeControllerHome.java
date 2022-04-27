
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlan2CCDamageLogType;
 *
 */

public interface ENPlan2CCDamageLogTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlan2CCDamageLogTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}