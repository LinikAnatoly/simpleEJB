
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENEstimateItemStatusHistory;
import com.ksoe.energynet.valueobject.filter.ENEstimateItemStatusHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENEstimateItemStatusHistoryShortList;

public interface ENEstimateItemStatusHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENEstimateItemStatusHistoryController";


  /*ENEstimateItemStatusHistory. Добавить*/
  public int add(ENEstimateItemStatusHistory aENEstimateItemStatusHistory) throws java.rmi.RemoteException;

  /*ENEstimateItemStatusHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatusHistory. Изменить*/
  public void save(ENEstimateItemStatusHistory aENEstimateItemStatusHistory) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatusHistory. Получить объект*/
  public ENEstimateItemStatusHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENEstimateItemStatusHistory. Получить полный список*/
  public ENEstimateItemStatusHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENEstimateItemStatusHistory. Получить список по фильтру*/
  public ENEstimateItemStatusHistoryShortList getFilteredList(ENEstimateItemStatusHistoryFilter aENEstimateItemStatusHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemStatusHistory. Получить список для просмотра*/
  public ENEstimateItemStatusHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENEstimateItemStatusHistory. Получить список для просмотра по фильтру*/
  public ENEstimateItemStatusHistoryShortList getScrollableFilteredList(ENEstimateItemStatusHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENEstimateItemStatusHistory. Получить список для просмотра по условию*/
  public ENEstimateItemStatusHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }