
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPurchasesObject;
import com.ksoe.energynet.valueobject.filter.ENPurchasesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesObjectShortList;

public interface ENPurchasesObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPurchasesObjectController";


  /*ENPurchasesObject. ��������*/
  public int add(ENPurchasesObject aENPurchasesObject) throws java.rmi.RemoteException;

  /*ENPurchasesObject. �������*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. ��������*/
  public void save(ENPurchasesObject aENPurchasesObject) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. �������� ������*/
  public ENPurchasesObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. �������� ������ ������*/
  public ENPurchasesObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENPurchasesObject. �������� ������ �� �������*/
  public ENPurchasesObjectShortList getFilteredList(ENPurchasesObjectFilter aENPurchasesObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObject. �������� ������ ��� ���������*/
  public ENPurchasesObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObject. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPurchasesObject. �������� ������ ��� ��������� �� �������*/
  public ENPurchasesObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }