
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPItem;
 *
 */

public interface ENIPItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}