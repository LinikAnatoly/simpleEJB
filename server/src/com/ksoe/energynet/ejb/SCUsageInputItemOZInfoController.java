
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputItemOZInfo;
import com.ksoe.energynet.valueobject.filter.SCUsageInputItemOZInfoFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputItemOZInfoShortList;

public interface SCUsageInputItemOZInfoController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputItemOZInfoController";


  /*SCUsageInputItemOZInfo. Добавить*/
  public int add(SCUsageInputItemOZInfo aSCUsageInputItemOZInfo) throws java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. Изменить*/
  public void save(SCUsageInputItemOZInfo aSCUsageInputItemOZInfo) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. Получить объект*/
  public SCUsageInputItemOZInfo getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. Получить полный список*/
  public SCUsageInputItemOZInfoShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputItemOZInfo. Получить список по фильтру*/
  public SCUsageInputItemOZInfoShortList getFilteredList(SCUsageInputItemOZInfoFilter aSCUsageInputItemOZInfoFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZInfo. Получить список для просмотра*/
  public SCUsageInputItemOZInfoShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputItemOZInfo. Получить список для просмотра по фильтру*/
  public SCUsageInputItemOZInfoShortList getScrollableFilteredList(SCUsageInputItemOZInfoFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputItemOZInfo. Получить список для просмотра по условию*/
  public SCUsageInputItemOZInfoShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputItemOZInfo. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputItemOZInfoFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }