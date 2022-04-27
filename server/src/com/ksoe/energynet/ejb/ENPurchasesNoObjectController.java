
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPurchasesNoObject;
import com.ksoe.energynet.valueobject.filter.ENPurchasesNoObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesNoObjectShortList;

public interface ENPurchasesNoObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPurchasesNoObjectController";


  /*ENPurchasesNoObject. ��������*/
  public int add(ENPurchasesNoObject aENPurchasesNoObject) throws java.rmi.RemoteException;

  /*ENPurchasesNoObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObject. ��������*/
  public void save(ENPurchasesNoObject aENPurchasesNoObject) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObject. �������� ������*/
  public ENPurchasesNoObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesNoObject. �������� ������ ������*/
  public ENPurchasesNoObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENPurchasesNoObject. �������� ������ �� �������*/
  public ENPurchasesNoObjectShortList getFilteredList(ENPurchasesNoObjectFilter aENPurchasesNoObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesNoObject. �������� ������ ��� ���������*/
  public ENPurchasesNoObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesNoObject. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesNoObjectShortList getScrollableFilteredList(ENPurchasesNoObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPurchasesNoObject. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesNoObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }