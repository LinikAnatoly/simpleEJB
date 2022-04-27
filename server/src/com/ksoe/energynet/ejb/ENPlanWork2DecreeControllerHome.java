
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPlanWork2Decree;
 *
 */

public interface ENPlanWork2DecreeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPlanWork2DecreeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}