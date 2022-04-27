
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportRoute2RQTransportInvoice;  
  * 	
  */
  

public interface ENTransportRoute2RQTransportInvoiceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportRoute2RQTransportInvoiceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

