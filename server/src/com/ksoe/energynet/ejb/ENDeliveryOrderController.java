
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDeliveryOrder;
import com.ksoe.energynet.valueobject.filter.ENDeliveryOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryOrderShortList;

public interface ENDeliveryOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDeliveryOrderController";


  /*ENDeliveryOrder. ��������*/
  public int add(ENDeliveryOrder aENDeliveryOrder) throws java.rmi.RemoteException;

  /*ENDeliveryOrder. ��������*/
  public int addForTransportOrder(ENDeliveryOrder aENDeliveryOrder) throws java.rmi.RemoteException;

  /*ENDeliveryOrder. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. ��������*/
  public void save(ENDeliveryOrder aENDeliveryOrder) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. �������� ������*/
  public ENDeliveryOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. �������� ������ ������*/
  public ENDeliveryOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENDeliveryOrder. �������� ������ �� �������*/
  public ENDeliveryOrderShortList getFilteredList(ENDeliveryOrderFilter aENDeliveryOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryOrder. �������� ������ ��� ���������*/
  public ENDeliveryOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryOrder. �������� ������ ��� ��������� �� �������*/
  public ENDeliveryOrderShortList getScrollableFilteredList(ENDeliveryOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDeliveryOrder. �������� ������ ��� ��������� �� �������*/
  public ENDeliveryOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }