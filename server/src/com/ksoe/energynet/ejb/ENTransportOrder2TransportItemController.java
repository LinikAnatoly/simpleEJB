
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportOrder2TransportItem;
import com.ksoe.energynet.valueobject.filter.ENTransportOrder2TransportItemFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrder2TransportItemShortList;

public interface ENTransportOrder2TransportItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportOrder2TransportItemController";


  /*ENTransportOrder2TransportItem. ��������*/
  public int add(ENTransportOrder2TransportItem aENTransportOrder2TransportItem) throws java.rmi.RemoteException;

  /*ENTransportOrder2TransportItem. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder2TransportItem. ��������*/
  public void save(ENTransportOrder2TransportItem aENTransportOrder2TransportItem) throws  java.rmi.RemoteException;

  /*ENTransportOrder2TransportItem. �������� ������*/
  public ENTransportOrder2TransportItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrder2TransportItem. �������� ������ ������*/
  public ENTransportOrder2TransportItemShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportOrder2TransportItem. �������� ������ �� �������*/
  public ENTransportOrder2TransportItemShortList getFilteredList(ENTransportOrder2TransportItemFilter aENTransportOrder2TransportItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrder2TransportItem. �������� ������ ��� ���������*/
  public ENTransportOrder2TransportItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrder2TransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrder2TransportItemShortList getScrollableFilteredList(ENTransportOrder2TransportItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportOrder2TransportItem. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrder2TransportItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportOrder2TransportItem. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportOrder2TransportItemFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }