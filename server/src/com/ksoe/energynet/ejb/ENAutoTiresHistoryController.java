
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENAutoTiresHistory;
import com.ksoe.energynet.valueobject.filter.ENAutoTiresHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENAutoTiresHistoryShortList;

public interface ENAutoTiresHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENAutoTiresHistoryController";


  /*ENAutoTiresHistory. Добавить*/
  public int add(ENAutoTiresHistory aENAutoTiresHistory) throws java.rmi.RemoteException;

  /*ENAutoTiresHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresHistory. Изменить*/
  public void save(ENAutoTiresHistory aENAutoTiresHistory) throws  java.rmi.RemoteException;

  /*ENAutoTiresHistory. Получить объект*/
  public ENAutoTiresHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENAutoTiresHistory. Получить полный список*/
  public ENAutoTiresHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENAutoTiresHistory. Получить список по фильтру*/
  public ENAutoTiresHistoryShortList getFilteredList(ENAutoTiresHistoryFilter aENAutoTiresHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresHistory. Получить список для просмотра*/
  public ENAutoTiresHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENAutoTiresHistory. Получить список для просмотра по фильтру*/
  public ENAutoTiresHistoryShortList getScrollableFilteredList(ENAutoTiresHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENAutoTiresHistory. Получить список для просмотра по условию*/
  public ENAutoTiresHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENAutoTiresHistory. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENAutoTiresHistoryFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }