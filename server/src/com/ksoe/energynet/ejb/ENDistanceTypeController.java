
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENDistanceType;
import com.ksoe.energynet.valueobject.filter.ENDistanceTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENDistanceTypeShortList;

public interface ENDistanceTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENDistanceTypeController";


  /*ENDistanceType. Добавить*/
  public int add(ENDistanceType aENDistanceType) throws java.rmi.RemoteException;

  /*ENDistanceType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistanceType. Изменить*/
  public void save(ENDistanceType aENDistanceType) throws  java.rmi.RemoteException;

  /*ENDistanceType. Получить объект*/
  public ENDistanceType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENDistanceType. Получить полный список*/
  public ENDistanceTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENDistanceType. Получить список по фильтру*/
  public ENDistanceTypeShortList getFilteredList(ENDistanceTypeFilter aENDistanceTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENDistanceType. Получить список для просмотра*/
  public ENDistanceTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENDistanceType. Получить список для просмотра по фильтру*/
  public ENDistanceTypeShortList getScrollableFilteredList(ENDistanceTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENDistanceType. Получить список для просмотра по условию*/
  public ENDistanceTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }