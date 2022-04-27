
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPurchasesObjectReason;
import com.ksoe.energynet.valueobject.filter.ENPurchasesObjectReasonFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesObjectReasonShortList;

public interface ENPurchasesObjectReasonController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPurchasesObjectReasonController";


  /*ENPurchasesObjectReason. Добавить*/
  public int add(ENPurchasesObjectReason aENPurchasesObjectReason) throws java.rmi.RemoteException;

  /*ENPurchasesObjectReason. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObjectReason. Изменить*/
  public void save(ENPurchasesObjectReason aENPurchasesObjectReason) throws  java.rmi.RemoteException;

  /*ENPurchasesObjectReason. Получить объект*/
  public ENPurchasesObjectReason getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObjectReason. Получить полный список*/
  public ENPurchasesObjectReasonShortList getList() throws  java.rmi.RemoteException;

  /*ENPurchasesObjectReason. Получить список по фильтру*/
  public ENPurchasesObjectReasonShortList getFilteredList(ENPurchasesObjectReasonFilter aENPurchasesObjectReasonFilter) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObjectReason. Получить список для просмотра*/
  public ENPurchasesObjectReasonShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObjectReason. Получить список для просмотра по фильтру*/
  public ENPurchasesObjectReasonShortList getScrollableFilteredList(ENPurchasesObjectReasonFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPurchasesObjectReason. Получить список для просмотра по условию*/
  public ENPurchasesObjectReasonShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }