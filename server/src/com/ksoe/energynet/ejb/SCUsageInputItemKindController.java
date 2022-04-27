
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemKind;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemKindFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemKindShortList;

public interface SCUsageInputItemKindController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemKindController";


  /*SCUsageInputItemKind. Добавить*/
  public int add(SCUsageInputItemKind aSCUsageInputItemKind) throws java.rmi.RemoteException;

  /*SCUsageInputItemKind. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemKind. Изменить*/
  public void save(SCUsageInputItemKind aSCUsageInputItemKind) throws  java.rmi.RemoteException;

  /*SCUsageInputItemKind. Получить объект*/
  public SCUsageInputItemKind getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemKind. Получить полный список*/
  public SCUsageInputItemKindShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemKind. Получить список по фильтру*/
  public SCUsageInputItemKindShortList getFilteredList(SCUsageInputItemKindFilter aSCUsageInputItemKindFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemKind. Получить список для просмотра*/
  public SCUsageInputItemKindShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemKind. Получить список для просмотра по фильтру*/
  public SCUsageInputItemKindShortList getScrollableFilteredList(SCUsageInputItemKindFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemKind. Получить список для просмотра по условию*/
  public SCUsageInputItemKindShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemKind. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemKindFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }