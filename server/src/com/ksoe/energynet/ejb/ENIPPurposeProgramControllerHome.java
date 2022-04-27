
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPPurposeProgram;
 *
 */

public interface ENIPPurposeProgramControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPPurposeProgramController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}