
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPItemStatus;
 *
 */

public interface ENIPItemStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPItemStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}