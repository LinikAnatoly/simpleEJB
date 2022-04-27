
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for CNTechTerms;
  *
  */


public interface CNTechTermsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.CNTechTermsController create()
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

