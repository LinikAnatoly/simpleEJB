
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.CNSubsystemType;
import com.ksoe.energynet.valueobject.filter.CNSubsystemTypeFilter;
import com.ksoe.energynet.valueobject.lists.CNSubsystemTypeShortList;

public interface CNSubsystemTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/CNSubsystemTypeController";


  /*CNSubsystemType. Добавить*/
  public int add(CNSubsystemType aCNSubsystemType) throws java.rmi.RemoteException;

  /*CNSubsystemType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNSubsystemType. Изменить*/
  public void save(CNSubsystemType aCNSubsystemType) throws  java.rmi.RemoteException;

  /*CNSubsystemType. Получить объект*/
  public CNSubsystemType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*CNSubsystemType. Получить полный список*/
  public CNSubsystemTypeShortList getList() throws  java.rmi.RemoteException;

  /*CNSubsystemType. Получить список по фильтру*/
  public CNSubsystemTypeShortList getFilteredList(CNSubsystemTypeFilter aCNSubsystemTypeFilter) throws  java.rmi.RemoteException;  
  
  /*CNSubsystemType. Получить список для просмотра*/
  public CNSubsystemTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*CNSubsystemType. Получить список для просмотра по фильтру*/
  public CNSubsystemTypeShortList getScrollableFilteredList(CNSubsystemTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*CNSubsystemType. Получить список для просмотра по условию*/
  public CNSubsystemTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }