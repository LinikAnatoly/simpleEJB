
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSpravMol;  
  * 	
  */
  

public interface ENSpravMolControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSpravMolController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

