
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.SCUsageInputStatus;
import com.ksoe.energynet.valueobject.filter.SCUsageInputStatusFilter;
import com.ksoe.energynet.valueobject.lists.SCUsageInputStatusShortList;

public interface SCUsageInputStatusController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/SCUsageInputStatusController";


  /*SCUsageInputStatus. Добавить*/
  public int add(SCUsageInputStatus aSCUsageInputStatus) throws java.rmi.RemoteException;

  /*SCUsageInputStatus. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputStatus. Изменить*/
  public void save(SCUsageInputStatus aSCUsageInputStatus) throws  java.rmi.RemoteException;

  /*SCUsageInputStatus. Получить объект*/
  public SCUsageInputStatus getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*SCUsageInputStatus. Получить полный список*/
  public SCUsageInputStatusShortList getList() throws  java.rmi.RemoteException;

  /*SCUsageInputStatus. Получить список по фильтру*/
  public SCUsageInputStatusShortList getFilteredList(SCUsageInputStatusFilter aSCUsageInputStatusFilter) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputStatus. Получить список для просмотра*/
  public SCUsageInputStatusShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*SCUsageInputStatus. Получить список для просмотра по фильтру*/
  public SCUsageInputStatusShortList getScrollableFilteredList(SCUsageInputStatusFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*SCUsageInputStatus. Получить список для просмотра по условию*/
  public SCUsageInputStatusShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*ESCUsageInputStatus. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(SCUsageInputStatusFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }