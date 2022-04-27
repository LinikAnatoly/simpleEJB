
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDeliveryTime;
import com.ksoe.energynet.valueobject.filter.ENDeliveryTimeFilter;
import com.ksoe.energynet.valueobject.lists.ENDeliveryTimeShortList;

public interface ENDeliveryTimeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDeliveryTimeController";


  /*ENDeliveryTime. ��������*/
  public int add(ENDeliveryTime aENDeliveryTime) throws java.rmi.RemoteException;

  /*ENDeliveryTime. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryTime. ��������*/
  public void save(ENDeliveryTime aENDeliveryTime) throws  java.rmi.RemoteException;

  /*ENDeliveryTime. �������� ������*/
  public ENDeliveryTime getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDeliveryTime. �������� ������ ������*/
  public ENDeliveryTimeShortList getList() throws  java.rmi.RemoteException;

  /*ENDeliveryTime. �������� ������ �� �������*/
  public ENDeliveryTimeShortList getFilteredList(ENDeliveryTimeFilter aENDeliveryTimeFilter) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryTime. �������� ������ ��� ���������*/
  public ENDeliveryTimeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDeliveryTime. �������� ������ ��� ��������� �� �������*/
  public ENDeliveryTimeShortList getScrollableFilteredList(ENDeliveryTimeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDeliveryTime. �������� ������ ��� ��������� �� �������*/
  public ENDeliveryTimeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }