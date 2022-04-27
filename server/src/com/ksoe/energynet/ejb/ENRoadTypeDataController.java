
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------
package com.ksoe.energynet.ejb;

import com.ksoe.energynet.valueobject.ENRoadTypeData;
import com.ksoe.energynet.valueobject.filter.ENRoadTypeDataFilter;
import com.ksoe.energynet.valueobject.lists.ENRoadTypeDataShortList;

public interface ENRoadTypeDataController extends javax.ejb.EJBObject
{
  public static final String JNDI_NAME = "ksoe/energynet/ENRoadTypeDataController";


  /*ENRoadTypeData. Добавить*/
  public int add(ENRoadTypeData aENRoadTypeData) throws java.rmi.RemoteException;

  /*ENRoadTypeData. Удалить*/
  public void remove(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadTypeData. Изменить*/
  public void save(ENRoadTypeData aENRoadTypeData) throws  java.rmi.RemoteException;

  /*ENRoadTypeData. Получить объект*/
  public ENRoadTypeData getObject(int anObjectCode) throws  java.rmi.RemoteException;

  /*ENRoadTypeData. Получить полный список*/
  public ENRoadTypeDataShortList getList() throws  java.rmi.RemoteException;

  /*ENRoadTypeData. Получить список по фильтру*/
  public ENRoadTypeDataShortList getFilteredList(ENRoadTypeDataFilter aENRoadTypeDataFilter) throws  java.rmi.RemoteException;  
  
  /*ENRoadTypeData. Получить список для просмотра*/
  public ENRoadTypeDataShortList getScrollableList(int aFromPosition, int aQuantity) throws  java.rmi.RemoteException;  
  
  /*ENRoadTypeData. Получить список для просмотра по фильтру*/
  public ENRoadTypeDataShortList getScrollableFilteredList(ENRoadTypeDataFilter aEPActFilter, int aFromPosition, int aQuantity) throws  java.rmi.RemoteException; 

  /*ENRoadTypeData. Получить список для просмотра по условию*/
  public ENRoadTypeDataShortList getScrollableListByCondition(String aCondition,int aFromPosition,int aQuantity) throws java.rmi.RemoteException;

  
  }