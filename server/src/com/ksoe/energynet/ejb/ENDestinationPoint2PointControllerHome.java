
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDestinationPoint2Point;  
  * 	
  */
  

public interface ENDestinationPoint2PointControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDestinationPoint2PointController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}

