
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENHumenItem;
import com.ksoe.energynet.valueobject.filter.ENHumenItemFilter;
import com.ksoe.energynet.valueobject.lists.ENHumenItemShortList;

public interface ENHumenItemController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENHumenItemController";


  /*ENHumenItem. Добавить*/
  public int add(ENHumenItem aENHumenItem) throws java.rmi.RemoteException;

  /*ENHumenItem. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;
  public void remove(int anObjectCode, boolean isFromWorkOrderByt) throws  java.rmi.RemoteException;
  
  /*ENHumenItem. Изменить*/
  public void save(ENHumenItem aENHumenItem) throws  java.rmi.RemoteException;
  public void save(ENHumenItem object, boolean isFromWorkOrderByt) throws java.rmi.RemoteException;

  /*ENHumenItem. Получить объект*/
  public ENHumenItem getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENHumenItem. Получить полный список*/
  public ENHumenItemShortList getList() throws  java.rmi.RemoteException;

  /*ENHumenItem. Получить список по фильтру*/
  public ENHumenItemShortList getFilteredList(ENHumenItemFilter aENHumenItemFilter) throws  java.rmi.RemoteException;  
  
  /*ENHumenItem. Получить список для просмотра*/
  public ENHumenItemShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENHumenItem. Получить список для просмотра по фильтру*/
  public ENHumenItemShortList getScrollableFilteredList(ENHumenItemFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENHumenItem. Получить список для просмотра по условию*/
  public ENHumenItemShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }