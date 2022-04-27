
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENManningTable;
import com.ksoe.energynet.valueobject.filter.ENManningTableFilter;
import com.ksoe.energynet.valueobject.lists.ENManningTableShortList;

public interface ENManningTableController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENManningTableController";


  /*ENManningTable. Добавить*/
  public int add(ENManningTable aENManningTable) throws java.rmi.RemoteException;

  /*ENManningTable. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable. Изменить*/
  public void save(ENManningTable aENManningTable) throws  java.rmi.RemoteException;

  /*ENManningTable. Получить объект*/
  public ENManningTable getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENManningTable. Получить полный список*/
  public ENManningTableShortList getList() throws  java.rmi.RemoteException;

  /*ENManningTable. Получить список по фильтру*/
  public ENManningTableShortList getFilteredList(ENManningTableFilter aENManningTableFilter) throws  java.rmi.RemoteException;  
  
  /*ENManningTable. Получить список для просмотра*/
  public ENManningTableShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENManningTable. Получить список для просмотра по фильтру*/
  public ENManningTableShortList getScrollableFilteredList(ENManningTableFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENManningTable. Получить список для просмотра по условию*/
  public ENManningTableShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }