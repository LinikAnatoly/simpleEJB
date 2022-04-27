
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENWorkOrderStatus;
import com.ksoe.energynet.valueobject.filter.ENWorkOrderStatusFilter;
import com.ksoe.energynet.valueobject.lists.ENWorkOrderStatusShortList;

public interface ENWorkOrderStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENWorkOrderStatusController";


  /*ENWorkOrderStatus. ��������*/
  public int add(ENWorkOrderStatus aENWorkOrderStatus) throws java.rmi.RemoteException;

  /*ENWorkOrderStatus. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWorkOrderStatus. ��������*/
  public void save(ENWorkOrderStatus aENWorkOrderStatus) throws  java.rmi.RemoteException;

  /*ENWorkOrderStatus. �������� ������*/
  public ENWorkOrderStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENWorkOrderStatus. �������� ������ ������*/
  public ENWorkOrderStatusShortList getList() throws  java.rmi.RemoteException;

  /*ENWorkOrderStatus. �������� ������ �� �������*/
  public ENWorkOrderStatusShortList getFilteredList(ENWorkOrderStatusFilter aENWorkOrderStatusFilter) throws  java.rmi.RemoteException;  
  
  /*ENWorkOrderStatus. �������� ������ ��� ���������*/
  public ENWorkOrderStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENWorkOrderStatus. �������� ������ ��� ��������� �� �������*/
  public ENWorkOrderStatusShortList getScrollableFilteredList(ENWorkOrderStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENWorkOrderStatus. �������� ������ ��� ��������� �� �������*/
  public ENWorkOrderStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }