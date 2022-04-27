
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPurchasesNoObjectType;
import com.ksoe.energynet.valueobject.filter.ENPurchasesNoObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesNoObjectTypeShortList;

public interface ENPurchasesNoObjectTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPurchasesNoObjectTypeController";


  /*ENPurchasesNoObjectType. ��������*/
  public int add(ENPurchasesNoObjectType aENPurchasesNoObjectType) throws java.rmi.RemoteException;

  /*ENPurchasesNoObjectType. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObjectType. ��������*/
  public void save(ENPurchasesNoObjectType aENPurchasesNoObjectType) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObjectType. �������� ������*/
  public ENPurchasesNoObjectType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObjectType. �������� ������ ������*/
  public ENPurchasesNoObjectTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENPurchasesNoObjectType. �������� ������ �� �������*/
  public ENPurchasesNoObjectTypeShortList getFilteredList(ENPurchasesNoObjectTypeFilter aENPurchasesNoObjectTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesNoObjectType. �������� ������ ��� ���������*/
  public ENPurchasesNoObjectTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesNoObjectType. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesNoObjectTypeShortList getScrollableFilteredList(ENPurchasesNoObjectTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPurchasesNoObjectType. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesNoObjectTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }