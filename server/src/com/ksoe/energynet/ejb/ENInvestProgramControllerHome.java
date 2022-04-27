
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENInvestProgram;
 *
 */

public interface ENInvestProgramControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENInvestProgramController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}