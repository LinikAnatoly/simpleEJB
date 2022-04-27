
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportDep2Dep;
import com.ksoe.energynet.valueobject.filter.ENTransportDep2DepFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportDep2DepShortList;

public interface ENTransportDep2DepController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportDep2DepController";


  /*ENTransportDep2Dep. ��������*/
  public int add(ENTransportDep2Dep aENTransportDep2Dep) throws java.rmi.RemoteException;

  /*ENTransportDep2Dep. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDep2Dep. ��������*/
  public void save(ENTransportDep2Dep aENTransportDep2Dep) throws  java.rmi.RemoteException;

  /*ENTransportDep2Dep. �������� ������*/
  public ENTransportDep2Dep getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportDep2Dep. �������� ������ ������*/
  public ENTransportDep2DepShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportDep2Dep. �������� ������ �� �������*/
  public ENTransportDep2DepShortList getFilteredList(ENTransportDep2DepFilter aENTransportDep2DepFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportDep2Dep. �������� ������ ��� ���������*/
  public ENTransportDep2DepShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportDep2Dep. �������� ������ ��� ��������� �� �������*/
  public ENTransportDep2DepShortList getScrollableFilteredList(ENTransportDep2DepFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportDep2Dep. �������� ������ ��� ��������� �� �������*/
  public ENTransportDep2DepShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportDep2Dep. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportDep2DepFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }