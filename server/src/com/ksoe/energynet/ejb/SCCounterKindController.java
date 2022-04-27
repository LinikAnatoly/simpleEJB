
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCCounterKind;
import com.ksoe.energynet.valueobject.filter.SCCounterKindFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterKindShortList;

public interface SCCounterKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterKindController";


  /*SCCounterKind. Добавить*/
  public int add(SCCounterKind aSCCounterKind) throws java.rmi.RemoteException;

  /*SCCounterKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterKind. Изменить*/
  public void save(SCCounterKind aSCCounterKind) throws  java.rmi.RemoteException;

  /*SCCounterKind. Получить объект*/
  public SCCounterKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterKind. Получить полный список*/
  public SCCounterKindShortList getList() throws  java.rmi.RemoteException;

  /*SCCounterKind. Получить список по фильтру*/
  public SCCounterKindShortList getFilteredList(SCCounterKindFilter aSCCounterKindFilter) throws  java.rmi.RemoteException;  
  
  /*SCCounterKind. Получить список для просмотра*/
  public SCCounterKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCCounterKind. Получить список для просмотра по фильтру*/
  public SCCounterKindShortList getScrollableFilteredList(SCCounterKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCCounterKind. Получить список для просмотра по условию*/
  public SCCounterKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounterKind. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCCounterKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }