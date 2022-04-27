
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENTransportTemperature;
import com.ksoe.energynet.valueobject.filter.ENTransportTemperatureFilter;
import com.ksoe.energynet.valueobject.lists.ENTransportTemperatureShortList;

public interface ENTransportTemperatureController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENTransportTemperatureController";


  /*ENTransportTemperature. Добавить*/
  public int add(ENTransportTemperature aENTransportTemperature) throws java.rmi.RemoteException;

  /*ENTransportTemperature. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. Изменить*/
  public void save(ENTransportTemperature aENTransportTemperature) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. Получить объект*/
  public ENTransportTemperature getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENTransportTemperature. Получить полный список*/
  public ENTransportTemperatureShortList getList() throws  java.rmi.RemoteException;

  /*ENTransportTemperature. Получить список по фильтру*/
  public ENTransportTemperatureShortList getFilteredList(ENTransportTemperatureFilter aENTransportTemperatureFilter) throws  java.rmi.RemoteException;  
  
  /*ENTransportTemperature. Получить список для просмотра*/
  public ENTransportTemperatureShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENTransportTemperature. Получить список для просмотра по фильтру*/
  public ENTransportTemperatureShortList getScrollableFilteredList(ENTransportTemperatureFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENTransportTemperature. Получить список для просмотра по условию*/
  public ENTransportTemperatureShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

    /*EENTransportTemperature. Получить список ПК-кодов по фильтру*/
  public int[] getScrollableFilteredCodeArray(ENTransportTemperatureFilter filterObject, int fromPosition, int quantity) throws java.rmi.RemoteException;

  }