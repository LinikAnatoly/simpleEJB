
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActIncomServ2Prov;
 *
 */

public interface ENActIncomServ2ProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActIncomServ2ProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}