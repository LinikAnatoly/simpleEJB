
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActIncomServ2ENAct;
 *
 */

public interface ENActIncomServ2ENActControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActIncomServ2ENActController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}