
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENConnectionLevel;  
  * 	
  */
  

public interface ENConnectionLevelControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENConnectionLevelController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

