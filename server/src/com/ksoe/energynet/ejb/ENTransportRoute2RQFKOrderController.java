
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRoute2RQFKOrder;
import com.ksoe.energynet.valueobject.filter.ENTransportRoute2RQFKOrderFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRoute2RQFKOrderShortList;

public interface ENTransportRoute2RQFKOrderController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRoute2RQFKOrderController";


  /*ENTransportRoute2RQFKOrder. Добавить*/
  public int add(ENTransportRoute2RQFKOrder aENTransportRoute2RQFKOrder) throws java.rmi.RemoteException;

  /*ENTransportRoute2RQFKOrder. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQFKOrder. Изменить*/
  public void save(ENTransportRoute2RQFKOrder aENTransportRoute2RQFKOrder) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQFKOrder. Получить объект*/
  public ENTransportRoute2RQFKOrder getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQFKOrder. Получить полный список*/
  public ENTransportRoute2RQFKOrderShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRoute2RQFKOrder. Получить список по фильтру*/
  public ENTransportRoute2RQFKOrderShortList getFilteredList(ENTransportRoute2RQFKOrderFilter aENTransportRoute2RQFKOrderFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRoute2RQFKOrder. Получить список для просмотра*/
  public ENTransportRoute2RQFKOrderShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRoute2RQFKOrder. Получить список для просмотра по фильтру*/
  public ENTransportRoute2RQFKOrderShortList getScrollableFilteredList(ENTransportRoute2RQFKOrderFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRoute2RQFKOrder. Получить список для просмотра по условию*/
  public ENTransportRoute2RQFKOrderShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRoute2RQFKOrder. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportRoute2RQFKOrderFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }