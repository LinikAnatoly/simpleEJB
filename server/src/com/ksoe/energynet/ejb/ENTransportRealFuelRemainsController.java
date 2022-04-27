
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRealFuelRemains;
import com.ksoe.energynet.valueobject.filter.ENTransportRealFuelRemainsFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRealFuelRemainsShortList;

public interface ENTransportRealFuelRemainsController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRealFuelRemainsController";


  /*ENTransportRealFuelRemains. Добавить*/
  public int add(ENTransportRealFuelRemains aENTransportRealFuelRemains) throws java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. Изменить*/
  public void save(ENTransportRealFuelRemains aENTransportRealFuelRemains) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. Получить объект*/
  public ENTransportRealFuelRemains getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. Получить полный список*/
  public ENTransportRealFuelRemainsShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRealFuelRemains. Получить список по фильтру*/
  public ENTransportRealFuelRemainsShortList getFilteredList(ENTransportRealFuelRemainsFilter aENTransportRealFuelRemainsFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRealFuelRemains. Получить список для просмотра*/
  public ENTransportRealFuelRemainsShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRealFuelRemains. Получить список для просмотра по фильтру*/
  public ENTransportRealFuelRemainsShortList getScrollableFilteredList(ENTransportRealFuelRemainsFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRealFuelRemains. Получить список для просмотра по условию*/
  public ENTransportRealFuelRemainsShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRealFuelRemains. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportRealFuelRemainsFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }