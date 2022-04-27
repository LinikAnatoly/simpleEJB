
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBuilderObjectType;
import com.ksoe.energynet.valueobject.filter.ENBuilderObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilderObjectTypeShortList;

public interface ENBuilderObjectTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBuilderObjectTypeController";


  /*ENBuilderObjectType. ��������*/
  public int add(ENBuilderObjectType aENBuilderObjectType) throws java.rmi.RemoteException;

  /*ENBuilderObjectType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. ��������*/
  public void save(ENBuilderObjectType aENBuilderObjectType) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. �������� ������*/
  public ENBuilderObjectType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. �������� ������ ������*/
  public ENBuilderObjectTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. �������� ������ �� �������*/
  public ENBuilderObjectTypeShortList getFilteredList(ENBuilderObjectTypeFilter aENBuilderObjectTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObjectType. �������� ������ ��� ���������*/
  public ENBuilderObjectTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObjectType. �������� ������ ��� ��������� �� �������*/
  public ENBuilderObjectTypeShortList getScrollableFilteredList(ENBuilderObjectTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBuilderObjectType. �������� ������ ��� ��������� �� �������*/
  public ENBuilderObjectTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }