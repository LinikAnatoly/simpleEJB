
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServFromSide2PlanWork;
 *
 */

public interface ENServFromSide2PlanWorkControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServFromSide2PlanWorkController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}