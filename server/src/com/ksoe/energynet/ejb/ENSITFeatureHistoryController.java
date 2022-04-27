
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENSITFeatureHistory;
import com.ksoe.energynet.valueobject.filter.ENSITFeatureHistoryFilter;
import com.ksoe.energynet.valueobject.lists.ENSITFeatureHistoryShortList;

public interface ENSITFeatureHistoryController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENSITFeatureHistoryController";


  /*ENSITFeatureHistory. Добавить*/
  public int add(ENSITFeatureHistory aENSITFeatureHistory) throws java.rmi.RemoteException;

  /*ENSITFeatureHistory. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. Изменить*/
  public void save(ENSITFeatureHistory aENSITFeatureHistory) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. Получить объект*/
  public ENSITFeatureHistory getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. Получить полный список*/
  public ENSITFeatureHistoryShortList getList() throws  java.rmi.RemoteException;

  /*ENSITFeatureHistory. Получить список по фильтру*/
  public ENSITFeatureHistoryShortList getFilteredList(ENSITFeatureHistoryFilter aENSITFeatureHistoryFilter) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureHistory. Получить список для просмотра*/
  public ENSITFeatureHistoryShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENSITFeatureHistory. Получить список для просмотра по фильтру*/
  public ENSITFeatureHistoryShortList getScrollableFilteredList(ENSITFeatureHistoryFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENSITFeatureHistory. Получить список для просмотра по условию*/
  public ENSITFeatureHistoryShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }