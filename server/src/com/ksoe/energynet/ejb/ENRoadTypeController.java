
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRoadType;
import com.ksoe.energynet.valueobject.filter.ENRoadTypeFilter;
import com.ksoe.energynet.valueobject.lists.ENRoadTypeShortList;

public interface ENRoadTypeController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRoadTypeController";


  /*ENRoadType. Добавить*/
  public int add(ENRoadType aENRoadType) throws java.rmi.RemoteException;

  /*ENRoadType. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadType. Изменить*/
  public void save(ENRoadType aENRoadType) throws  java.rmi.RemoteException;

  /*ENRoadType. Получить объект*/
  public ENRoadType getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadType. Получить полный список*/
  public ENRoadTypeShortList getList() throws  java.rmi.RemoteException;

  /*ENRoadType. Получить список по фильтру*/
  public ENRoadTypeShortList getFilteredList(ENRoadTypeFilter aENRoadTypeFilter) throws  java.rmi.RemoteException;  
  
  /*ENRoadType. Получить список для просмотра*/
  public ENRoadTypeShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRoadType. Получить список для просмотра по фильтру*/
  public ENRoadTypeShortList getScrollableFilteredList(ENRoadTypeFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRoadType. Получить список для просмотра по условию*/
  public ENRoadTypeShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }