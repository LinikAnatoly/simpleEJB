
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBuilderObjectType;
import com.ksoe.energynet.valueobject.filter.ENBuilderObjectTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilderObjectTypeShortList;

public interface ENBuilderObjectTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBuilderObjectTypeController";


  /*ENBuilderObjectType. Добавить*/
  public int add(ENBuilderObjectType aENBuilderObjectType) throws java.rmi.RemoteException;

  /*ENBuilderObjectType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. Изменить*/
  public void save(ENBuilderObjectType aENBuilderObjectType) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. Получить объект*/
  public ENBuilderObjectType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. Получить полный список*/
  public ENBuilderObjectTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENBuilderObjectType. Получить список по фильтру*/
  public ENBuilderObjectTypeShortList getFilteredList(ENBuilderObjectTypeFilter aENBuilderObjectTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObjectType. Получить список для просмотра*/
  public ENBuilderObjectTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObjectType. Получить список для просмотра по фильтру*/
  public ENBuilderObjectTypeShortList getScrollableFilteredList(ENBuilderObjectTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBuilderObjectType. Получить список для просмотра по условию*/
  public ENBuilderObjectTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }