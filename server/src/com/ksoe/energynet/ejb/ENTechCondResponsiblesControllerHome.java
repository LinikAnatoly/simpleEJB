
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechCondResponsibles;  
  * 	
  */
  

public interface ENTechCondResponsiblesControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechCondResponsiblesController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

