
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCCounterStatus;
import com.ksoe.energynet.valueobject.filter.SCCounterStatusFilter;
import com.ksoe.energynet.valueobject.lists.SCCounterStatusShortList;

public interface SCCounterStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCCounterStatusController";


  /*SCCounterStatus. Добавить*/
  public int add(SCCounterStatus aSCCounterStatus) throws java.rmi.RemoteException;

  /*SCCounterStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterStatus. Изменить*/
  public void save(SCCounterStatus aSCCounterStatus) throws  java.rmi.RemoteException;

  /*SCCounterStatus. Получить объект*/
  public SCCounterStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCCounterStatus. Получить полный список*/
  public SCCounterStatusShortList getList() throws  java.rmi.RemoteException;

  /*SCCounterStatus. Получить список по фильтру*/
  public SCCounterStatusShortList getFilteredList(SCCounterStatusFilter aSCCounterStatusFilter) throws  java.rmi.RemoteException;  
  
  /*SCCounterStatus. Получить список для просмотра*/
  public SCCounterStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCCounterStatus. Получить список для просмотра по фильтру*/
  public SCCounterStatusShortList getScrollableFilteredList(SCCounterStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCCounterStatus. Получить список для просмотра по условию*/
  public SCCounterStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCCounterStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCCounterStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }