
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSOTechParams;
 *
 */

public interface ENSOTechParamsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSOTechParamsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}