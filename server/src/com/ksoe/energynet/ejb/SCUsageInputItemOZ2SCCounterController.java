
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZ2SCCounterFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZ2SCCounterShortList;

public interface SCUsageInputItemOZ2SCCounterController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZ2SCCounterController";


  /*SCUsageInputItemOZ2SCCounter. Добавить*/
  public int add(SCUsageInputItemOZ2SCCounter aSCUsageInputItemOZ2SCCounter) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. Изменить*/
  public void save(SCUsageInputItemOZ2SCCounter aSCUsageInputItemOZ2SCCounter) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. Получить объект*/
  public SCUsageInputItemOZ2SCCounter getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. Получить полный список*/
  public SCUsageInputItemOZ2SCCounterShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZ2SCCounter. Получить список по фильтру*/
  public SCUsageInputItemOZ2SCCounterShortList getFilteredList(SCUsageInputItemOZ2SCCounterFilter aSCUsageInputItemOZ2SCCounterFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2SCCounter. Получить список для просмотра*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZ2SCCounter. Получить список для просмотра по фильтру*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableFilteredList(SCUsageInputItemOZ2SCCounterFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZ2SCCounter. Получить список для просмотра по условию*/
  public SCUsageInputItemOZ2SCCounterShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZ2SCCounter. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZ2SCCounterFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }