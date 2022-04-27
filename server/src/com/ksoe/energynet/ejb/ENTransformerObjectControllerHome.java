
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransformerObject;  
  * 	
  */
  

public interface ENTransformerObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransformerObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

