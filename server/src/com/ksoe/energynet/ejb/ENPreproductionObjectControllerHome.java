
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPreproductionObject;  
  * 	
  */
  

public interface ENPreproductionObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPreproductionObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

