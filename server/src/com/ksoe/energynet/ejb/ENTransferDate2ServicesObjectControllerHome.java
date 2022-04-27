
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTransferDate2ServicesObject;
 *
 */

public interface ENTransferDate2ServicesObjectControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTransferDate2ServicesObjectController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}