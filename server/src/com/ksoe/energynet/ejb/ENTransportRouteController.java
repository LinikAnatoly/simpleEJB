
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRoute;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteShortList;

public interface ENTransportRouteController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRouteController";


  /*ENTransportRoute. Добавить*/
  public int add(ENTransportRoute aENTransportRoute) throws java.rmi.RemoteException;
  public int add(ENTransportRoute aENTransportRoute, boolean isForTravelSheet) throws java.rmi.RemoteException;
  
  /*ENTransportRoute. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute. Изменить*/
  public void save(ENTransportRoute aENTransportRoute) throws  java.rmi.RemoteException;
  public void save(ENTransportRoute object, boolean isForTravelSheet)  throws java.rmi.RemoteException;

  /*ENTransportRoute. Получить объект*/
  public ENTransportRoute getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRoute. Получить полный список*/
  public ENTransportRouteShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRoute. Получить список по фильтру*/
  public ENTransportRouteShortList getFilteredList(ENTransportRouteFilter aENTransportRouteFilter) throws  java.rmi.RemoteException;

  /*ENTransportRoute. Получить список для просмотра*/
  public ENTransportRouteShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTransportRoute. Получить список для просмотра по фильтру*/
  public ENTransportRouteShortList getScrollableFilteredList(ENTransportRouteFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;

  /*ENTransportRoute. Получить список для просмотра по условию*/
  public ENTransportRouteShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  /* ENTransportRoute. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportRouteFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  /* ENTransportRoute(Маршрут).Разнести показания спидометра */
  public void saveRoute2TravelSheetItem(ENTransportRoute aENTransportRoute) throws java.rmi.RemoteException;

 }