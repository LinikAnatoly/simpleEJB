
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportOrderStatus;
import com.ksoe.energynet.valueobject.filter.ENTransportOrderStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportOrderStatusShortList;

public interface ENTransportOrderStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportOrderStatusController";


  /*ENTransportOrderStatus. ��������*/
  public int add(ENTransportOrderStatus aENTransportOrderStatus) throws java.rmi.RemoteException;

  /*ENTransportOrderStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. ��������*/
  public void save(ENTransportOrderStatus aENTransportOrderStatus) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. �������� ������*/
  public ENTransportOrderStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. �������� ������ ������*/
  public ENTransportOrderStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportOrderStatus. �������� ������ �� �������*/
  public ENTransportOrderStatusShortList getFilteredList(ENTransportOrderStatusFilter aENTransportOrderStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrderStatus. �������� ������ ��� ���������*/
  public ENTransportOrderStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportOrderStatus. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrderStatusShortList getScrollableFilteredList(ENTransportOrderStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportOrderStatus. �������� ������ ��� ��������� �� �������*/
  public ENTransportOrderStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportOrderStatus. �������� ������ ��-����� �� �������*/
  public int[] getScrollableFilteredCodeArray(ENTransportOrderStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }