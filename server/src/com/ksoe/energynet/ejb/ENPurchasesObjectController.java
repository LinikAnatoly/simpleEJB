
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENPurchasesObject;
import com.ksoe.energynet.valueobject.filter.ENPurchasesObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENPurchasesObjectShortList;

public interface ENPurchasesObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENPurchasesObjectController";


  /*ENPurchasesObject. Добавить*/
  public int add(ENPurchasesObject aENPurchasesObject) throws java.rmi.RemoteException;

  /*ENPurchasesObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. Изменить*/
  public void save(ENPurchasesObject aENPurchasesObject) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. Получить объект*/
  public ENPurchasesObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENPurchasesObject. Получить полный список*/
  public ENPurchasesObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENPurchasesObject. Получить список по фильтру*/
  public ENPurchasesObjectShortList getFilteredList(ENPurchasesObjectFilter aENPurchasesObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObject. Получить список для просмотра*/
  public ENPurchasesObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENPurchasesObject. Получить список для просмотра по фильтру*/
  public ENPurchasesObjectShortList getScrollableFilteredList(ENPurchasesObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENPurchasesObject. Получить список для просмотра по условию*/
  public ENPurchasesObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }