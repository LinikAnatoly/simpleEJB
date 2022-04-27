
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechContragentForm;  
  * 	
  */
  

public interface ENTechContragentFormControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechContragentFormController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

