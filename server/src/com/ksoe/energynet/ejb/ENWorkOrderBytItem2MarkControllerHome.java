
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENWorkOrderBytItem2Mark;
 *
 */

public interface ENWorkOrderBytItem2MarkControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENWorkOrderBytItem2MarkController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}