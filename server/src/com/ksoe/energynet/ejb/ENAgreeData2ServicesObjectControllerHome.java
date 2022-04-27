
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAgreeData2ServicesObject;
 *
 */

public interface ENAgreeData2ServicesObjectControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAgreeData2ServicesObjectController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}