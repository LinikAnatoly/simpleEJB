
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENBuilderObject;
import com.ksoe.energynet.valueobject.filter.ENBuilderObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENBuilderObjectShortList;

public interface ENBuilderObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENBuilderObjectController";


  /*ENBuilderObject. Добавить*/
  public int add(ENBuilderObject aENBuilderObject) throws java.rmi.RemoteException;

  /*ENBuilderObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObject. Изменить*/
  public void save(ENBuilderObject aENBuilderObject) throws  java.rmi.RemoteException;

  /*ENBuilderObject. Получить объект*/
  public ENBuilderObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENBuilderObject. Получить полный список*/
  public ENBuilderObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENBuilderObject. Получить список по фильтру*/
  public ENBuilderObjectShortList getFilteredList(ENBuilderObjectFilter aENBuilderObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObject. Получить список для просмотра*/
  public ENBuilderObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENBuilderObject. Получить список для просмотра по фильтру*/
  public ENBuilderObjectShortList getScrollableFilteredList(ENBuilderObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENBuilderObject. Получить список для просмотра по условию*/
  public ENBuilderObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }