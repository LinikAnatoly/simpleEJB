
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENMetrologyObject;
import com.ksoe.energynet.valueobject.filter.ENMetrologyObjectFilter;
import com.ksoe.energynet.valueobject.lists.ENMetrologyObjectShortList;

public interface ENMetrologyObjectController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENMetrologyObjectController";


  /*ENMetrologyObject. Добавить*/
  public int add(ENMetrologyObject aENMetrologyObject) throws java.rmi.RemoteException;

  /*ENMetrologyObject. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. Изменить*/
  public void save(ENMetrologyObject aENMetrologyObject) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. Получить объект*/
  public ENMetrologyObject getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENMetrologyObject. Получить полный список*/
  public ENMetrologyObjectShortList getList() throws  java.rmi.RemoteException;

  /*ENMetrologyObject. Получить список по фильтру*/
  public ENMetrologyObjectShortList getFilteredList(ENMetrologyObjectFilter aENMetrologyObjectFilter) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyObject. Получить список для просмотра*/
  public ENMetrologyObjectShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENMetrologyObject. Получить список для просмотра по фильтру*/
  public ENMetrologyObjectShortList getScrollableFilteredList(ENMetrologyObjectFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENMetrologyObject. Получить список для просмотра по условию*/
  public ENMetrologyObjectShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }