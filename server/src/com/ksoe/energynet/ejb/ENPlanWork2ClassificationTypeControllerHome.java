
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWork2ClassificationType;  
  * 	
  */
  

public interface ENPlanWork2ClassificationTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWork2ClassificationTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

