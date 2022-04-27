
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportRouteDistance2TKFuelKoef;
import com.ksoe.energynet.valueobject.filter.ENTransportRouteDistance2TKFuelKoefFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportRouteDistance2TKFuelKoefShortList;

public interface ENTransportRouteDistance2TKFuelKoefController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportRouteDistance2TKFuelKoefController";


  /*ENTransportRouteDistance2TKFuelKoef. Добавить*/
  public int add(ENTransportRouteDistance2TKFuelKoef aENTransportRouteDistance2TKFuelKoef) throws java.rmi.RemoteException;

  /*ENTransportRouteDistance2TKFuelKoef. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance2TKFuelKoef. Изменить*/
  public void save(ENTransportRouteDistance2TKFuelKoef aENTransportRouteDistance2TKFuelKoef) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance2TKFuelKoef. Получить объект*/
  public ENTransportRouteDistance2TKFuelKoef getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance2TKFuelKoef. Получить полный список*/
  public ENTransportRouteDistance2TKFuelKoefShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportRouteDistance2TKFuelKoef. Получить список по фильтру*/
  public ENTransportRouteDistance2TKFuelKoefShortList getFilteredList(ENTransportRouteDistance2TKFuelKoefFilter aENTransportRouteDistance2TKFuelKoefFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportRouteDistance2TKFuelKoef. Получить список для просмотра*/
  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportRouteDistance2TKFuelKoef. Получить список для просмотра по фильтру*/
  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableFilteredList(ENTransportRouteDistance2TKFuelKoefFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportRouteDistance2TKFuelKoef. Получить список для просмотра по условию*/
  public ENTransportRouteDistance2TKFuelKoefShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportRouteDistance2TKFuelKoef. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportRouteDistance2TKFuelKoefFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }