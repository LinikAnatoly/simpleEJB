
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAccumulatorsHistory;
import com.ksoe.energynet.valueobject.filter.ENAccumulatorsHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAccumulatorsHistoryShortList;

public interface ENAccumulatorsHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAccumulatorsHistoryController";


  /*ENAccumulatorsHistory. Добавить*/
  public int add(ENAccumulatorsHistory aENAccumulatorsHistory) throws java.rmi.RemoteException;

  /*ENAccumulatorsHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. Изменить*/
  public void save(ENAccumulatorsHistory aENAccumulatorsHistory) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. Получить объект*/
  public ENAccumulatorsHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. Получить полный список*/
  public ENAccumulatorsHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENAccumulatorsHistory. Получить список по фильтру*/
  public ENAccumulatorsHistoryShortList getFilteredList(ENAccumulatorsHistoryFilter aENAccumulatorsHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsHistory. Получить список для просмотра*/
  public ENAccumulatorsHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAccumulatorsHistory. Получить список для просмотра по фильтру*/
  public ENAccumulatorsHistoryShortList getScrollableFilteredList(ENAccumulatorsHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAccumulatorsHistory. Получить список для просмотра по условию*/
  public ENAccumulatorsHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAccumulatorsHistory. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAccumulatorsHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }