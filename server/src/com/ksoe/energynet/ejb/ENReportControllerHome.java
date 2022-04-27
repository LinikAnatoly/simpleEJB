package com.ksoe.energynet.ejb;

public interface ENReportControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENReportController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}
