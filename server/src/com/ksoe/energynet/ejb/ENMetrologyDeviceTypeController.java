
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyDeviceType;
import com.ksoe.energynet.valueobject.filter.ENMetrologyDeviceTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyDeviceTypeShortList;

public interface ENMetrologyDeviceTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyDeviceTypeController";


  /*ENMetrologyDeviceType. Добавить*/
  public int add(ENMetrologyDeviceType aENMetrologyDeviceType) throws java.rmi.RemoteException;

  /*ENMetrologyDeviceType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. Изменить*/
  public void save(ENMetrologyDeviceType aENMetrologyDeviceType) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. Получить объект*/
  public ENMetrologyDeviceType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. Получить полный список*/
  public ENMetrologyDeviceTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyDeviceType. Получить список по фильтру*/
  public ENMetrologyDeviceTypeShortList getFilteredList(ENMetrologyDeviceTypeFilter aENMetrologyDeviceTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDeviceType. Получить список для просмотра*/
  public ENMetrologyDeviceTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyDeviceType. Получить список для просмотра по фильтру*/
  public ENMetrologyDeviceTypeShortList getScrollableFilteredList(ENMetrologyDeviceTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyDeviceType. Получить список для просмотра по условию*/
  public ENMetrologyDeviceTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }