
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENOtherObject;  
  * 	
  */
  

public interface ENOtherObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENOtherObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

